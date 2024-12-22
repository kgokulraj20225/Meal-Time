import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:meal_time/allfun.dart';
import 'package:meal_time/main.dart';
import 'package:http/http.dart' as http;
import '../home_page/homepage.addaddress.dart';

class address_add {
  int? id;
  String? fullName;
  String? areaBuilding;
  String? houseFlatNumber;
  int? pinCode;
  String? city;
  String? email;

  address_add(
      {this.id,
      this.fullName,
      this.areaBuilding,
      this.houseFlatNumber,
      this.pinCode,
      this.city,
      this.email});

  address_add.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    fullName = json['full_name'];
    areaBuilding = json['area_building'];
    houseFlatNumber = json['house_flat_number'];
    pinCode = json['pin_code'];
    city = json['city'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['full_name'] = this.fullName;
    data['area_building'] = this.areaBuilding;
    data['house_flat_number'] = this.houseFlatNumber;
    data['pin_code'] = this.pinCode;
    data['city'] = this.city;
    data['email'] = this.email;
    return data;
  }
}

class save_address extends StatefulWidget {
  const save_address({super.key});

  @override
  State<save_address> createState() => _save_addressState();
}

class _save_addressState extends State<save_address> {
  @override
  Widget build(BuildContext context) {
    final scr = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: text("My Addressess", Colors.black, 20, FontWeight.bold),
        actions: [
          IconButton(onPressed: () {}, icon: Icon(Icons.search)),
          IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
        ],
        bottom: PreferredSize(
            preferredSize: Size.fromHeight(40),
            child: Card(
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => add_address()));
                },
                child: Container(
                  // color: Colors.red,
                  height: 50,
                  width: scr.width * 1,
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.only(right: 198.0),
                    child: text("+ Add new Address", Color(0xfffc6111), 16,
                        FontWeight.bold),
                  )),
                ),
              ),
            )),
      ),
      body: addresss(),
    );
  }
}

class addresss extends StatefulWidget {
  const addresss({super.key});

  @override
  State<addresss> createState() => _addresssState();
}

class _addresssState extends State<addresss> {
  List<address_add> addressadd = [];
  String? error;
  bool isloading = true;

  @override
  void initState() {
    super.initState();
    address();
  }

  Future<void> address() async {
    final url = Uri.parse('http://$ip:8000/addressadd_app/addres_add/');
    try {
      final response = await http.get(url);

      // print('Response status: ${response.statusCode}');
      // print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        List<dynamic> get = jsonDecode(response.body);
        setState(() {
          addressadd = get.map((data) => address_add.fromJson(data)).toList();
          isloading = false;
        });
      } else {
        setState(() {
          error = "failed to load add_address";
          isloading = false;
        });
      }
    } catch (e) {
      setState(() {
        error = e.toString();
        isloading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(8.0),
        child:

            // Provide bounded height to ListView.builder
            SizedBox(
          height: 400, // Fixed height for the list
          child: ListView.builder(
            shrinkWrap: true,
            physics: NeverScrollableScrollPhysics(),
            itemCount: addressadd.length,
            itemBuilder: (context, index) {
              var addadd = addressadd[index];

              return addadd.fullName != null
                  ? Padding(
                      padding: EdgeInsets.only(top: 8.0),
                      child: Container(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            text("${addadd.fullName}", Colors.black, 19,
                                FontWeight.bold),
                            text(
                                "${addadd.houseFlatNumber},${addadd.areaBuilding},\n${addadd.city},${addadd.pinCode}",
                                Colors.black,
                                18,
                                FontWeight.bold),
                          ],
                        ),
                      ),
                    )
                  : Text("no data");
            },
          ),
        ),
      ),
    );
  }
}
