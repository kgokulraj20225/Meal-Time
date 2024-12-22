import 'package:flutter/material.dart';
import 'package:meal_time/login_details/registry.dart';
import 'package:meal_time/login_details/signin_choose.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../allfun.dart';
import '../home/home.dart';
import '../splash screen.dart';
import 'login.dart';

class Onboard extends StatefulWidget {
  const Onboard({super.key});

  @override
  State<Onboard> createState() => _OnboardState();
}

class _OnboardState extends State<Onboard> {
  bool _login = false;
  @override
  void initState() {
    super.initState();
    _checklogin();
  }

  Future<void> _checklogin() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool login = prefs.getBool("login") ?? false;
    setState(() {
      _login = login ?? false;
    });
  }

  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: _login ? HomePageWithTabs() : On(),
    );
  }
}

class On extends StatefulWidget {
  const On({super.key});

  @override
  State<On> createState() => _OnState();
}

class _OnState extends State<On> {
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfffdfdfd),
      body: SingleChildScrollView(
        child: Container(
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              // Top Section with Background Color
              Positioned(
                top: 0,
                child: Container(
                  decoration: BoxDecoration(
                    color: Color(0xfffc6111),
                    borderRadius:
                        BorderRadius.vertical(bottom: Radius.circular(30)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey,
                        blurStyle: BlurStyle.normal,
                        blurRadius: 20,
                        spreadRadius: 15,
                        offset: Offset(0, 3),
                      )
                    ],
                  ),
                  height: screensize.height * 0.47,
                  width: MediaQuery.of(context).size.width,
                ),
              ),

              // Content Section
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  // Image Section
                  Container(
                    margin:
                        EdgeInsets.only(top: 300), // Adjusting the top margin
                    height: 220,
                    width: 220,
                    clipBehavior: Clip.hardEdge,
                    decoration: BoxDecoration(
                        color: Color(0xfffdfdfd), shape: BoxShape.circle),
                    child: Center(child: RotatingLogo()),
                  ),

                  // Text Section
                  Center(
                    child: Padding(
                      padding: EdgeInsets.all(30),
                      child: Text(
                        "Discover the best foods from over 1000 \nrestaurants and fast delivery to your \n doorstep",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 13,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),

                  // Login Button
                  GestureDetector(
                    onTap: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => LoginApp()));
                    },
                    child: Container(
                      margin: EdgeInsets.only(bottom: 20), // Adjusting margin
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xfffc6111),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey,
                            blurRadius: 9,
                            offset: Offset(0, 8),
                            spreadRadius: 3,
                          ),
                        ],
                      ),
                      height: 68,
                      width: 300,
                      child: Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    ),
                  ),

                  OutlinedButton(
                      onPressed: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => sign_choose()));
                      },
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(
                            color: Color(0xfffc6111)), // Set border color
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(40), // Rounded corners
                        ),
                      ),
                      child: SizedBox(
                        width: 250,
                        height: 60, // Set the desired width
                        child: Center(
                          child: Text(
                            "Create an Account",
                            style: TextStyle(
                                color: Color(0xfffc6111),
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
                          ), // Ensure text is centered
                        ),
                      ))
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
