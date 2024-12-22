import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:meal_time/allfun.dart';
import 'package:meal_time/api_cal/api_cal.dart';
import 'package:meal_time/home/home_page/buying_food.dart';
import 'package:meal_time/home/home_page/homepage.order_place.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:flutter/services.dart';

class home_page extends StatefulWidget {
  const home_page({super.key});

  @override
  State<home_page> createState() => _home_pageState();
}

class _home_pageState extends State<home_page> {
  dynamic fullname = "";
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _profilename();
  }

  Future<void> _profilename() async {
    SharedPreferences pre = await SharedPreferences.getInstance();
    setState(() {
      fullname = pre.getString("name");
    });
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) {
        if (!didPop) {
          SystemNavigator.pop();
        }
      },
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          backgroundColor: Color(0xfffdfdfd),
          appBar: AppBar(
              backgroundColor: Color(0xfffdfdfd),
              title: text(
                  "Good morning $fullname!", Colors.black, 25, FontWeight.bold),
              actions: [
                IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.shopping_cart,
                      size: 30,
                    )),
              ],
              bottom: PreferredSize(
                preferredSize: Size.fromHeight(60),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.0,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
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
                ),
              )),
          body: main_page(),
        ),
      ),
    );
  }
}

class main_page extends StatefulWidget {
  const main_page({super.key});

  @override
  State<main_page> createState() => _main_pageState();
}

class _main_pageState extends State<main_page> {
  // Widget b (){
  //   return
  // }
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        child: Column(
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20.0, top: 25),
                    child: a(
                        "https://images.pexels.com/photos/3616956/pexels-photo-3616956.jpeg?auto=compress&cs=tinysrgb&w=400",
                        BoxShape.rectangle,
                        BoxFit.cover,
                        BorderRadius.circular(20),
                        "Cheese Burger",
                        13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 25),
                    child: a(
                        "https://images.pexels.com/photos/3738762/pexels-photo-3738762.jpeg?auto=compress&cs=tinysrgb&w=400",
                        BoxShape.rectangle,
                        BoxFit.cover,
                        BorderRadius.circular(20),
                        "Cheese Burger",
                        13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 25),
                    child: a(
                        "https://images.pexels.com/photos/3864680/pexels-photo-3864680.jpeg?auto=compress&cs=tinysrgb&w=400",
                        BoxShape.rectangle,
                        BoxFit.cover,
                        BorderRadius.circular(20),
                        "Cheese Burger",
                        13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 25),
                    child: a(
                        "https://images.pexels.com/photos/3738730/pexels-photo-3738730.jpeg?auto=compress&cs=tinysrgb&w=400",
                        BoxShape.rectangle,
                        BoxFit.cover,
                        BorderRadius.circular(20),
                        "Cheese Burger",
                        13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 25),
                    child: a(
                        "https://images.pexels.com/photos/3220617/pexels-photo-3220617.jpeg?auto=compress&cs=tinysrgb&w=400",
                        BoxShape.rectangle,
                        BoxFit.cover,
                        BorderRadius.circular(20),
                        "Cheese Burger",
                        13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 25),
                    child: a(
                        "https://images.pexels.com/photos/2983098/pexels-photo-2983098.jpeg?auto=compress&cs=tinysrgb&w=400",
                        BoxShape.rectangle,
                        BoxFit.cover,
                        BorderRadius.circular(20),
                        "Cheese Burger",
                        13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 25),
                    child: a(
                        "https://images.pexels.com/photos/2282532/pexels-photo-2282532.jpeg?auto=compress&cs=tinysrgb&w=400",
                        BoxShape.rectangle,
                        BoxFit.cover,
                        BorderRadius.circular(20),
                        "Cheese Burger",
                        13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 25),
                    child: a(
                        "https://images.pexels.com/photos/327158/pexels-photo-327158.jpeg?auto=compress&cs=tinysrgb&w=400",
                        BoxShape.rectangle,
                        BoxFit.cover,
                        BorderRadius.circular(20),
                        "Cheese Burger",
                        13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 25),
                    child: a(
                        "https://images.pexels.com/photos/2702674/pexels-photo-2702674.jpeg?auto=compress&cs=tinysrgb&w=400",
                        BoxShape.rectangle,
                        BoxFit.cover,
                        BorderRadius.circular(20),
                        "Cheese Burger",
                        13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 15.0, top: 25),
                    child: a(
                        "https://images.pexels.com/photos/1251198/pexels-photo-1251198.jpeg?auto=compress&cs=tinysrgb&w=400",
                        BoxShape.rectangle,
                        BoxFit.cover,
                        BorderRadius.circular(20),
                        "Cheese Burger",
                        13),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 28.0, top: 50, bottom: 28),
                  child: text(
                      "Popular Restaurents", Colors.black, 23, FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 60.0, top: 50, bottom: 28),
                  child: GestureDetector(
                    onTap: () {},
                    child: text(
                        "View All", Color(0xfffc6111), 16, FontWeight.bold),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: home_banner(
                  "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=",
                  "Cheese Pizza",
                  "3.5",
                  "Minutes in the Meal Time",
                  pay_chas_food(
                      data:
                          "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=" ??
                              "no image",
                      data1: 1500 ?? 1500),
                  context),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: home_banner(
                  "https://media.istockphoto.com/id/1377372234/photo/pizza-with-salami-bell-pepper-tomatoes-and-cheese-pickles-bacon-and-sausages-on-a-light.jpg?s=612x612&w=0&k=20&c=Cw2GlLY474sFLmBm4IFsSoSXV4wHZM-ub691aaDqLlw=",
                  "Pizza with salami, tomatoes and cheese, pickles",
                  "3.5",
                  "Minutes in the Meal Time",
                  pay_chas_food(
                    data:
                        "https://media.istockphoto.com/id/1377372234/photo/pizza-with-salami-bell-pepper-tomatoes-and-cheese-pickles-bacon-and-sausages-on-a-light.jpg?s=612x612&w=0&k=20&c=Cw2GlLY474sFLmBm4IFsSoSXV4wHZM-ub691aaDqLlw=" ??
                            "no image",
                    data1: 1000 ?? 1000,
                  ),
                  context),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: home_banner(
                  "https://media.istockphoto.com/id/1303119992/photo/pizza_margerita.jpg?s=612x612&w=0&k=20&c=0HZZMC10ySBYvMVAKUNzknkQ1E74q8NKwTV5_K6WK6M=",
                  "Cheese Pizza",
                  "3.5",
                  "Minutes in the Meal Time",
                  pay_chas_food(
                      data:
                          "https://media.istockphoto.com/id/1303119992/photo/pizza_margerita.jpg?s=612x612&w=0&k=20&c=0HZZMC10ySBYvMVAKUNzknkQ1E74q8NKwTV5_K6WK6M=" ??
                              "no image",
                      data1: 1600 ?? 1600),
                  context),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: home_banner(
                  "https://media.istockphoto.com/id/184946701/photo/pizza.jpg?s=612x612&w=0&k=20&c=97rc0VIi-s3mn4xe4xDy9S-XJ_Ohbn92XaEMaiID_eY=",
                  "Cheese Pizza",
                  "3.5",
                  "Minutes in the Meal Time",
                  pay_chas_food(
                      data:
                          "https://media.istockphoto.com/id/1303119992/photo/pizza_margerita.jpg?s=612x612&w=0&k=20&c=0HZZMC10ySBYvMVAKUNzknkQ1E74q8NKwTV5_K6WK6M=" ??
                              "no image",
                      data1: 1600 ?? 1600),
                  context),
            ),
            Padding(
              padding: EdgeInsets.only(bottom: 10.0),
              child: home_banner(
                  "https://media.istockphoto.com/id/1198079266/photo/deluxe-pizza-with-pepperoni-sausage-mushrooms-and-peppers.jpg?s=612x612&w=0&k=20&c=TCpJThR1MnAsantJcskN14Uvd5EsZP5JCA69rVBqJDM=",
                  "Cheese Pizza",
                  "3.5",
                  "Minutes in the Meal Time",
                  pay_chas_food(
                      data:
                          "https://media.istockphoto.com/id/1303119992/photo/pizza_margerita.jpg?s=612x612&w=0&k=20&c=0HZZMC10ySBYvMVAKUNzknkQ1E74q8NKwTV5_K6WK6M=" ??
                              "no image",
                      data1: 1600 ?? 1600),
                  context),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.0, bottom: 28),
                  child:
                      text("Most Popular", Colors.black, 23, FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 140.0, bottom: 28),
                  child: GestureDetector(
                    onTap: () {},
                    child: text(
                        "View All", Color(0xfffc6111), 16, FontWeight.bold),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    child: b(
                      "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=",
                      BoxShape.rectangle,
                      BoxFit.cover,
                      BorderRadius.circular(20),
                      "Cafe De Bambaa",
                      "4.9",
                      "Cafe. Western Food",
                      13,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20, bottom: 20),
                    child: b(
                        "https://media.istockphoto.com/id/1198079266/photo/deluxe-pizza-with-pepperoni-sausage-mushrooms-and-peppers.jpg?s=612x612&w=0&k=20&c=TCpJThR1MnAsantJcskN14Uvd5EsZP5JCA69rVBqJDM=",
                        BoxShape.rectangle,
                        BoxFit.cover,
                        BorderRadius.circular(20),
                        "Cafe De Bambaa",
                        "4.9",
                        "Cafe. Western Food",
                        13),
                  ),
                  Padding(
                    padding: EdgeInsets.only(right: 20, bottom: 20),
                    child: b(
                        "https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg?auto=compress&cs=tinysrgb&w=600",
                        BoxShape.rectangle,
                        BoxFit.cover,
                        BorderRadius.circular(20),
                        "Cafe De Bambaa",
                        "4.9",
                        "Cafe. Western Food",
                        13),
                  ),
                ],
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 18.0, bottom: 28),
                  child:
                      text("Recent Items", Colors.black, 23, FontWeight.bold),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 140.0, bottom: 28),
                  child: GestureDetector(
                    onTap: () {},
                    child: text(
                        "View All", Color(0xfffc6111), 16, FontWeight.bold),
                  ),
                ),
              ],
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, bottom: 20, right: 70),
                        child: recent(
                            "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=",
                            "Mulberry Pizza by Josh",
                            "Cafe. Western Food",
                            "5.0",
                            "(123M Rating)"),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, bottom: 20, right: 70),
                        child: recent(
                            "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=",
                            "Mulberry Pizza by Josh",
                            "Cafe. Western Food",
                            "5.0",
                            "(123M Rating)"),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, bottom: 20, right: 70),
                        child: recent(
                            "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=",
                            "Mulberry Pizza by Josh",
                            "Cafe. Western Food",
                            "5.0",
                            "(123M Rating)"),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, bottom: 20, right: 70),
                        child: recent(
                            "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=",
                            "Mulberry Pizza by Josh",
                            "Cafe. Western Food",
                            "5.0",
                            "(123M Rating)"),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, bottom: 20, right: 70),
                        child: recent(
                            "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=",
                            "Mulberry Pizza by Josh",
                            "Cafe. Western Food",
                            "5.0",
                            "(123M Rating)"),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, bottom: 20, right: 70),
                        child: recent(
                            "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=",
                            "Mulberry Pizza by Josh",
                            "Cafe. Western Food",
                            "5.0",
                            "(123M Rating)"),
                      ),
                    ],
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, bottom: 20, right: 70),
                        child: recent(
                            "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=",
                            "Mulberry Pizza by Josh",
                            "Cafe. Western Food",
                            "5.0",
                            "(123M Rating)"),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, bottom: 20, right: 70),
                        child: recent(
                            "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=",
                            "Mulberry Pizza by Josh",
                            "Cafe. Western Food",
                            "5.0",
                            "(123M Rating)"),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.only(left: 20.0, bottom: 20, right: 70),
                        child: recent(
                            "https://media.istockphoto.com/id/1442417585/photo/person-getting-a-piece-of-cheesy-pepperoni-pizza.jpg?s=612x612&w=0&k=20&c=k60TjxKIOIxJpd4F4yLMVjsniB4W1BpEV4Mi_nb4uJU=",
                            "Mulberry Pizza by Josh",
                            "Cafe. Western Food",
                            "5.0",
                            "(123M Rating)"),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: 250,
            )
          ],
        ),
      ),
    );
  }
}
