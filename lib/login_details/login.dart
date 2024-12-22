import 'package:flutter/material.dart';
import 'package:meal_time/home/home.dart';
import 'package:meal_time/login_details/reset%20password.dart';
import 'package:meal_time/main.dart';
import 'package:meal_time/login_details/registry.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../allfun.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

class LoginApp extends StatefulWidget {
  @override
  State<LoginApp> createState() => _LoginAppState();
}

class _LoginAppState extends State<LoginApp> {
  @override
  Widget build(BuildContext context) {
    return PopScope(
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xfffc6111),
          body: LoginPage(),
        ),
        theme: ThemeData(
          primaryColor: Color(0xfffc6111),
        ),
      ),
    );
  }
}

class LoginPage extends StatefulWidget {
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // List<> user =[];
  final TextEditingController _username = TextEditingController();
  final TextEditingController _password = TextEditingController();
  bool _obscureText = true;
  final _form = GlobalKey<FormState>();
  String a = "";
  String b = "";
  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  // void initState() {
  //   super.initState();
  //   _login();
  // }

  // Future<void> _login() async {
  //   SharedPreferences perf = await SharedPreferences.getInstance();
  //   await perf.setBool("login", true);
  //   setState(() {
  //     a = perf.getString("name") ?? "no value";
  //     b = perf.getString("userpassword") ?? "no value";
  //   });
  //   if (_form.currentState!.validate()) {
  //     if (_username.text == a && _password.text == b) {
  //       Navigator.pushReplacement(context,
  //           MaterialPageRoute(builder: (context) => HomePageWithTabs()));
  //     } else {
  //       ScaffoldMessenger.of(context).showSnackBar(
  //           SnackBar(content: Text("Invalid username or password")));
  //     }
  //   }
  // }

  Future<void> _login() async {
    if (_form.currentState!.validate()) {
      final String apiurl = "http://$ip:8000/Authentication_app/login/";

      try {
        final response = await http.post(Uri.parse(apiurl),
            headers: {
              'Content-Type': 'application/json',
            },
            body: jsonEncode(
                {"username": _username.text, "password": _password.text}));
        if (response.statusCode == 200) {
          final data = jsonDecode(response.body);
          SharedPreferences pref = await SharedPreferences.getInstance();
          await pref.setBool("login", true);
          await pref.setString("access", data['access']);
          await pref.setString("refresh", data['refresh']);

          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomePageWithTabs()), // Replace with your home page
          );
        } else {
          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text('Invalid username or password')),
          );
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error: $e')),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Container(
      height: screenSize.height * 1,
      child: SingleChildScrollView(
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(height: screenSize.height * 0.11),
              Padding(
                padding: const EdgeInsets.all(24.0),
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  height: screenSize.height * 0.755,
                  // height: 650,
                  decoration: BoxDecoration(
                    color: Color(0xfffdfdfd),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100.0),
                      bottomLeft: Radius.circular(100.0),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 2.0),
                    child: ListView(
                      // mainAxisAlignment: MainAxisAlignment.center,
                      // crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: text(
                              "LogIn", Color(0xfffc6111), 38, FontWeight.bold),
                        ),
                        SizedBox(height: screenSize.height * 0.05),
                        textfiellld(
                            Colors.grey,
                            Color(0xfffc6111),
                            BorderRadius.circular(30),
                            Icons.person,
                            EdgeInsets.only(left: 25),
                            "User name/ Email",
                            _username,
                            TextInputType.name),
                        SizedBox(height: screenSize.height * 0.02),
                        Container(
                          margin: EdgeInsets.symmetric(
                              horizontal: 30.0, vertical: 10.0),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            // color: Color(0xfffdfdfd),
                            // boxShadow: [
                            //   BoxShadow(
                            //       color: Colors.grey,
                            //       blurRadius: 9,
                            //       offset: Offset(0, 8),
                            //       spreadRadius: 3)
                            // ]
                          ),
                          child: TextFormField(
                            controller: _password,
                            keyboardType: TextInputType.visiblePassword,
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return "please enter your password";
                              }
                              return null;
                            },
                            obscureText: _obscureText,
                            cursorColor: Color(0xfffc6111),
                            onChanged: (value) {},
                            decoration: InputDecoration(
                              labelText: "Password",
                              labelStyle: TextStyle(color: Color(0xfffc6111)),
                              contentPadding: EdgeInsets.only(left: 25),
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(30),
                              ),
                              suffixIcon: IconButton(
                                icon: Icon(
                                  _obscureText
                                      ? Icons.visibility
                                      : Icons.visibility_off,
                                ),
                                onPressed: _toggleVisibility,
                              ),
                            ),
                            style: TextStyle(color: Color(0xfffc6111)),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.05),
                        Center(
                          child: Container(
                            width: 275,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                // color: Colors.white,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      blurRadius: 9,
                                      offset: Offset(0, 8),
                                      spreadRadius: 3)
                                ]),
                            child: ElevatedButton(
                              onPressed: _login,
                              // () {
                              //
                              //   if (_form.currentState!.validate()) {
                              //     // Process the payment
                              //
                              //     Navigator.push(
                              //         context,
                              //         MaterialPageRoute(
                              //             builder: (context) => homee()));
                              //   }
                              // },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xfffc6111),
                                foregroundColor: Colors.white,
                                minimumSize: Size(300, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: text("LOG IN NOW", Colors.white, 16,
                                  FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.03),
                        Center(
                          child: GestureDetector(
                            onTap: () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => reset_pass()));
                            },
                            child: text("Forgot your password?", Colors.grey,
                                16, FontWeight.normal),
                          ),
                        ),
                        SizedBox(height: 36),
                        Center(
                          child: text("or Login With", Colors.grey, 16,
                              FontWeight.normal),
                        ),
                        SizedBox(height: 16),
                        Center(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(30),
                                  bottomRight: Radius.circular(30),
                                ),
                                // Rounded corners
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => home()));
                                  },
                                  child: Image.network(
                                    'https://t4.ftcdn.net/jpg/03/08/54/37/240_F_308543787_DmPo1IELtKY9hG8E8GlW8KHEsRC7JiDN.jpg', // Replace with your image URL
                                    width: 70.0,
                                    //color: Colors.red,
                                    height: 70.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 7,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                // Rounded corners
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => home()));
                                  },
                                  child: Image.network(
                                    'https://t3.ftcdn.net/jpg/06/28/21/10/240_F_628211083_PCJPCvA0I32B6ZCQPOiGVkNnqiSjzFCL.jpg', // Replace with your image URL
                                    width: 80.0,
                                    //color: Colors.red,
                                    height: 65.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 15,
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(30),
                                // Rounded corners
                                child: GestureDetector(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => home()));
                                  },
                                  child: Image.network(
                                    'https://t4.ftcdn.net/jpg/05/32/20/03/240_F_532200355_odKN9Ou3WB6iHWJTFIElFtJbTuzJspY6.jpg', // Replace with your image URL
                                    width: 50.0,
                                    //color: Colors.red,
                                    height: 50.0,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 16),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text("Don't Have Any Account?", Colors.grey, 16,
                                FontWeight.bold),
                            GestureDetector(
                                onTap: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => create()));
                                },
                                child: text("Sign Up", Color(0xfffc6111), 16,
                                    FontWeight.bold)),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
