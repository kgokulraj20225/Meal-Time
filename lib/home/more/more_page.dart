import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:meal_time/allfun.dart';
import 'package:meal_time/home/Offers/offers.dart';
import 'package:meal_time/home/more/morepage.about_us.dart';
import 'package:meal_time/home/more/morepage.myorder.dart';
import 'package:meal_time/home/more/morepage.settings.dart';
import 'package:meal_time/home/more/morepage.paymentdetails.dart';

import '../home.dart';

class more_page extends StatefulWidget {
  const more_page({super.key});

  @override
  State<more_page> createState() => _more_pageState();
}

class _more_pageState extends State<more_page> {
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
            title: text("More", Colors.black, 30, FontWeight.bold),
            actions: [
              IconButton(onPressed: () {}, icon: Icon(Icons.shopping_cart)),
            ],
          ),
          body: more_page1(),
        ),
      ),
    );
  }
}

class more_page1 extends StatefulWidget {
  const more_page1({super.key});

  @override
  State<more_page1> createState() => _more_page1State();
}

class _more_page1State extends State<more_page1> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 28.0,
            ),
            child: more_caterage(
                Icons.payments_outlined, "Payment Details", payament()),
          ),
          more_caterage(Icons.shopping_bag, "My Order", myorder()),
          // more_caterage(Icons.settings, "Settings", notification()),
          more_caterage(Icons.settings, "Settings", notification()),
          more_caterage(Icons.mail, "Inbox", ho()),
          more_caterage(Icons.info_rounded, "About Us", about_us()),
        ],
      ),
    );
  }
}
