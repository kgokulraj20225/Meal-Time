import 'package:flutter/material.dart';
import 'package:meal_time/allfun.dart';
import 'package:meal_time/home/more/setting.save_address.dart';

class notification extends StatefulWidget {
  const notification({super.key});

  @override
  State<notification> createState() => _notificationState();
}

class _notificationState extends State<notification> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back_ios)),
        title: text("Settings", Colors.black, 30, FontWeight.bold),
        actions: [
          IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.shopping_cart,
                size: 25,
              ))
        ],
      ),
      body: sett(),
    );
  }
}

class sett extends StatefulWidget {
  const sett({super.key});

  @override
  State<sett> createState() => _settState();
}

class _settState extends State<sett> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Padding(
              padding: const EdgeInsets.only(
            top: 28.0,
          )),
          more_caterage(Icons.save, "Saved Address", save_address()),
        ],
      ),
    );
  }
}
