import 'package:flutter/material.dart';
import 'package:meal_time/allfun.dart';
import 'package:http/http.dart' as http;
import 'package:meal_time/home/food_home_page/Juice.dart';
import 'package:meal_time/main.dart';
import 'dart:convert';
import 'dart:io';

import 'package:shared_preferences/shared_preferences.dart';

class credit_card {
  int? id;
  int? cardNumber;
  int? month;
  int? year;
  int? securityCode;
  String? firstName;
  String? lastName;

  credit_card(
      {this.id,
      this.cardNumber,
      this.month,
      this.year,
      this.securityCode,
      this.firstName,
      this.lastName});

  credit_card.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    cardNumber = json['card_number'];
    month = json['month'];
    year = json['year'];
    securityCode = json['security_code'];
    firstName = json['first_name'];
    lastName = json['last_name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['card_number'] = this.cardNumber;
    data['month'] = this.month;
    data['year'] = this.year;
    data['security_code'] = this.securityCode;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    return data;
  }
}

class payament extends StatefulWidget {
  const payament({super.key});

  @override
  State<payament> createState() => _payamentState();
}

class _payamentState extends State<payament> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdfdfd),
      appBar: AppBar(
        title: text("Payment Details", Colors.black, 25, FontWeight.bold),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                size: 25,
                color: Colors.black,
              )),
        ],
        backgroundColor: Color(0xfffdfdfd),
      ),
      body: details(),
    );
  }
}

class details extends StatefulWidget {
  const details({super.key});

  @override
  State<details> createState() => _detailsState();
}

class _detailsState extends State<details> {
  List<credit_card> creditcard = [];
  bool isLoading = true;
  String? errorMessage;

  @override
  void initState() {
    super.initState();
    credit();
  }

  Future<void> deleteCreditCard(int cardId) async {
    final url =
        Uri.parse('http://$ip:8000/Addcredit_app/creditcard_edit/$cardId/');

    try {
      final response = await http.delete(url);

      if (response.statusCode == 204) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Credit card deleted successfully')),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Failed to delete credit card')),
        );
      }
    } catch (error) {
      print('Error: $error');
    }
  }

  Future<void> credit() async {
    final url = Uri.parse('http://$ip:8000/Addcredit_app/credit_add/');
    try {
      final response = await http.get(url);
      if (response.statusCode == 200) {
        List<dynamic> jsonResponse = jsonDecode(response.body);
        setState(() {
          creditcard =
              jsonResponse.map((data) => credit_card.fromJson(data)).toList();
          isLoading = false;
        });
      } else {
        setState(() {
          errorMessage = "failed to load credit_card";
          isLoading = false;
        });
      }
    } catch (e) {
      setState(() {
        errorMessage = e.toString();
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final scrrr = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.only(left: 20.0),
              child: text("Customize your payment method", Colors.black, 16,
                  FontWeight.bold),
            ),
            Padding(
              padding: EdgeInsets.all(18.0),
              child: Divider(
                color: Colors.grey,
                thickness: 1, // Customize the thickness of the line
                indent: 15, // Adds left padding to the line
                endIndent: 15,
              ),
            ),
            ListView.builder(
                shrinkWrap: true, // To limit the height based on content
                physics: NeverScrollableScrollPhysics(),
                itemCount: creditcard.length,
                itemBuilder: (context, index) {
                  var credittcard = creditcard[index];

                  return credittcard.id != null
                      ? Padding(
                          padding: const EdgeInsets.only(top: 8.0),
                          child: Center(
                            child: Container(
                              width: 350,
                              height: 220,
                              decoration: BoxDecoration(
                                color: Colors.orange[400],
                                // color: Color(0xfffc6111),
                                borderRadius: BorderRadius.circular(20),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.black12,
                                    blurRadius: 10,
                                    spreadRadius: 5,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 20),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    // Visa Logo
                                    Align(
                                      alignment: Alignment.topRight,
                                      child: Text(
                                        'VISA',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 20,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),
                                    SizedBox(height: 20),

                                    // Card Number
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          '${credittcard.cardNumber ?? 0000000000000000}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 22,
                                            letterSpacing: 2.0,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        OutlinedButton(
                                          onPressed: () async {
                                            // Call the delete function with the card ID
                                            await deleteCreditCard(credittcard
                                                .id!); // Make sure to handle null ID

                                            // Optionally refresh the credit card list after deletion
                                            setState(() {
                                              creditcard.removeAt(
                                                  index); // Remove the card from the local list
                                            });
                                          },
                                          style: OutlinedButton.styleFrom(
                                            side: BorderSide(
                                                color: Colors
                                                    .white), // Set border color
                                            shape: RoundedRectangleBorder(
                                              borderRadius:
                                                  BorderRadius.circular(
                                                      20), // Rounded corners
                                            ),
                                          ),
                                          child: Text(
                                            'Delete Card',
                                            style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              color: Colors.white, // Text color
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(height: 30),

                                    // Card Holder and Expiry Date Row
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        // Card Holder Name
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Card holder name',
                                              style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              '${credittcard.firstName ?? "Unknown"} ${credittcard.lastName ?? "User"}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),

                                        // Expiry Date
                                        Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Expiry Date',
                                              style: TextStyle(
                                                color: Colors.white60,
                                                fontSize: 12,
                                              ),
                                            ),
                                            Text(
                                              '${credittcard.month ?? 00}/${credittcard.year ?? 00}',
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 16,
                                                fontWeight: FontWeight.w500,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        )
                      : Center(
                          child: Container(
                            width: 350,
                            height: 220,
                            decoration: BoxDecoration(
                              color: Colors.orange[400],
                              borderRadius: BorderRadius.circular(20),
                              boxShadow: [
                                BoxShadow(
                                  color: Colors.black12,
                                  blurRadius: 10,
                                  spreadRadius: 5,
                                )
                              ],
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 20),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  // Visa Logo
                                  Align(
                                    alignment: Alignment.topRight,
                                    child: Text(
                                      'VISA',
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ),
                                  SizedBox(height: 20),

                                  // Card Number
                                  Text(
                                    'xxxx xxxx xxx',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 22,
                                      letterSpacing: 2.0,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  SizedBox(height: 30),

                                  // Card Holder and Expiry Date Row
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      // Card Holder Name
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Card holder name',
                                            style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'name',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),

                                      // Expiry Date
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            'Expiry Date',
                                            style: TextStyle(
                                              color: Colors.white60,
                                              fontSize: 12,
                                            ),
                                          ),
                                          Text(
                                            'mm/yy',
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 16,
                                              fontWeight: FontWeight.w500,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        );
                }),
            Padding(
              padding: EdgeInsets.only(left: 28.0, right: 28, top: 30),
              child: GestureDetector(
                onTap: () {
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => a()));
                  showBottomSheet(
                      context: context,
                      builder: (context) {
                        return aa();
                      });
                },
                child: Container(
                  margin: EdgeInsets.only(bottom: 20), // Adjusting margin
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(45),
                    color: Color(0xfffc6111),
                  ),
                  height: 65,

                  width: scrrr.width * 1,
                  child: Center(
                    child: Text(
                      "+ Add Another Credit/Debit Card",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: 100,
            )
          ],
        ),
      ),
    );
  }
}

class aa extends StatefulWidget {
  const aa({super.key});

  @override
  State<aa> createState() => _aaState();
}

class _aaState extends State<aa> {
  bool _canRemoveCard = false;
  final _form = GlobalKey<FormState>();
  final TextEditingController _card_number = TextEditingController();
  final TextEditingController _mm = TextEditingController();
  final TextEditingController _yyyy = TextEditingController();
  final TextEditingController _security_code = TextEditingController();
  final TextEditingController _first_name = TextEditingController();
  final TextEditingController _second_name = TextEditingController();

  Future<void> _credit_card() async {
    String card_number = _card_number.text;
    String mm = _mm.text;
    String yyyy = _yyyy.text;
    String security_code = _security_code.text;
    String first_name = _first_name.text;
    String second_name = _second_name.text;

    try {
      final response = await http.post(
        Uri.parse('http://$ip:8000/Addcredit_app/credit_add/'),
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'card_number': card_number,
          'month': mm,
          'year': yyyy,
          'security_code': security_code,
          'first_name': first_name,
          'last_name': second_name,
        }),
      );

      if (response.statusCode == 201) {
        SharedPreferences perf = await SharedPreferences.getInstance();
        await perf.setString("card_number", card_number);
        await perf.setString("mm", mm);
        await perf.setString("yyyy", yyyy);
        await perf.setString("security_code", security_code);
        await perf.setString("first_name", first_name);
        await perf.setString("second_name", second_name);
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("add credit_card successfull")));
        Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (context) => payament()));
      } else {
        print('add credit_card failed:${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("add credit_card failed: ${response.body}")));
      }
    } catch (e) {
      print('Error occurred: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("An error occurred: $e")));
    }
  }

  @override
  Widget build(BuildContext context) {
    final scrrr = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Stack(
        children: [
          Container(
            height: 680,
            width: scrrr.width * 1,
            decoration: BoxDecoration(
              boxShadow: [
                BoxShadow(
                    // blurRadius: 850,
                    spreadRadius: 300,
                    color: Colors.grey.withOpacity(0.7))
              ],
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(30),
                topLeft: Radius.circular(30),
              ),
              color: Color(0xfffdfdfd),
            ),
            child: Form(
              key: _form,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 25),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("Add Credit/Debit Card", Colors.black, 16,
                            FontWeight.bold),
                        Padding(
                          padding: EdgeInsets.only(right: 20.0),
                          child: IconButton(
                              onPressed: () {
                                Navigator.pop(context);
                              },
                              icon: Icon(
                                Icons.close,
                                color: Colors.black,
                              )),
                        )
                      ],
                    ),
                  ),
                  Divider(
                    color: Colors.grey,
                    thickness: 0.5, // Customize the thickness of the line
                    indent: 25, // Adds left padding to the line
                    endIndent: 35,
                  ),
                  Flexible(
                    child: textfielld2(
                      Colors.grey.withOpacity(0.2),
                      Colors.grey.withOpacity(0.6),
                      Color(0xfffc6111),
                      BorderRadius.circular(30),
                      EdgeInsets.all(20),
                      30,
                      10,
                      "Card Number",
                      "Please enter your Card Number",
                      _card_number,
                      TextInputType.number,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, top: 10),
                    child: Row(
                      children: [
                        text("Expiry", Colors.black, 16, FontWeight.bold),
                        Padding(
                            padding: EdgeInsets.only(left: 60.0),
                            child: Flexible(
                              child: datetextfielld2(
                                  Colors.grey.withOpacity(0.2),
                                  Colors.grey.withOpacity(0.6),
                                  Color(0xfffc6111),
                                  BorderRadius.circular(30),
                                  EdgeInsets.only(left: 28, bottom: 10),
                                  50.0,
                                  80.0,
                                  _mm,
                                  "MM",
                                  'mm',
                                  TextInputType.datetime),
                            )),
                        Padding(
                          padding: EdgeInsets.only(left: 50.0),
                          child: Flexible(
                            child: datetextfielld2(
                                Colors.grey.withOpacity(0.2),
                                Colors.grey.withOpacity(0.6),
                                Color(0xfffc6111),
                                BorderRadius.circular(30),
                                EdgeInsets.only(
                                  left: 30,
                                ),
                                50.0,
                                100.0,
                                _yyyy,
                                "yyyy",
                                'yyyy',
                                TextInputType.datetime),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 10.0),
                    child: Flexible(
                      child: textfielld2(
                        Colors.grey.withOpacity(0.2),
                        Colors.grey.withOpacity(0.6),
                        Color(0xfffc6111),
                        BorderRadius.circular(30),
                        EdgeInsets.all(20),
                        30,
                        10,
                        "Security Code",
                        'Please enter the security code',
                        _security_code,
                        TextInputType.number,
                      ),
                    ),
                  ),
                  Flexible(
                    child: textfielld2(
                      Colors.grey.withOpacity(0.2),
                      Colors.grey.withOpacity(0.6),
                      Color(0xfffc6111),
                      BorderRadius.circular(30),
                      EdgeInsets.all(20),
                      30,
                      10,
                      "First Name",
                      'Please enter your First Name',
                      _first_name,
                      TextInputType.name,
                    ),
                  ),
                  Flexible(
                    child: textfielld2(
                      Colors.grey.withOpacity(0.2),
                      Colors.grey.withOpacity(0.6),
                      Color(0xfffc6111),
                      BorderRadius.circular(30),
                      EdgeInsets.all(20),
                      30,
                      10,
                      "Last Name",
                      'Please enter your Last Name',
                      _second_name,
                      TextInputType.name,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 25.0, top: 10),
                    child: Row(
                      children: [
                        text("You can remove this card\nat anytime",
                            Colors.black.withOpacity(0.4), 16, FontWeight.bold),
                        Padding(
                          padding: EdgeInsets.only(left: 90.0),
                          child: Switch(
                            activeColor: Color(0xfffc6111),
                            value: _canRemoveCard,
                            onChanged: (value) {
                              setState(() {
                                _canRemoveCard = value;
                              });
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 60.0, top: 10),
                    child: GestureDetector(
                      onTap: () {
                        if (_form.currentState!.validate()) {
                          _credit_card();
                        }
                      },
                      child: Padding(
                        padding: EdgeInsets.only(bottom: 28.0),
                        child: Container(
                          margin:
                              EdgeInsets.only(bottom: 40), // Adjusting margin
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color: Color(0xfffc6111),
                          ),
                          height: 57,

                          width: scrrr.width * 0.7,
                          child: Center(
                            child: Text(
                              "+ Add Card",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 17,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// class addcrd extends StatefulWidget {
//   @override
//   State<addcrd> createState() => _addcrdState();
// }
//
// class _addcrdState extends State<addcrd> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           title: Text('Payment Details'),
//         ),
//         body: PaymentForm(),
//       ),
//     );
//   }
// }
//
// class PaymentForm extends StatefulWidget {
//   @override
//   _PaymentFormState createState() => _PaymentFormState();
// }
//
// class _PaymentFormState extends State<PaymentForm> {
//   final _formKey = GlobalKey<FormState>();
//   bool _canRemoveCard = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return Padding(
//       padding: const EdgeInsets.all(16.0),
//       child: Form(
//         key: _formKey,
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.stretch,
//           children: [
//             Text(
//               'Add Credit/Debit Card',
//               style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
//             ),
//             SizedBox(height: 16),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Card Number',
//                 border: OutlineInputBorder(borderSide: BorderSide.none),
//               ),
//               keyboardType: TextInputType.number,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your card number';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Expanded(
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'MM',
//                       border: OutlineInputBorder(),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'MM';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//                 SizedBox(width: 16),
//                 Expanded(
//                   child: TextFormField(
//                     decoration: InputDecoration(
//                       labelText: 'YY',
//                       border: OutlineInputBorder(),
//                     ),
//                     keyboardType: TextInputType.number,
//                     validator: (value) {
//                       if (value == null || value.isEmpty) {
//                         return 'YY';
//                       }
//                       return null;
//                     },
//                   ),
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Security Code',
//                 border: OutlineInputBorder(),
//               ),
//               keyboardType: TextInputType.number,
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter the security code';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 16),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'First Name',
//                 border: OutlineInputBorder(),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your first name';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 16),
//             TextFormField(
//               decoration: InputDecoration(
//                 labelText: 'Last Name',
//                 border: OutlineInputBorder(),
//               ),
//               validator: (value) {
//                 if (value == null || value.isEmpty) {
//                   return 'Please enter your last name';
//                 }
//                 return null;
//               },
//             ),
//             SizedBox(height: 16),
//             Row(
//               children: [
//                 Text('You can remove this card at anytime'),
//                 Switch(
//                   activeColor: Color(0xfffc6111),
//                   value: _canRemoveCard,
//                   onChanged: (value) {
//                     setState(() {
//                       _canRemoveCard = value;
//                     });
//                   },
//                 ),
//               ],
//             ),
//             SizedBox(height: 16),
//             ElevatedButton(
//               onPressed: () {
//                 if (_formKey.currentState!.validate()) {
//                   // Process the payment
//                 }
//               },
//               child: Text('Add Card'),
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: Colors.orange, // Set the background color
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
