// import 'package:flutter/material.dart';
// import 'package:meal_time/allfun.dart';
// import 'package:meal_time/home/Menu%20file/Beverages.dart';
// import 'package:meal_time/home/Menu%20file/Food.dart';
// import 'package:meal_time/home/Menu%20file/Promotions.dart';
// import 'package:meal_time/home/Menu%20file/desserts.dart';
//
// class menu extends StatefulWidget {
//   const menu({super.key});
//
//   @override
//   State<menu> createState() => _menuState();
// }
//
// class _menuState extends State<menu> {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       debugShowCheckedModeBanner: false,
//       home: Scaffold(
//         appBar: AppBar(
//           backgroundColor: Color(0xfffdfdfd),
//           title: Padding(
//             padding: const EdgeInsets.all(8.0),
//             child: Text(
//               "Menu",
//               style: TextStyle(
//                   color: Colors.black,
//                   fontWeight: FontWeight.bold,
//                   fontSize: 35),
//             ),
//           ),
//           actions: [
//             Padding(
//               padding: const EdgeInsets.all(8.0),
//               child: IconButton(
//                   onPressed: () {},
//                   icon: Icon(
//                     Icons.shopping_cart,
//                     size: 30,
//                   )),
//             )
//           ],
//         ),
//         backgroundColor: Color(0xfffdfdfd),
//         body: menu1(),
//         bottomNavigationBar: BottomNavigationBar(
//           backgroundColor: Color(0xfffdfdfd),
//           selectedItemColor: Color(0xfffc6111),
//           unselectedItemColor: Colors.grey,
//           items: [
//             BottomNavigationBarItem(
//                 icon: IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.window),
//                 ),
//                 label: "Menu"),
//             BottomNavigationBarItem(
//                 icon: IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.shopping_bag_outlined),
//                 ),
//                 label: "Offers"),
//             BottomNavigationBarItem(
//                 icon: IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.person),
//                 ),
//                 label: "Profile"),
//             BottomNavigationBarItem(
//                 icon: IconButton(
//                   onPressed: () {},
//                   icon: Icon(Icons.list_alt_outlined),
//                 ),
//                 label: "More"),
//           ],
//         ),
//         floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
//         floatingActionButton: FloatingActionButton(
//           onPressed: () {},
//           child: Icon(Icons.home),
//         ),
//       ),
//     );
//   }
// }
//
// class menu1 extends StatefulWidget {
//   const menu1({super.key});
//
//   @override
//   State<menu1> createState() => _menu1State();
// }
//
// class _menu1State extends State<menu1> {
//   @override
//   Widget build(BuildContext context) {
//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Column(
//         children: [
//           Padding(
//             padding: const EdgeInsets.all(28.0),
//             child: textfield2(
//                 Color(0xfffdfdfd),
//                 Colors.grey,
//                 Color(0xfffc6111),
//                 10,
//                 Offset(0, 8),
//                 BorderRadius.circular(30),
//                 EdgeInsets.all(10),
//                 "Search food"),
//           ),
//           Center(
//             child: Stack(
//               children: [
//                 Container(
//                   // color: Colors.red,
//                   height: MediaQuery.of(context).size.height,
//                   width: MediaQuery.of(context).size.width,
//                 ),
//                 Positioned(
//                   left: 0,
//                   top: 20,
//                   child: Container(
//                     decoration: BoxDecoration(
//                         color: Color(0xfffc6111),
//                         borderRadius: BorderRadius.only(
//                             bottomRight: Radius.circular(50),
//                             topRight: Radius.circular(50)),
//                         boxShadow: [
//                           BoxShadow(
//                               color: Colors.grey,
//                               spreadRadius: 2,
//                               offset: Offset(0, 10),
//                               blurRadius: 9)
//                         ]),
//                     height: 550,
//                     width: 110,
//                   ),
//                 ),
//                 Positioned(
//                   top: 50,
//                   child: catego1(
//                       "https://t3.ftcdn.net/jpg/03/13/00/70/240_F_313007059_Lbgy6IGzphFh9xFpNOMSa8AaEdg89yVL.jpg",
//                       "Food",
//                       "120 Items",
//                       BoxFit.cover,
//                       BoxShape.circle,
//                       Food()),
//                 ),
//                 Positioned(
//                     top: 180,
//                     child: catego(
//                       "https://t4.ftcdn.net/jpg/02/09/31/77/240_F_209317774_yDBNUzK0JuAB3HgBrHFlAm0Xi8GrbKKP.jpg",
//                       "Beverages",
//                       "220 Items",
//                       BoxFit.cover,
//                       BoxShape.rectangle,
//                       BorderRadius.circular(30),
//                       bev(),
//                     )),
//                 Positioned(
//                     top: 310,
//                     child: catego1(
//                         "https://t3.ftcdn.net/jpg/02/55/53/44/240_F_255534476_n8JzjZtzOFW5g3TXTLMd6QGVnToi6hqj.jpg",
//                         "Desserts",
//                         "155 Items",
//                         BoxFit.cover,
//                         BoxShape.circle,
//                         dessert())),
//                 Positioned(
//                     top: 440,
//                     child: catego(
//                         "https://t3.ftcdn.net/jpg/02/81/76/44/240_F_281764445_OWXUobpyBgxQw6LU3sckSY0nGGVTeoXs.jpg",
//                         "Promotions",
//                         "25 Items",
//                         BoxFit.cover,
//                         BoxShape.rectangle,
//                         BorderRadius.circular(30),
//                         pro())),
//               ],
//             ),
//           )
//         ],
//       ),
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:meal_time/allfun.dart';
import 'package:meal_time/home/food_home_page/dessert.dessert_page_view.dart';

import '../home.dart';
import 'Juice.dart';
import 'Food.dart';
import 'Promotions.dart';

class menu extends StatefulWidget {
  const menu({super.key});

  @override
  State<menu> createState() => _menuState();
}

class _menuState extends State<menu> {
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
          appBar: AppBar(
              backgroundColor: Color(0xfffdfdfd),
              title: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  "Menu",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontSize: 35),
                ),
              ),
              actions: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.shopping_cart,
                        size: 30,
                      )),
                )
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60.0), // Adjust height as needed
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: 350,
                    child: textfield2(
                        Color(0xfffdfdfd),
                        Colors.grey,
                        Color(0xfffc6111),
                        10,
                        Offset(0, 8),
                        BorderRadius.circular(30),
                        EdgeInsets.all(10),
                        "Search food"),
                  ),
                ),
              )),
          backgroundColor: Color(0xfffdfdfd),
          body: menu1(),
        ),
      ),
    );
  }
}

class menu1 extends StatefulWidget {
  const menu1({super.key});

  @override
  State<menu1> createState() => _menu1State();
}

class _menu1State extends State<menu1> {
  @override
  build(BuildContext context) {
    // Get screen size
    final screen = MediaQuery.of(context).size;

    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Center(
        child: Stack(
          children: [
            Container(
              height: 900,
              // color: Colors.red,
              width: screen.width * 1,
            ),
            Positioned(
              left: 0,
              top: screen.height *
                  0.03, // Adjusted to a percentage of the screen height
              child: Container(
                decoration: BoxDecoration(
                    color: Color(0xfffc6111),
                    borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(50),
                        topRight: Radius.circular(50)),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey,
                          spreadRadius: 2,
                          offset: Offset(0, 10),
                          blurRadius: 9)
                    ]),
                height: 770, // Adjusted to a percentage of the screen height
                width: 130, // Adjusted to a percentage of the screen width
              ),
            ),
            Positioned(
              top: 60, // Adjusted to a percentage of the screen height
              child: catego1(
                  "https://t3.ftcdn.net/jpg/03/13/00/70/240_F_313007059_Lbgy6IGzphFh9xFpNOMSa8AaEdg89yVL.jpg",
                  "Food",
                  "120 Items",
                  BoxFit.cover,
                  BoxShape.circle,
                  Food(),
                  context),
            ),
            Positioned(
                top: 200, // Adjusted to a percentage of the screen height
                child: catego(
                    "https://t4.ftcdn.net/jpg/02/09/31/77/240_F_209317774_yDBNUzK0JuAB3HgBrHFlAm0Xi8GrbKKP.jpg",
                    "Juices",
                    "220 Items",
                    BoxFit.cover,
                    BoxShape.rectangle,
                    BorderRadius.circular(30),
                    bev(),
                    context)),
            Positioned(
                top: 340,
                // Adjusted to a percentage of the screen height
                child: catego1(
                    "https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg?auto=compress&cs=tinysrgb&w=600",
                    "Desserts",
                    "155 Items",
                    BoxFit.cover,
                    BoxShape.circle,
                    dessert_view(),
                    context)),
            Positioned(
                top: 480, // Adjusted to a percentage of the screen height
                child: catego(
                    "https://t3.ftcdn.net/jpg/02/81/76/44/240_F_281764445_OWXUobpyBgxQw6LU3sckSY0nGGVTeoXs.jpg",
                    "Promotions",
                    "25 Items",
                    BoxFit.cover,
                    BoxShape.rectangle,
                    BorderRadius.circular(30),
                    pro(),
                    context)),
            Positioned(
                top: 620, // Adjusted to a percentage of the screen height
                child: catego1(
                    "https://images.pexels.com/photos/851555/pexels-photo-851555.jpeg?auto=compress&cs=tinysrgb&w=400",
                    "Coffee",
                    "255 Items",
                    BoxFit.cover,
                    BoxShape.circle,
                    dessert_view(),
                    context)),
          ],
        ),
      ),
    );
  }
}
