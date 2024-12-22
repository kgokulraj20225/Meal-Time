import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_time/allfun.dart';
import 'package:meal_time/login_details/New_pass.dart';
import 'package:meal_time/main.dart';

class mobile_otp extends StatefulWidget {
  const mobile_otp({super.key});

  @override
  State<mobile_otp> createState() => _mobile_otpState();
}

class _mobile_otpState extends State<mobile_otp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffc6111),
      body: otp(),
    );
  }
}

class otp extends StatefulWidget {
  const otp({super.key});

  @override
  State<otp> createState() => _otpState();
}

class _otpState extends State<otp> {
  @override
  Widget build(BuildContext context) {
    final scr = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: scr.height * 0.12,
          ),
          Container(
            clipBehavior: Clip.hardEdge,
            margin: EdgeInsets.all(30),
            // padding: EdgeInsets.all(20),
            decoration: BoxDecoration(
              color: Color(0xfffdfdfd),
              borderRadius: BorderRadius.only(
                  topRight: Radius.circular(100),
                  bottomLeft: Radius.circular(100)),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10,
                  offset: Offset(0, 10),
                ),
              ],
            ),
            height: scr.height * 0.7,
            child: ListView(
              children: [
                Center(
                  child: text(
                      "We have sent an OTP to \n \t \t \t \t \t your Mobile",
                      Colors.black,
                      25,
                      FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.all(12.0),
                  child: Center(
                    child: text(
                        "Please check your number 784*****77 \n \t  continue to reset your password",
                        Colors.grey,
                        15,
                        FontWeight.bold),
                  ),
                ),
                SizedBox(
                  height: scr.height * 0.07,
                ),
                Row(
                  children: [
                    Container(
                      width: scr.width * 0.12,
                      child: Center(
                        child: textfieldd(
                            Colors.white,
                            Colors.grey,
                            Color(0xfffc6111),
                            9,
                            Offset(0, 8),
                            BorderRadius.circular(10),
                            CupertinoIcons.staroflife_fill,
                            EdgeInsets.all(10),
                            "",
                            "please enter your name",
                            TextInputType.name),
                      ),
                    ),
                    Container(
                      width: scr.width * 0.12,
                      child: Center(
                        child: textfieldd(
                            Colors.white,
                            Colors.grey,
                            Color(0xfffc6111),
                            9,
                            Offset(0, 8),
                            BorderRadius.circular(10),
                            CupertinoIcons.staroflife_fill,
                            EdgeInsets.all(10),
                            "",
                            "please enter your name",
                            TextInputType.name),
                      ),
                    ),
                    Container(
                      width: scr.width * 0.12,
                      height: scr.height * 0.05,
                      child: Center(
                        child: textfield1(
                            Colors.white,
                            Colors.grey,
                            Color(0xfffc6111),
                            9,
                            Offset(0, 8),
                            BorderRadius.circular(10),
                            EdgeInsets.all(0),
                            "*"),
                      ),
                    ),
                    Container(
                      width: scr.width * 0.12,
                      child: Center(
                        child: textfieldd(
                            Colors.white,
                            Colors.grey,
                            Color(0xfffc6111),
                            9,
                            Offset(0, 8),
                            BorderRadius.circular(10),
                            CupertinoIcons.staroflife_fill,
                            EdgeInsets.all(10),
                            "",
                            "please enter your name",
                            TextInputType.name),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: scr.height * 0.06),
                GestureDetector(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => new_pass()));
                  },
                  child: Container(
                      height: scr.height * 0.065,
                      width: scr.width * 0.681,
                      decoration: BoxDecoration(
                          color: Color(0xfffc6111),
                          borderRadius: BorderRadius.circular(30),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 9,
                                offset: Offset(0, 8),
                                spreadRadius: 3,
                                color: Colors.grey)
                          ]),
                      child: Center(
                          child: text(
                              "Next", Color(0xfffdfdfd), 20, FontWeight.bold))),
                ),
                SizedBox(
                  height: scr.height * 0.05,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    text("Don't Receive? ", Colors.grey, 16, FontWeight.bold),
                    GestureDetector(
                        onTap: () {
                          Navigator.push(context,
                              MaterialPageRoute(builder: (context) => home()));
                        },
                        child: text("Click Here", Color(0xfffc6111), 16,
                            FontWeight.bold)),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
