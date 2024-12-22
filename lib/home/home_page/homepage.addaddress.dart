import 'package:flutter/material.dart';
import 'package:meal_time/allfun.dart';
import 'package:meal_time/home/home_page/buying_food.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:http/http.dart' as http;
import 'package:meal_time/main.dart';
// import 'package:meal_time/login_details/registry.dart';
import 'dart:convert';
// import 'package:shared_preferences/shared_preferences.dart';
import 'homepage.order_place.dart';

class add_address extends StatefulWidget {
  const add_address({super.key});

  @override
  State<add_address> createState() => _add_addressState();
}

class _add_addressState extends State<add_address> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent, // Transparent AppBar
            elevation: 0, // Remove shadow
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  // Your cart functionality here
                },
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          body: address(),
        ));
  }
}

class address extends StatefulWidget {
  const address({super.key});

  @override
  State<address> createState() => _addressState();
}

class _addressState extends State<address> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _fullname = TextEditingController();
  final TextEditingController _area = TextEditingController();
  final TextEditingController _houseno = TextEditingController();
  final TextEditingController _pincode = TextEditingController();
  final TextEditingController _city = TextEditingController();
  final TextEditingController _emailadd = TextEditingController();

  Future<void> _address() async {
    String fullname = _fullname.text;
    String area = _area.text;
    String houseno = _houseno.text;
    String pincode = _pincode.text;
    String city = _city.text;
    String emailadd = _emailadd.text;

    try {
      final response = await http.post(
          Uri.parse('http://$ip:8000/addressadd_app/addres_add/'),
          headers: {"Content-Type": "application/json"},
          body: jsonEncode({
            'full_name': fullname,
            'area_building': area,
            'house_flat_number': houseno,
            'pin_code': pincode,
            'city': city,
            'email': emailadd
          }));
      if (response.statusCode == 201) {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => order_place()));
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text("add address successfull")));
      } else {
        print('add address failed:${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("add address failed: ${response.body}")));
      }
    } catch (e) {
      print('Error occurred: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("An error occurred: $e")));
    }
    // if (_form.currentState!.validate()) {
    //   SharedPreferences prefe = await SharedPreferences.getInstance();
    //   await prefe.setBool("addaddress", true);
    //   await prefe.setString("fullname", fullname);
    //   await prefe.setString("area", area);
    //   await prefe.setString("houseno", houseno);
    //   await prefe.setString("pincode", pincode);
    //   await prefe.setString("city", city);
    //   await prefe.setString("emailadd", emailadd);
    //
    //   Navigator.pushReplacement(
    //       context, MaterialPageRoute(builder: (context) => order_place()));
    // }
  }

  @override
  Widget build(BuildContext context) {
    final a = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Stack(
        alignment: Alignment.bottomCenter,
        children: [
          Container(
            height: a.height * 1,
            width: a.width * 1,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU="))),
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            height: a.height * 0.80,
            width: a.width * 1,
            decoration: BoxDecoration(
                color: Color(0xfffdfdfd),
                borderRadius: BorderRadius.vertical(top: Radius.circular(30))),
            child: Padding(
              padding: EdgeInsets.only(left: 20.0, right: 20),
              child: Form(
                key: _form,
                child: ListView(
                  children: [
                    text("Meal Time", Colors.black, 26, FontWeight.bold),
                    // Padding(
                    //   padding: EdgeInsets.only(top: 8.0),
                    //   child: Row(
                    //     children: [
                    //       CircleAvatar(
                    //         backgroundImage: NetworkImage(
                    //             "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU="),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.only(left: 8.0),
                    //         child: text("Bill Summary", Colors.black, 16,
                    //             FontWeight.bold),
                    //       ),
                    //       Padding(
                    //         padding: EdgeInsets.only(left: 38.0),
                    //         child: text("Total ₹$add1", Colors.black, 20,
                    //             FontWeight.bold),
                    //       ),
                    //       IconButton(
                    //           onPressed: () {},
                    //           icon: Icon(FontAwesomeIcons.arrowDownWideShort))
                    //     ],
                    //   ),
                    // ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: text(
                          "Address Details", Colors.black, 20, FontWeight.bold),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 30.0),
                      child: addresstextfield(
                          Colors.white,
                          Colors.transparent,
                          Color(0xfffc6111).withOpacity(0.6),
                          0,
                          Offset(0, 0),
                          BorderRadius.circular(0),
                          EdgeInsets.only(left: 25),
                          "Full Name",
                          "Your full name",
                          "please enter your name",
                          _fullname,
                          TextInputType.name),
                    ),
                    addresstextfield(
                        Colors.white,
                        Colors.transparent,
                        Color(0xfffc6111).withOpacity(0.6),
                        0,
                        Offset(0, 0),
                        BorderRadius.circular(0),
                        EdgeInsets.only(left: 25),
                        "Area / Building Name",
                        "Search Your area or building name...",
                        "please enter your area or building",
                        _area,
                        TextInputType.streetAddress),
                    addresstextfield(
                        Colors.white,
                        Colors.transparent,
                        Color(0xfffc6111).withOpacity(0.6),
                        0,
                        Offset(0, 0),
                        BorderRadius.circular(0),
                        EdgeInsets.only(left: 25),
                        "House/flat/Block number",
                        "For ex: House no.12(optional)",
                        "please enter house no",
                        _houseno,
                        TextInputType.streetAddress),
                    addresstextfield(
                        Colors.white,
                        Colors.transparent,
                        Color(0xfffc6111).withOpacity(0.6),
                        0,
                        Offset(0, 0),
                        BorderRadius.circular(0),
                        EdgeInsets.only(left: 25),
                        "Pin code",
                        "For ex: 607106",
                        "please enter pincode",
                        _pincode,
                        TextInputType.number),
                    addresstextfield(
                      Colors.white,
                      Colors.transparent,
                      Color(0xfffc6111).withOpacity(0.6),
                      0,
                      Offset(0, 0),
                      BorderRadius.circular(0),
                      EdgeInsets.only(left: 25),
                      "City",
                      "For Ex: Cuddalore",
                      "please enter your city",
                      _city,
                      TextInputType.streetAddress,
                    ),
                    addresstextfield(
                        Colors.white,
                        Colors.transparent,
                        Color(0xfffc6111).withOpacity(0.6),
                        0,
                        Offset(0, 0),
                        BorderRadius.circular(0),
                        EdgeInsets.only(left: 25),
                        "Email Address",
                        "For ex: abc@gmail.com",
                        "please your email",
                        _emailadd,
                        TextInputType.emailAddress),
                    GestureDetector(
                      onTap: _address,
                      child: Container(
                        height: 50,
                        margin: EdgeInsets.symmetric(
                            horizontal: 10.0, vertical: 20.0),
                        color: Color(0xfffc6111),
                        child: Center(
                            child: text(
                                "continue", Colors.white, 20, FontWeight.bold)),
                      ),
                    ),
                    Container(
                      height: 100,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
