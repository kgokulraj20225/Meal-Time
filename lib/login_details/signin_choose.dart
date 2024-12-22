import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:meal_time/allfun.dart';
import 'package:meal_time/home/home.dart';
import 'package:meal_time/login_details/google_login.dart';
import 'package:meal_time/login_details/registry.dart';
import 'package:shared_preferences/shared_preferences.dart';

class sign_choose extends StatefulWidget {
  const sign_choose({super.key});

  @override
  State<sign_choose> createState() => _sign_chooseState();
}

class _sign_chooseState extends State<sign_choose> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: in_choose(),
    );
  }
}

class in_choose extends StatefulWidget {
  const in_choose({super.key});

  @override
  State<in_choose> createState() => _in_chooseState();
}

class _in_chooseState extends State<in_choose> {
  Future<User?> signInWithGoogle() async {
    try {
      final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
      final GoogleSignInAuthentication? googleAuth =
          await googleUser?.authentication;

      final credential = GoogleAuthProvider.credential(
        accessToken: googleAuth?.accessToken,
        idToken: googleAuth?.idToken,
      );

      final userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);

      // Save user data to Firestore
      await saveUserData(userCredential.user);

      return userCredential.user;
    } catch (e) {
      print('Exception -> $e');
      return null;
    }
  }

  Future<void> saveUserData(User? user) async {
    if (user != null) {
      SharedPreferences pref = await SharedPreferences.getInstance();
      await pref.setBool("login", true);
      await pref.setString("uid", user.uid ?? "");
      await pref.setString("name", user.displayName ?? "");
      await pref.setString("email", user.email ?? "");
      await pref.setString("photourl", user.photoURL ?? "");

      FirebaseFirestore firestore = FirebaseFirestore.instance;
      Map<String, dynamic> userData = {
        'uid': user.uid,
        'name': user.displayName,
        'email': user.email,
        'photoUrl': user.photoURL,
        'lastLogin': DateTime.now(),
      };

      await firestore
          .collection('users')
          .doc(user.uid)
          .set(userData, SetOptions(merge: true));
    }
  }

  @override
  Widget build(BuildContext context) {
    final scre = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Color(0xfffc6111),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                Container(
                  width: scre.width * 1,
                  height: scre.height * 1,
                  color: Colors.transparent,
                ),
                Container(
                  clipBehavior: Clip.hardEdge,
                  decoration: BoxDecoration(
                    color: Color(0xfffdfdfd),
                    borderRadius: BorderRadius.only(
                      topRight: Radius.circular(100),
                      bottomLeft: Radius.circular(100),
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black26,
                        blurRadius: 10,
                        offset: Offset(0, 10),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment:
                        MainAxisAlignment.center, // Align vertically center
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Align horizontally center
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => create()));
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xfffc6111),
                          foregroundColor: Colors.white,
                          minimumSize: Size(200, 50),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25),
                          ),
                        ),
                        child:
                            text("Sign Up", Colors.white, 16, FontWeight.bold),
                      ),
                      SizedBox(height: 20), // Add spacing between the buttons
                      OutlinedButton(
                        onPressed: () async {
                          User? user = await signInWithGoogle();
                          if (user != null) {
                            Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => HomePageWithTabs()),
                            );
                          }
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
                          width: 150,
                          height: 45, // Set the desired width
                          child: Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment
                                  .center, // Align row items center
                              children: [
                                Icon(
                                  FontAwesomeIcons.google,
                                  color: Color(0xfffc6111),
                                ),
                                Padding(
                                  padding: EdgeInsets.only(left: 18.0),
                                  child: Text(
                                    "Continue with Google",
                                    style: TextStyle(
                                      color: Color(0xfffc6111),
                                      fontSize: 11,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  height: scre.height * 0.35,
                  width: scre.width * 0.7,
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
