import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meal_time/allfun.dart';

import '../home.dart';
import '../home_page/buying_food.dart';

class offers_page extends StatefulWidget {
  const offers_page({super.key});

  @override
  State<offers_page> createState() => _offers_pageState();
}

class _offers_pageState extends State<offers_page> {
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
            title: Padding(
              padding: const EdgeInsets.all(8.0),
              child: text("Latest Offers", Colors.black, 30, FontWeight.bold),
            ),
            actions: [
              IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ))
            ],
            bottom: PreferredSize(
              preferredSize: Size.fromHeight(110.0),
              child: Padding(
                padding: EdgeInsets.only(right: 110),
                child: Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      text("Find discounts.  Offers Special \nmeals and more",
                          Colors.grey, 16, FontWeight.bold),
                      Padding(
                        padding:
                            EdgeInsets.only(right: 8.0, top: 10.0, bottom: 16),
                        child: GestureDetector(
                          onTap: () {},
                          child: Container(
                            height: 35,
                            width: 150,
                            decoration: BoxDecoration(
                                color: Color(0xfffc6111),
                                borderRadius: BorderRadius.circular(30)),
                            child: Center(
                              child: text("Check Offers", Colors.white, 16,
                                  FontWeight.bold),
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          body: ho(),
        ),
      ),
    );
  }
}

class ho extends StatefulWidget {
  const ho({super.key});

  @override
  State<ho> createState() => _hoState();
}

class _hoState extends State<ho> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 20.0),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.grey,
                child: offerbanner(
                    "https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg?auto=compress&cs=tinysrgb&w=600",
                    "20",
                    "%",
                    "OFF",
                    "French Berrys Honey Cake",
                    "4.9",
                    "Minute by tuk tuk \t Desserts",
                    pay_chas_food(
                        data:
                            "https://media.istockphoto.com/id/1303119992/photo/pizza_margerita.jpg?s=612x612&w=0&k=20&c=0HZZMC10ySBYvMVAKUNzknkQ1E74q8NKwTV5_K6WK6M=" ??
                                "no image",
                        data1: 1600 ?? 1600),
                    context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: .0),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.grey,
                child: offerbanner(
                    "https://images.pexels.com/photos/70497/pexels-photo-70497.jpeg?auto=compress&cs=tinysrgb&w=400",
                    "25",
                    "%",
                    "OFF",
                    "French Berrys Honey Cake",
                    "4.9",
                    "Minute by tuk tuk \t Desserts",
                    pay_chas_food(
                        data:
                            "https://media.istockphoto.com/id/1303119992/photo/pizza_margerita.jpg?s=612x612&w=0&k=20&c=0HZZMC10ySBYvMVAKUNzknkQ1E74q8NKwTV5_K6WK6M=" ??
                                "no image",
                        data1: 1600 ?? 1600),
                    context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: .0),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.grey,
                child: offerbanner(
                    "https://images.pexels.com/photos/851555/pexels-photo-851555.jpeg?auto=compress&cs=tinysrgb&w=400",
                    "30",
                    "%",
                    "OFF",
                    "Coffee with offer",
                    "4.9",
                    "Minute by tuk tuk \t Coffee",
                    pay_chas_food(
                        data:
                            "https://media.istockphoto.com/id/1303119992/photo/pizza_margerita.jpg?s=612x612&w=0&k=20&c=0HZZMC10ySBYvMVAKUNzknkQ1E74q8NKwTV5_K6WK6M=" ??
                                "no image",
                        data1: 1600 ?? 1600),
                    context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: .0),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.grey,
                child: offerbanner(
                    "https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg?auto=compress&cs=tinysrgb&w=600",
                    "60",
                    "%",
                    "OFF",
                    "French Berrys Honey Cake",
                    "4.9",
                    "Minute by tuk tuk \t Desserts",
                    pay_chas_food(
                        data:
                            "https://media.istockphoto.com/id/1303119992/photo/pizza_margerita.jpg?s=612x612&w=0&k=20&c=0HZZMC10ySBYvMVAKUNzknkQ1E74q8NKwTV5_K6WK6M=" ??
                                "no image",
                        data1: 1600 ?? 1600),
                    context),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 0.0),
              child: Card(
                color: Colors.white,
                shadowColor: Colors.grey,
                child: offerbanner(
                    "https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg?auto=compress&cs=tinysrgb&w=600",
                    "50",
                    "%",
                    "OFF",
                    "French Berrys Honey Cake",
                    "4.9",
                    "Minute by tuk tuk \t Desserts",
                    pay_chas_food(
                        data:
                            "https://media.istockphoto.com/id/1303119992/photo/pizza_margerita.jpg?s=612x612&w=0&k=20&c=0HZZMC10ySBYvMVAKUNzknkQ1E74q8NKwTV5_K6WK6M=" ??
                                "no image",
                        data1: 1600 ?? 1600),
                    context),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
