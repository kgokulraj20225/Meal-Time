// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
//
// class GoogleSignInScreen extends StatefulWidget {
//   const GoogleSignInScreen({Key? key}) : super(key: key);
//
//   @override
//   State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
// }
//
// class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
//   ValueNotifier userCredential = ValueNotifier('');
//
//   Future<dynamic> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//
//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );
//
//       final userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//
//       // Save user data to Firestore
//       await saveUserData(userCredential.user);
//
//       return userCredential;
//     } on Exception catch (e) {
//       print('Exception -> $e');
//       return null;
//     }
//   }
//
//   Future<void> saveUserData(User? user) async {
//     if (user != null) {
//       FirebaseFirestore firestore = FirebaseFirestore.instance;
//
//       Map<String, dynamic> userData = {
//         'uid': user.uid,
//         'name': user.displayName,
//         'email': user.email,
//         'photoUrl': user.photoURL,
//         'lastLogin': DateTime.now(),
//       };
//
//       // Save to Firestore
//       await firestore
//           .collection('users')
//           .doc(user.uid)
//           .set(userData, SetOptions(merge: true));
//       print('User data saved successfully!');
//     } else {
//       print('No user is logged in.');
//     }
//   }
//
//   // Future<bool> signOutFromGoogle() async {
//   //   try {
//   //     await FirebaseAuth.instance.signOut();
//   //     return true;
//   //   } on Exception catch (_) {
//   //     return false;
//   //   }
//   // }
//   Future<bool> signOutFromGoogle() async {
//     try {
//       // Sign out from Firebase
//       await FirebaseAuth.instance.signOut();
//
//       // Sign out from GoogleSignIn
//       await GoogleSignIn().signOut();
//
//       return true;
//     } on Exception catch (_) {
//       return false;
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         appBar: AppBar(title: const Text('Google SignIn Screen')),
//         body: ValueListenableBuilder(
//             valueListenable: userCredential,
//             builder: (context, value, child) {
//               return (userCredential.value == '' ||
//                       userCredential.value == null)
//                   ? Center(
//                       child: Card(
//                         elevation: 5,
//                         shape: RoundedRectangleBorder(
//                             borderRadius: BorderRadius.circular(10)),
//                         child: IconButton(
//                           iconSize: 40,
//                           icon: Image.asset(
//                             'assets/images/google_icon.png',
//                           ),
//                           onPressed: () async {
//                             userCredential.value = await signInWithGoogle();
//                             if (userCredential.value != null)
//                               print(userCredential.value.user!.email);
//                           },
//                         ),
//                       ),
//                     )
//                   : Center(
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.center,
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           Container(
//                             clipBehavior: Clip.antiAlias,
//                             decoration: BoxDecoration(
//                                 shape: BoxShape.circle,
//                                 border: Border.all(
//                                     width: 1.5, color: Colors.black54)),
//                             child: Image.network(
//                                 userCredential.value.user!.photoURL.toString()),
//                           ),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Text(userCredential.value.user!.displayName
//                               .toString()),
//                           const SizedBox(
//                             height: 20,
//                           ),
//                           Text(userCredential.value.user!.email.toString()),
//                           const SizedBox(
//                             height: 30,
//                           ),
//                           ElevatedButton(
//                               onPressed: () async {
//                                 bool result = await signOutFromGoogle();
//                                 if (result) userCredential.value = '';
//                               },
//                               child: const Text('Logout'))
//                         ],
//                       ),
//                     );
//             }));
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class GoogleSignInScreen extends StatefulWidget {
//   const GoogleSignInScreen({Key? key}) : super(key: key);
//
//   @override
//   State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
// }
//
// class UserData {
//   final String uid;
//   final String email;
//   final String? displayName;
//   final String? photoUrl;
//
//   UserData({
//     required this.uid,
//     required this.email,
//     this.displayName,
//     this.photoUrl,
//   });
//
//   Map<String, String?> toJson() => {
//         'uid': uid,
//         'email': email,
//         'displayName': displayName,
//         'photoUrl': photoUrl,
//       };
//
//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         uid: json['uid'],
//         email: json['email'],
//         displayName: json['displayName'],
//         photoUrl: json['photoUrl'],
//       );
// }
//
// class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
//   UserData? userData;
//
//   @override
//   void initState() {
//     super.initState();
//     loadUserData();
//   }
//
//   Future<void> loadUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     final String? uid = prefs.getString('uid');
//     final String? email = prefs.getString('email');
//     final String? displayName = prefs.getString('displayName');
//     final String? photoUrl = prefs.getString('photoUrl');
//
//     if (uid != null && email != null) {
//       setState(() {
//         userData = UserData(
//           uid: uid,
//           email: email,
//           displayName: displayName,
//           photoUrl: photoUrl,
//         );
//       });
//     }
//   }
//
//   Future<void> saveUserData(UserData user) async {
//     final prefs = await SharedPreferences.getInstance();
//
//     await prefs.setString('uid', user.uid);
//     await prefs.setString('email', user.email);
//     await prefs.setString('displayName', user.displayName ?? '');
//     await prefs.setString('photoUrl', user.photoUrl ?? '');
//   }
//
//   Future<void> clearUserData() async {
//     final prefs = await SharedPreferences.getInstance();
//     await prefs.clear();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Google Sign-In')),
//       body: userData == null
//           ? GoogleSignInWidget(
//               onSignedIn: (user) async {
//                 setState(() => userData = user);
//                 await saveUserData(user);
//               },
//             )
//           : GoogleSignOutWidget(
//               userData: userData!,
//               onSignedOut: () async {
//                 setState(() => userData = null);
//                 await clearUserData();
//               },
//             ),
//     );
//   }
// }
//
// class GoogleSignInWidget extends StatelessWidget {
//   final Function(UserData) onSignedIn;
//
//   const GoogleSignInWidget({Key? key, required this.onSignedIn})
//       : super(key: key);
//
//   Future<UserData?> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );
//
//       final userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//       final user = userCredential.user;
//
//       if (user != null) {
//         final userData = UserData(
//           uid: user.uid,
//           email: user.email!,
//           displayName: user.displayName,
//           photoUrl: user.photoURL,
//         );
//
//         // Save user data to Firestore
//         await saveUserDataToFirestore(userData);
//
//         return userData;
//       }
//     } catch (e) {
//       print('Exception -> $e');
//     }
//     return null;
//   }
//
//   Future<void> saveUserDataToFirestore(UserData user) async {
//     final firestore = FirebaseFirestore.instance;
//     final userData = {
//       'uid': user.uid,
//       'name': user.displayName,
//       'email': user.email,
//       'photoUrl': user.photoUrl,
//       'lastLogin': DateTime.now(),
//     };
//
//     await firestore
//         .collection('users')
//         .doc(user.uid)
//         .set(userData, SetOptions(merge: true));
//     print('User data saved to Firestore successfully!');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Card(
//         elevation: 5,
//         shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//         child: IconButton(
//           iconSize: 40,
//           icon: Image.asset('assets/images/google_icon.png'),
//           onPressed: () async {
//             final user = await signInWithGoogle();
//             if (user != null) {
//               onSignedIn(user);
//               print(user.email);
//             }
//           },
//         ),
//       ),
//     );
//   }
// }
//
// class GoogleSignOutWidget extends StatelessWidget {
//   final UserData userData;
//   final Function onSignedOut;
//
//   const GoogleSignOutWidget(
//       {Key? key, required this.userData, required this.onSignedOut})
//       : super(key: key);
//
//   Future<void> signOutFromGoogle() async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       await GoogleSignIn().signOut();
//     } catch (e) {
//       print('Sign-out failed: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.center,
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: [
//           if (userData.photoUrl != null)
//             Container(
//               clipBehavior: Clip.antiAlias,
//               decoration: BoxDecoration(
//                 shape: BoxShape.circle,
//                 border: Border.all(width: 1.5, color: Colors.black54),
//               ),
//               child: Image.network(userData.photoUrl!, width: 100, height: 100),
//             ),
//           const SizedBox(height: 20),
//           Text(userData.displayName ?? 'Unknown User',
//               style:
//                   const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//           const SizedBox(height: 10),
//           Text(userData.email, style: const TextStyle(fontSize: 16)),
//           const SizedBox(height: 30),
//           ElevatedButton(
//             onPressed: () async {
//               await signOutFromGoogle();
//               onSignedOut();
//             },
//             child: const Text('Logout'),
//           ),
//         ],
//       ),
//     );
//   }
// }
//
// import 'package:flutter/material.dart';
// import 'package:firebase_auth/firebase_auth.dart';
// import 'package:google_sign_in/google_sign_in.dart';
// import 'package:cloud_firestore/cloud_firestore.dart';
// import 'package:shared_preferences/shared_preferences.dart';
//
// class GoogleSignInScreen extends StatefulWidget {
//   const GoogleSignInScreen({Key? key}) : super(key: key);
//
//   @override
//   State<GoogleSignInScreen> createState() => _GoogleSignInScreenState();
// }
//
// class UserData {
//   final String uid;
//   final String email;
//   final String? displayName;
//   final String? photoUrl;
//
//   UserData({
//     required this.uid,
//     required this.email,
//     this.displayName,
//     this.photoUrl,
//   });
//
//   Map<String, String?> toJson() => {
//         'uid': uid,
//         'email': email,
//         'displayName': displayName,
//         'photoUrl': photoUrl,
//       };
//
//   factory UserData.fromJson(Map<String, dynamic> json) => UserData(
//         uid: json['uid'],
//         email: json['email'],
//         displayName: json['displayName'],
//         photoUrl: json['photoUrl'],
//       );
// }
//
// class _GoogleSignInScreenState extends State<GoogleSignInScreen> {
//   Future<void> signInWithGoogle() async {
//     try {
//       final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();
//       final GoogleSignInAuthentication? googleAuth =
//           await googleUser?.authentication;
//
//       final credential = GoogleAuthProvider.credential(
//         accessToken: googleAuth?.accessToken,
//         idToken: googleAuth?.idToken,
//       );
//
//       final userCredential =
//           await FirebaseAuth.instance.signInWithCredential(credential);
//       final user = userCredential.user;
//
//       if (user != null) {
//         final userData = UserData(
//           uid: user.uid,
//           email: user.email!,
//           displayName: user.displayName,
//           photoUrl: user.photoURL,
//         );
//
//         // Save user data to Firestore
//         await saveUserDataToFirestore(userData);
//
//         // Navigate to Profile Page
//         Navigator.pushReplacement(
//           context,
//           MaterialPageRoute(
//             builder: (context) => ProfilePage(userData: userData),
//           ),
//         );
//       }
//     } catch (e) {
//       print('Sign-in failed: $e');
//     }
//   }
//
//   Future<void> saveUserDataToFirestore(UserData user) async {
//     final firestore = FirebaseFirestore.instance;
//     final userData = {
//       'uid': user.uid,
//       'name': user.displayName,
//       'email': user.email,
//       'photoUrl': user.photoUrl,
//       'lastLogin': DateTime.now(),
//     };
//
//     await firestore
//         .collection('users')
//         .doc(user.uid)
//         .set(userData, SetOptions(merge: true));
//     print('User data saved to Firestore successfully!');
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Google Sign-In')),
//       body: Center(
//         child: Card(
//           elevation: 5,
//           shape:
//               RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
//           child: IconButton(
//             iconSize: 40,
//             icon: Image.asset('assets/images/google_icon.png'),
//             onPressed: () async => await signInWithGoogle(),
//           ),
//         ),
//       ),
//     );
//   }
// }
//
// class ProfilePage extends StatelessWidget {
//   final UserData userData;
//
//   const ProfilePage({Key? key, required this.userData}) : super(key: key);
//
//   Future<void> signOutFromGoogle(BuildContext context) async {
//     try {
//       await FirebaseAuth.instance.signOut();
//       await GoogleSignIn().signOut();
//
//       // Navigate back to Sign-In Page
//       Navigator.pushReplacement(
//         context,
//         MaterialPageRoute(builder: (context) => const GoogleSignInScreen()),
//       );
//     } catch (e) {
//       print('Sign-out failed: $e');
//     }
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: const Text('Profile Page')),
//       body: Center(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: [
//             if (userData.photoUrl != null)
//               Container(
//                 clipBehavior: Clip.antiAlias,
//                 decoration: BoxDecoration(
//                   shape: BoxShape.circle,
//                   border: Border.all(width: 1.5, color: Colors.black54),
//                 ),
//                 child:
//                     Image.network(userData.photoUrl!, width: 100, height: 100),
//               ),
//             const SizedBox(height: 20),
//             Text(userData.displayName ?? 'Unknown User',
//                 style:
//                     const TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
//             const SizedBox(height: 10),
//             Text(userData.email, style: const TextStyle(fontSize: 16)),
//             const SizedBox(height: 30),
//             ElevatedButton(
//               onPressed: () async => await signOutFromGoogle(context),
//               child: const Text('Logout'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
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
      FirebaseFirestore firestore = FirebaseFirestore.instance;
      Map<String, dynamic> userData = {
        'uid': user.uid,
        'name': user.displayName,
        'email': user.email,
        'phonenumber': user.phoneNumber,
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
    return Scaffold(
      appBar: AppBar(title: const Text('Google Login')),
      body: Center(
        child: Card(
          elevation: 5,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: IconButton(
            iconSize: 40,
            icon: Image.asset('assets/images/google_icon.png'),
            onPressed: () async {
              User? user = await signInWithGoogle();
              if (user != null) {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                      builder: (context) => ProfilePage(user: user)),
                );
              }
            },
          ),
        ),
      ),
    );
  }
}

class ProfilePage extends StatelessWidget {
  final User user;

  const ProfilePage({Key? key, required this.user}) : super(key: key);

  Future<bool> signOutFromGoogle() async {
    try {
      await FirebaseAuth.instance.signOut();
      await GoogleSignIn().signOut();
      return true;
    } catch (e) {
      print('Sign-out error: $e');
      return false;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Profile Page')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CircleAvatar(
              radius: 50,
              backgroundImage: NetworkImage(user.photoURL ?? ''),
            ),
            const SizedBox(height: 20),
            Text(user.displayName ?? 'No Name',
                style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 10),
            Text(user.email ?? 'No Email'),
            Text(user.phoneNumber ?? 'No phoneno'),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () async {
                bool result = await signOutFromGoogle();
                if (result) {
                  Navigator.pushReplacementNamed(context, '/');
                }
              },
              child: const Text('Logout'),
            ),
          ],
        ),
      ),
    );
  }
}
