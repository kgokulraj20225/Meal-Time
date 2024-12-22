// import 'package:flutter/material.dart';
// import 'package:meal_time/login_details/login.dart';
// import 'package:meal_time/main.dart';
// import 'package:shared_preferences/shared_preferences.dart';
// import '../allfun.dart';
// import '../home/home.dart';
//
// class create extends StatefulWidget {
//   const create({super.key});
//
//   @override
//   State<create> createState() => _createState();
// }
//
// class _createState extends State<create> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xfffc6111),
//       body: create_in(),
//     );
//   }
// }
//
// class create_in extends StatefulWidget {
//   const create_in({super.key});
//
//   @override
//   State<create_in> createState() => _create_inState();
// }
//
// class _create_inState extends State<create_in> {
//   @override
//   final _form = GlobalKey<FormState>();
//   final TextEditingController _name = TextEditingController();
//   final TextEditingController _email = TextEditingController();
//   final TextEditingController _mobile = TextEditingController();
//   final TextEditingController _address = TextEditingController();
//   final TextEditingController _userpassword = TextEditingController();
//   final TextEditingController _confirmpassword = TextEditingController();
//
//   Future<void> _registry() async {
//     String name = _name.text;
//     String email = _email.text;
//     String mobile = _mobile.text;
//     String address = _address.text;
//     String userpassword = _userpassword.text;
//     String confirmpassword = _userpassword.text;
//
//     if (_userpassword.text == _confirmpassword.text) {
//       SharedPreferences perf = await SharedPreferences.getInstance();
//       await perf.setBool("login", true);
//       await perf.setString("name", name);
//       await perf.setString("email", email);
//       await perf.setString("mobile", mobile);
//       await perf.setString("address", address);
//       await perf.setString("userpassword", userpassword);
//       await perf.setString("confirmpassword", confirmpassword);
//       Navigator.pushReplacement(
//           context, MaterialPageRoute(builder: (context) => homee()));
//     } else {
//       ScaffoldMessenger.of(context).showSnackBar(
//           SnackBar(content: Text("password and confirm password is not same")));
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return SingleChildScrollView(
//       child: Container(
//         height: screenSize.height * 1,
//         child: Form(
//           key: _form,
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               SizedBox(
//                 height: screenSize.height * 0.01,
//               ),
//               Flexible(
//                 child: Padding(
//                   padding: const EdgeInsets.all(27.0),
//                   child: Container(
//                     clipBehavior: Clip.hardEdge,
//                     // padding: EdgeInsets.only(top: 20, bottom: 20),
//                     // height: MediaQuery.of(context).size.height,
//                     height: screenSize.height * 0.83,
//                     decoration: BoxDecoration(
//                       color: Color(0xfffdfdfd),
//                       borderRadius: BorderRadius.only(
//                         topRight: Radius.circular(100.0),
//                         bottomLeft: Radius.circular(100.0),
//                       ),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.black26,
//                           blurRadius: 10,
//                           offset: Offset(0, 10),
//                         ),
//                       ],
//                     ),
//                     child: ListView(
//                       // mainAxisAlignment: MainAxisAlignment.center,
//                       // crossAxisAlignment: CrossAxisAlignment.start,
//                       children: [
//                         Center(
//                           child: text("Sign Up", Color(0xfffc6111), 38,
//                               FontWeight.bold),
//                         ),
//                         textfield(
//                             Colors.white,
//                             Colors.grey,
//                             Color(0xfffc6111),
//                             9,
//                             Offset(0, 8),
//                             BorderRadius.circular(30),
//                             Icons.person,
//                             EdgeInsets.only(left: 25),
//                             "Name",
//                             "please enter your name",
//                             _name,
//                             TextInputType.name),
//                         textfield(
//                             Colors.white,
//                             Colors.grey,
//                             Color(0xfffc6111),
//                             9,
//                             Offset(0, 8),
//                             BorderRadius.circular(30),
//                             Icons.email,
//                             EdgeInsets.only(left: 25),
//                             "Email",
//                             "please enter your email",
//                             _email,
//                             TextInputType.emailAddress),
//                         textfield(
//                             Colors.white,
//                             Colors.grey,
//                             Color(0xfffc6111),
//                             9,
//                             Offset(0, 8),
//                             BorderRadius.circular(30),
//                             Icons.person,
//                             EdgeInsets.only(left: 25),
//                             "Mobile no",
//                             "please enter your mobile no",
//                             _mobile,
//                             TextInputType.number),
//                         textfield(
//                             Colors.white,
//                             Colors.grey,
//                             Color(0xfffc6111),
//                             9,
//                             Offset(0, 8),
//                             BorderRadius.circular(30),
//                             Icons.person,
//                             EdgeInsets.only(left: 25),
//                             "Address",
//                             "please enter your address",
//                             _address,
//                             TextInputType.streetAddress),
//                         textfield(
//                             Colors.white,
//                             Colors.grey,
//                             Color(0xfffc6111),
//                             9,
//                             Offset(0, 8),
//                             BorderRadius.circular(30),
//                             Icons.person,
//                             EdgeInsets.only(left: 25),
//                             "Password",
//                             "please enter your password",
//                             _userpassword,
//                             TextInputType.visiblePassword),
//                         textfield(
//                             Colors.white,
//                             Colors.grey,
//                             Color(0xfffc6111),
//                             9,
//                             Offset(0, 8),
//                             BorderRadius.circular(30),
//                             Icons.person,
//                             EdgeInsets.only(left: 25),
//                             "Confirm Password",
//                             "please Confirm your password",
//                             _confirmpassword,
//                             TextInputType.name),
//                         SizedBox(
//                           height: screenSize.height * 0.02,
//                         ),
//                         Center(
//                           child: Container(
//                             width: 250,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(30),
//                                 boxShadow: [
//                                   BoxShadow(
//                                     color: Colors.grey,
//                                     spreadRadius: 3,
//                                     offset: Offset(0, 8),
//                                     blurRadius: 9,
//                                   )
//                                 ]),
//                             child: ElevatedButton(
//                               onPressed: () {
//                                 if (_form.currentState!.validate()) {
//                                   // Process the payment
//                                   _registry();
//                                 }
//                               },
//                               style: ElevatedButton.styleFrom(
//                                 backgroundColor: Color(0xfffc6111),
//                                 foregroundColor: Colors.white,
//                                 minimumSize: Size(300, 50),
//                                 shape: RoundedRectangleBorder(
//                                   borderRadius: BorderRadius.circular(25),
//                                 ),
//                               ),
//                               child: text(
//                                   "Sign Up", Colors.white, 16, FontWeight.bold),
//                             ),
//                           ),
//                         ),
//                         SizedBox(height: screenSize.height * 0.025),
//                         Row(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Padding(
//                               padding: EdgeInsets.only(bottom: 50.0),
//                               child: text("Already have an Account?",
//                                   Colors.grey, 16, FontWeight.bold),
//                             ),
//                             Padding(
//                               padding: EdgeInsets.only(bottom: 50.0),
//                               child: GestureDetector(
//                                   onTap: () {
//                                     Navigator.push(
//                                         context,
//                                         MaterialPageRoute(
//                                             builder: (context) => LoginApp()));
//                                   },
//                                   child: text("LogIn", Color(0xfffc6111), 16,
//                                       FontWeight.bold)),
//                             ),
//                           ],
//                         ),
//                       ],
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_time/login_details/google_login.dart';
import 'package:meal_time/login_details/login.dart';
import 'package:meal_time/main.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../allfun.dart';
import '../home/home.dart';
import 'package:http/http.dart' as http;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cupertino_icons/cupertino_icons.dart';

class create extends StatefulWidget {
  const create({super.key});

  @override
  State<create> createState() => _createState();
}

class _createState extends State<create> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffc6111),
      body: create_in(),
    );
  }
}

String Url = "http://$ip:8000/Authentication_app/signup/";

class create_in extends StatefulWidget {
  const create_in({super.key});

  @override
  State<create_in> createState() => _create_inState();
}

class _create_inState extends State<create_in> {
  final _form = GlobalKey<FormState>();
  final TextEditingController _name = TextEditingController();
  final TextEditingController _email = TextEditingController();
  final TextEditingController _mobile = TextEditingController();
  final TextEditingController _address = TextEditingController();
  final TextEditingController _userpassword = TextEditingController();
  final TextEditingController _confirmpassword = TextEditingController();

  // Function to get local IP address
  Future<String?> getLocalIP() async {
    try {
      for (var interface in await NetworkInterface.list()) {
        for (var addr in interface.addresses) {
          if (addr.type == InternetAddressType.IPv4) {
            return addr.address; // Return the first found IPv4 address
          }
        }
      }
    } catch (e) {
      print("Failed to get local IP: $e");
      return null;
    }
    return null;
  }

  // Future<void> _registry() async {
  // String name = _name.text;
  // String email = _email.text;
  // String mobile = _mobile.text;
  // String address = _address.text;
  // String userpassword = _userpassword.text;
  // String confirmpassword = _confirmpassword.text;
  //
  // // Check if password and confirm password match before sending the request
  // if (userpassword != confirmpassword) {
  //   ScaffoldMessenger.of(context).showSnackBar(SnackBar(
  //       content: Text("Password and Confirm Password do not match")));
  //   return;
  // }
  //
  // // Get local IP
  // String? localIP = await getLocalIP();
  // if (localIP == null) {
  //   ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Unable to get local IP address")));
  //   return;
  // }
  //
  // try {
  //   // Use the local IP to build the request URL
  //   final response = await http.post(
  //     Uri.parse(
  //         'http://192.168.0.115:8000/Authentication_app/signup/'), // Use local IP dynamically
  //     headers: {"Content-Type": "application/json"},
  //     body: jsonEncode({
  //       'username': name,
  //       'email': email,
  //       'mobileno': mobile,
  //       'address': address,
  //       'password': userpassword,
  //     }),
  //   );
  //
  //   if (response.statusCode == 201) {
  //     // Handle success, e.g., navigate to home page or show a success message
  //     SharedPreferences perf = await SharedPreferences.getInstance();
  //     await perf.setBool("login", true);
  //     await perf.setString("name", name);
  //     await perf.setString("email", email);
  //     await perf.setString("mobile", mobile);
  //     await perf.setString("address", address);
  //     await perf.setString("userpassword", userpassword);
  //
  //     Navigator.pushReplacement(
  //         context, MaterialPageRoute(builder: (context) => homee()));
  //   } else {
  //     // Handle error response
  //     ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(content: Text("Sign up failed: ${response.body}")));
  //   }
  // } catch (e) {
  //   // Handle network or unexpected errors
  //   ScaffoldMessenger.of(context)
  //       .showSnackBar(SnackBar(content: Text("An error occurred: $e")));
  // }
  // Updated _registry() function with logging
  Future<void> _registry() async {
    String name = _name.text;
    String email = _email.text;
    String mobile = _mobile.text;
    String address = _address.text;
    String userpassword = _userpassword.text;
    String confirmpassword = _confirmpassword.text;

    if (userpassword != confirmpassword) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
          content: Text("Password and Confirm Password do not match")));
      return;
    }

    // Log request details
    print('Attempting sign-up with the following data:');
    print('Name: $name, Email: $email, Mobile: $mobile, Address: $address');

    String? localIP = await getLocalIP();
    if (localIP == null) {
      ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Unable to get local IP address")));
      return;
    }

    try {
      final response = await http.post(
        Uri.parse('$Url'),
        // Adjust IP as needed
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          'username': name,
          'email': email,
          'mobileno': mobile,
          'address': address,
          'password': userpassword,
        }),
      );

      // Log response status and body
      print('Response status: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 201) {
        SharedPreferences perf = await SharedPreferences.getInstance();
        await perf.setBool("login", true);
        await perf.setString("name", name);
        await perf.setString("email", email);
        await perf.setString("mobile", mobile);
        await perf.setString("address", address);
        await perf.setString("userpassword", userpassword);

        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (context) => HomePageWithTabs()));
      } else {
        // Log failure response
        print('Sign-up failed: ${response.body}');
        ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("Sign-up failed: ${response.body}")));
      }
    } catch (e) {
      print('Error occurred: $e');
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text("An error occurred: $e")));
    }
  }

  // final TextEditingController _usernameController = TextEditingController();
  // final FirebaseAuth _auth = FirebaseAuth.instance;
  // final GoogleSignIn _googleSignIn = GoogleSignIn();
  // final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  //
  // Future<void> _googleSignUp() async {
  //   try {
  //     // Trigger Google Sign-In process
  //     final GoogleSignInAccount? googleUser = await _googleSignIn.signIn();
  //     if (googleUser == null) {
  //       // User canceled the sign-in
  //       return;
  //     }
  //
  //     // Authenticate with Google
  //     final GoogleSignInAuthentication googleAuth =
  //         await googleUser.authentication;
  //     final AuthCredential credential = GoogleAuthProvider.credential(
  //       accessToken: googleAuth.accessToken,
  //       idToken: googleAuth.idToken,
  //     );
  //
  //     // Sign in to Firebase
  //     final UserCredential userCredential =
  //         await _auth.signInWithCredential(credential);
  //     final User? user = userCredential.user;
  //
  //     if (user != null) {
  //       // Save user info to Firestore
  //       await _firestore.collection('users').doc(user.uid).set({
  //         'name': user.displayName,
  //         'email': user.email,
  //         'photoURL': user.photoURL,
  //         'username': _usernameController.text.trim(),
  //         'createdAt': FieldValue.serverTimestamp(),
  //       });
  //
  //       // Navigate to another screen or show success
  //       ScaffoldMessenger.of(context).showSnackBar(
  //         SnackBar(
  //             content: Text("Signed up successfully as ${user.displayName}!")),
  //       );
  //       Navigator.pushReplacementNamed(
  //           context, '/home'); // Replace with your home route
  //     }
  //   } catch (e) {
  //     print("Error during Google Sign-Up: $e");
  //     ScaffoldMessenger.of(context).showSnackBar(
  //       SnackBar(content: Text("Google Sign-Up failed: $e")),
  //     );
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: screenSize.height * 1,
        child: Form(
          key: _form,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: screenSize.height * 0.01),
              Flexible(
                child: Padding(
                  padding: const EdgeInsets.all(27.0),
                  child: Container(
                    clipBehavior: Clip.hardEdge,
                    height: screenSize.height * 0.85,
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
                    child: ListView(
                      children: [
                        Center(
                          child: text("Sign Up", Color(0xfffc6111), 38,
                              FontWeight.bold),
                        ),
                        textfield(
                            Colors.white,
                            Colors.grey,
                            Color(0xfffc6111),
                            9,
                            Offset(0, 8),
                            BorderRadius.circular(30),
                            Icons.person,
                            EdgeInsets.only(left: 25),
                            "Name",
                            "Please enter your name",
                            _name,
                            TextInputType.name),
                        textfield(
                            Colors.white,
                            Colors.grey,
                            Color(0xfffc6111),
                            9,
                            Offset(0, 8),
                            BorderRadius.circular(30),
                            Icons.email,
                            EdgeInsets.only(left: 25),
                            "Email",
                            "Please enter your email",
                            _email,
                            TextInputType.emailAddress),
                        textfield(
                            Colors.white,
                            Colors.grey,
                            Color(0xfffc6111),
                            9,
                            Offset(0, 8),
                            BorderRadius.circular(30),
                            Icons.phone,
                            EdgeInsets.only(left: 25),
                            "Mobile No",
                            "Please enter your mobile no",
                            _mobile,
                            TextInputType.number),
                        textfield(
                            Colors.white,
                            Colors.grey,
                            Color(0xfffc6111),
                            9,
                            Offset(0, 8),
                            BorderRadius.circular(30),
                            Icons.location_on,
                            EdgeInsets.only(left: 25),
                            "Address",
                            "Please enter your address",
                            _address,
                            TextInputType.streetAddress),
                        textfield(
                            Colors.white,
                            Colors.grey,
                            Color(0xfffc6111),
                            9,
                            Offset(0, 8),
                            BorderRadius.circular(30),
                            Icons.lock,
                            EdgeInsets.only(left: 25),
                            "Password",
                            "Please enter your password",
                            _userpassword,
                            TextInputType.visiblePassword),
                        textfield(
                            Colors.white,
                            Colors.grey,
                            Color(0xfffc6111),
                            9,
                            Offset(0, 8),
                            BorderRadius.circular(30),
                            Icons.lock_outline,
                            EdgeInsets.only(left: 25),
                            "Confirm Password",
                            "Please confirm your password",
                            _confirmpassword,
                            TextInputType.visiblePassword),
                        SizedBox(height: screenSize.height * 0.02),
                        Center(
                          child: Container(
                            width: 250,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 3,
                                    offset: Offset(0, 8),
                                    blurRadius: 9,
                                  )
                                ]),
                            child: ElevatedButton(
                              onPressed: () {
                                if (_form.currentState!.validate()) {
                                  _registry();
                                }
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor: Color(0xfffc6111),
                                foregroundColor: Colors.white,
                                minimumSize: Size(300, 50),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(25),
                                ),
                              ),
                              child: text(
                                  "Sign Up", Colors.white, 16, FontWeight.bold),
                            ),
                          ),
                        ),
                        SizedBox(height: screenSize.height * 0.025),
                        Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: text("Already have an Account?",
                                      Colors.grey, 16, FontWeight.bold),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(bottom: 10.0),
                                  child: GestureDetector(
                                      onTap: () {
                                        Navigator.push(
                                            context,
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginApp()));
                                      },
                                      child: text("LogIn", Color(0xfffc6111),
                                          16, FontWeight.bold)),
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
            ],
          ),
        ),
      ),
    );
  }
}
