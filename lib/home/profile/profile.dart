import 'dart:io';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:image_picker/image_picker.dart';
import 'package:meal_time/allfun.dart';
import 'package:meal_time/login_details/on%20boardscreen.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../home.dart';
import 'profile.photo.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class profile extends StatefulWidget {
  const profile({super.key});

  @override
  State<profile> createState() => _profileState();
}

class _profileState extends State<profile> {
  Future<bool> signOutFromGoogle() async {
    try {
      final SharedPreferences prefs = await SharedPreferences.getInstance();

      // Remove the 'login' key to clear the logged-in state
      await prefs.remove('login');
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      Navigator.pushAndRemoveUntil(
        context,
        MaterialPageRoute(builder: (context) => On()),
        (route) => false,
      );

      return true;
    } catch (e) {
      print('Sign-out error: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    HomePageWithTabs()), // Navigate to home_page
          );
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xfffdfdfd),
          appBar: AppBar(
            backgroundColor: Color(0xfffdfdfd),
            title: text("Profile", Colors.black, 30, FontWeight.bold),
            actions: [
              Padding(
                  padding: const EdgeInsets.all(8.0),
                  // Navigator.push(context,
                  //     MaterialPageRoute(builder: (context) => menu()));

                  child: IconButton(
                    onPressed: () => signOutFromGoogle(),
                    icon: Icon(
                      Icons.logout,
                      color: Color(0xfffc6111),
                      size: 30,
                    ),
                  )),
            ],
          ),
          body: proffile(),
        ),
      ),
    );
  }
}

class proffile extends StatefulWidget {
  const proffile({super.key});

  @override
  State<proffile> createState() => _proffileState();
}

class _proffileState extends State<proffile> {
  String name = '';
  String email = '';
  String mobile = '';
  String address = '';
  String userpassword = '';
  String? photourl;
  File? img;
  final ImagePicker _picker = ImagePicker();

  void initState() {
    super.initState();
    _checkloginn();
    _loadimg();
  }

  Future<void> _pickImage() async {
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);

    if (image != null) {
      setState(() {
        img = File(image.path);
      });
      _saveimg(image.path);
    }
  }

  Future<void> _saveimg(String imag) async {
    SharedPreferences prg = await SharedPreferences.getInstance();
    await prg.setString("image_path", imag);
  }

  Future<void> _loadimg() async {
    SharedPreferences perff = await SharedPreferences.getInstance();
    String? imagepath = perff.getString("image_path");
    if (imagepath != null) {
      setState(() {
        img = File(imagepath);
      });
    }
  }

  Future<void> _checkloginn() async {
    SharedPreferences perf = await SharedPreferences.getInstance();
    // String? imagepath = perf.getString("image_path");
    setState(() {
      name = perf.getString("name") ?? "unknown";
      email = perf.getString("email") ?? "unknown";
      mobile = perf.getString("mobile") ?? "unknown";
      address = perf.getString("address") ?? "unknown";
      userpassword = perf.getString("userpassword") ?? "unknown";
      photourl = perf.getString("photourl");
    });

    // await perf.setString("password", password);
  }

  @override
  Widget build(BuildContext context) {
    final scc = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        height: scc.height * 0.9,
        width: scc.width * 1,
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: ListView(
            children: [
              Center(
                child: Stack(
                  children: [
                    Container(
                      // width: scc.width * 1,
                      // color: Colors.red,
                      child: Padding(
                        padding: EdgeInsets.only(top: 8.0),
                        child: GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => photo()));
                          },
                          child: Container(
                            clipBehavior: Clip.hardEdge,
                            height: 130,
                            width: 130,
                            decoration: BoxDecoration(
                                // color: Colors.red,
                                boxShadow: [
                                  BoxShadow(
                                      color: Colors.grey,
                                      offset: Offset(0, 2),
                                      blurRadius: 12)
                                ],
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                  fit: BoxFit.cover,
                                  image: img != null
                                      ? FileImage(img!)
                                      : NetworkImage(
                                          "$photourl"), // Provide a default image here
                                )),
                          ),
                        ),
                      ),
                    ),
                    Positioned(
                      right: 0,
                      bottom: 0,
                      child: Container(
                        height: 40,
                        width: 40,
                        decoration: BoxDecoration(
                            color: Colors.white.withOpacity(0.75),
                            shape: BoxShape.circle),
                        child: IconButton(
                            onPressed: _pickImage,
                            icon: Icon(
                              Icons.camera_alt,
                            )),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(18.0),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Icon(
                          Icons.edit,
                          color: Color(0xfffc6111),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(left: 4.0),
                          child: text("Edit Profile", Color(0xfffc6111), 16,
                              FontWeight.bold),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8.0),
                      child: text(
                          "Hi there $name!", Colors.black, 20, FontWeight.bold),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textfieldpprofile("Name", name, context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textfieldprofile("Email", email, context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textfieldprofile("Mobile No", mobile, context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textfieldprofile("Address", address, context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: textfieldprofile("Password", userpassword, context),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: GestureDetector(
                  onTap: () {},
                  child: Container(
                    height: 65,
                    width: scc.width * 0.8,
                    decoration: BoxDecoration(
                        color: Color(0xfffc6111),
                        borderRadius: BorderRadius.circular(50)),
                    child: Center(
                      child: text("Save", Colors.white, 16, FontWeight.bold),
                    ),
                  ),
                ),
              ),
              Container(
                height: scc.height * 0.08,
                width: scc.width * 0.8,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
