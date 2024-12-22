import 'package:flutter/material.dart';
import 'package:meal_time/allfun.dart';
// import 'package:meal_time/home/food_home_page/dessert_page.bannerview.dart';

import '../home_page/buying_food.dart';

class dessert_view extends StatefulWidget {
  const dessert_view({super.key});

  @override
  State<dessert_view> createState() => _dessert_viewState();
}

class _dessert_viewState extends State<dessert_view> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdfdfd),
      appBar: AppBar(
        backgroundColor: Color(0xfffdfdfd),
        title: text("Desserts", Colors.black, 30, FontWeight.bold),
        actions: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.shopping_cart,
                  size: 25,
                )),
          ),
        ],
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(60.0), // Adjust height as needed
          child: Padding(
            padding: const EdgeInsets.all(10.0),
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
      ),
      body: dessert2(),
    );
  }
}

class dessert2 extends StatefulWidget {
  const dessert2({super.key});

  @override
  State<dessert2> createState() => _dessert2State();
}

class _dessert2State extends State<dessert2> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            banner(
                "https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg?auto=compress&cs=tinysrgb&w=600",
                "French Berrys Honey Cake",
                "4.9",
                "Minute by tuk tuk \t Desserts",
                pay_chas_food(
                    data:
                        "https://images.pexels.com/photos/1126359/pexels-photo-1126359.jpeg?auto=compress&cs=tinysrgb&w=600" ??
                            "no image",
                    data1: 600 ?? 600),
                context),
            banner(
                "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=600",
                "Waffels with Stawbeery",
                "4.0",
                "Cake by tuk tuk \t Desserts",
                pay_chas_food(
                    data:
                        "https://images.pexels.com/photos/376464/pexels-photo-376464.jpeg?auto=compress&cs=tinysrgb&w=600" ??
                            "no image",
                    data1: 400 ?? 400),
                context),
            banner(
                "https://images.pexels.com/photos/827513/pexels-photo-827513.jpeg?auto=compress&cs=tinysrgb&w=600",
                "Desserts with BlueBeery",
                "4.5",
                "Cake by Meal Time \t Desserts",
                pay_chas_food(
                    data:
                        "https://images.pexels.com/photos/827513/pexels-photo-827513.jpeg?auto=compress&cs=tinysrgb&w=600" ??
                            "no image",
                    data1: 350 ?? 350),
                context),
            banner(
                "https://images.pexels.com/photos/2693447/pexels-photo-2693447.jpeg?auto=compress&cs=tinysrgb&w=600",
                "PanCakeDesserts with Cherry ",
                "3.8",
                "Dessert by Racer \t Desserts",
                pay_chas_food(
                    data:
                        "https://images.pexels.com/photos/2693447/pexels-photo-2693447.jpeg?auto=compress&cs=tinysrgb&w=600" ??
                            "no image",
                    data1: 160 ?? 160),
                context),
          ],
        ),
      ),
    );
  }
}
