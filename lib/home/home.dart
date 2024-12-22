import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:meal_time/home/home_page/hoem_page.dart';
import 'food_home_page/menu.dart';
import 'more/more_page.dart';
import 'Offers/offers.dart';
import 'profile/profile.dart';

class HomePageWithTabs extends StatefulWidget {
  const HomePageWithTabs({super.key});

  @override
  State<HomePageWithTabs> createState() => _HomePageWithTabsState();
}

class _HomePageWithTabsState extends State<HomePageWithTabs>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 5, vsync: this, initialIndex: 2);
    // _tabController.animateTo(2); //
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.white10,
        body: Stack(
          children: [
            Positioned.fill(
              child: TabBarView(
                physics: NeverScrollableScrollPhysics(),
                dragStartBehavior: DragStartBehavior.down,
                controller: _tabController,
                children: [
                  menu(),
                  offers_page(),
                  home_page(),
                  profile(),
                  more_page(), // Replace with your respective pages
                ],
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              child: Container(
                width: MediaQuery.of(context).size.width,
                // color: Colors.red,
                height: 70,
                child: Stack(
                  children: [
                    CustomPaint(
                      size: Size(MediaQuery.of(context).size.width, 80),
                      painter: BottomNavigationBarPainter(),
                    ),
                    Center(
                      heightFactor: 0.1,
                      // child: GestureDetector(
                      //   onTap: () {
                      //     Navigator.push(
                      //         context,
                      //         MaterialPageRoute(
                      //             builder: (context) => home_page()));
                      //   },
                      //   child: Container(
                      //     height: 55,
                      //     width: 55,
                      //     decoration: BoxDecoration(
                      //         shape: BoxShape.circle,
                      //         color: Color(0xfffc6111)),
                      //     child: Icon(
                      //       Icons.home,
                      //       color: Colors.white,
                      //     ),
                      //   ),
                      // )

                      child: Container(
                        height: 55,
                        width: 55,
                        decoration: BoxDecoration(shape: BoxShape.circle),
                        clipBehavior: Clip.hardEdge,
                        child: FloatingActionButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => home_page()));
                          },
                          backgroundColor: Colors.orange,
                          child: Icon(
                            Icons.home,
                            color: Colors.white,
                          ),
                          elevation: 1.5,
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      // color: Colors.white,
                      height: 70,
                      child: TabBar(
                        controller: _tabController,
                        labelColor: Color(0xfffc6111),
                        unselectedLabelColor: Colors.black,
                        // indicatorColor: Color(0xfffc6111),

                        tabs: [
                          Tab(icon: Icon(Icons.window)),
                          Tab(icon: Icon(Icons.shopping_bag_outlined)),
                          Container(
                            width: MediaQuery.of(context).size.width * 20,
                          ),
                          Tab(icon: Icon(Icons.person)),
                          Tab(icon: Icon(Icons.list_alt_outlined)),
                        ],
                        indicatorColor:
                            Colors.transparent, // Hide the tab indicator line
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class BottomNavigationBarPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()
      ..color = Colors.white
      ..style = PaintingStyle.fill;
    Path path = Path();
    path.quadraticBezierTo(size.width * 0.20, 0, size.width * 0.35, 0);
    path.quadraticBezierTo(size.width * 0.40, 0, size.width * 0.40, 20);
    path.arcToPoint(Offset(size.width * 0.60, 20),
        radius: Radius.circular(40.0), clockwise: false);
    path.quadraticBezierTo(size.width * 0.60, 0, size.width * 0.65, 0);
    path.quadraticBezierTo(size.width * 0.80, 0, size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);
    path.close();
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
