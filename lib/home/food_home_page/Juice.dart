import 'package:flutter/material.dart';

import '../../allfun.dart';
import '../home_page/buying_food.dart';

class bev extends StatefulWidget {
  const bev({super.key});

  @override
  State<bev> createState() => _bevState();
}

class _bevState extends State<bev> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdfdfd),
      appBar: AppBar(
        backgroundColor: Color(0xfffdfdfd),
        title: text("Fresh Juices", Colors.black, 30, FontWeight.bold),
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
                  "Search juices"),
            ),
          ),
        ),
      ),
      body: juices(),
    );
  }
}

class juices extends StatefulWidget {
  const juices({super.key});

  @override
  State<juices> createState() => _juicesState();
}

class _juicesState extends State<juices> {
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
                "https://images.pexels.com/photos/338713/pexels-photo-338713.jpeg?auto=compress&cs=tinysrgb&w=400",
                "French Berrys Honey Cake",
                "4.9",
                "Minute by tuk tuk \t Desserts",
                pay_chas_food(
                    data:
                        "https://images.pexels.com/photos/338713/pexels-photo-338713.jpeg?auto=compress&cs=tinysrgb&w=400" ??
                            "no image",
                    data1: 600 ?? 600),
                context),
            banner(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyzMja0z0KkAcVVRz2PzFm8MXwVY_b7KgMuQ&s",
                "Waffels with Stawbeery",
                "4.0",
                "Cake by tuk tuk \t Desserts",
                pay_chas_food(
                    data:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSyzMja0z0KkAcVVRz2PzFm8MXwVY_b7KgMuQ&s" ??
                            "no image",
                    data1: 400 ?? 400),
                context),
            banner(
                "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc57zhf_In6EHQCuECgnoQ7juvvOtn7uZz8Q&s",
                "Desserts with BlueBeery",
                "4.5",
                "Cake by Meal Time \t Desserts",
                pay_chas_food(
                    data:
                        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc57zhf_In6EHQCuECgnoQ7juvvOtn7uZz8Q&s" ??
                            "no image",
                    data1: 350 ?? 350),
                context),
            banner(
                "https://images.pexels.com/photos/2110923/pexels-photo-2110923.jpeg?auto=compress&cs=tinysrgb&w=400",
                "PanCakeDesserts with Cherry ",
                "3.8",
                "Dessert by Racer \t Desserts",
                pay_chas_food(
                    data:
                        "https://images.pexels.com/photos/2110923/pexels-photo-2110923.jpeg?auto=compress&cs=tinysrgb&w=400" ??
                            "no image",
                    data1: 160 ?? 160),
                context),
          ],
        ),
      ),
    );
  }
}
