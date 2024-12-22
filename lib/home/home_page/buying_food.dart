import 'package:flutter/material.dart';
import 'package:meal_time/allfun.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_time/home/home_page/hoem_page.dart';
import 'package:meal_time/home/home_page/homepage.addaddress.dart';
import 'package:meal_time/home/home_page/homepage.order_place.dart';
import 'package:shared_preferences/shared_preferences.dart';

class pay_chas_food extends StatefulWidget {
  final dynamic data;
  final dynamic data1;
  pay_chas_food({
    super.key,
    required this.data,
    required this.data1,
  });

  @override
  State<pay_chas_food> createState() => _pay_chas_foodState();
}

class _pay_chas_foodState extends State<pay_chas_food> {
  @override
  Widget build(
    BuildContext context,
  ) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.transparent, // Transparent AppBar
            elevation: 0, // Remove shadow
            leading: IconButton(
              icon: Icon(Icons.arrow_back_ios, color: Colors.white),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            actions: [
              IconButton(
                icon: Icon(Icons.shopping_cart, color: Colors.white),
                onPressed: () {
                  // Your cart functionality here
                },
              ),
            ],
          ),
          extendBodyBehindAppBar: true,
          body: puchase_food(data: widget.data, data1: widget.data1),
        ));
  }
}

int add = 1;
int add1 = 1500;

class puchase_food extends StatefulWidget {
  final String data;
  final int data1;
  const puchase_food({super.key, required this.data, required this.data1});

  @override
  State<puchase_food> createState() => _puchase_foodState();
}

class _puchase_foodState extends State<puchase_food> {
  bool _obscureText = true;
  bool _obscureText1 = true;
  void _toggleVisibility() {
    setState(() {
      _obscureText = !_obscureText;
    });
  }

  bool _addaddress = false;
  @override
  void initState() {
    super.initState();
    _checkaddress();
    _add();
  }

  Future<void> _checkaddress() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    bool addaddress = prefs.getBool("addaddress") ?? false;
    setState(() {
      _addaddress = addaddress ?? false;
    });
  }

  void _toggleVisibility1() {
    setState(() {
      _obscureText1 = !_obscureText1;
    });
  }

  void dispose() {
    _add();
  }

  Future<void> _add() async {
    add = 1;
    add1 = widget.data1;
  }

  void _increament() {
    setState(() {
      add++;
      if (add >= 1) {
        add1 = 0;
        add1 = add1 + (add * widget.data1);
      }
    });
  }

  void _decreament() {
    setState(() {
      if (add > 1) {
        add--;
        if (add >= 1) {
          add1 = add1 - widget.data1;
        }
      }
    });
  }

  String? selectedSize;
  String? selectedIngredient;

  List<String> sizeOptions = ['Small', 'Medium', 'Large'];
  List<String> ingredientOptions = [
    'Cheese',
    'Pepperoni',
    'Mushrooms',
    'Onions'
  ];

  Widget st() {
    return IconButton(
      onPressed: _toggleVisibility,
      icon: Icon(
        color: Color(0xfffc6111),
        _obscureText ? Icons.star_border_outlined : Icons.star,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screen = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
        ),
        Positioned(
          top: 0,
          child: Container(
              height: 400,
              clipBehavior: Clip.hardEdge,
              width: screen.width * 1,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(widget.data)))),
        ),
        Container(
          clipBehavior: Clip.hardEdge,
          height: 600,
          width: screen.width * 1,
          decoration: BoxDecoration(
              color: Color(0xfffdfdfd),
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50), topRight: Radius.circular(50))),
          child: ListView(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  left: 20.0,
                ),
                child: text(
                    "Cheese fulled Pizza", Colors.black, 27, FontWeight.bold),
              ),
              Row(
                children: [
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.only(left: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            st(),
                            st(),
                            st(),
                            st(),
                            st(),
                          ],
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.only(right: 90.0),
                        child: text("5 Star Rating", Color(0xfffc6111), 16,
                            FontWeight.bold),
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 22),
                    child: Column(
                      children: [
                        text("Rs. $add1", Colors.black.withOpacity(0.6), 25,
                            FontWeight.bold),
                        text("/ per Portion", Colors.black.withOpacity(0.6), 16,
                            FontWeight.bold),
                      ],
                    ),
                  ),
                ],
              ),
              Padding(
                padding: EdgeInsets.only(left: 13.0),
                child: text("Description", Colors.black.withOpacity(0.5), 16,
                    FontWeight.bold),
              ),
              Padding(
                padding: EdgeInsets.all(20.0),
                child: text(
                    "Pizza is a beloved dish that originated in Italy and has since become a global culinary phenomenon. It's a versatile food, typically consisting of a round, flat base of dough topped with tomato sauce, cheese, and various other ingredients like meats, vegetables, and herbs. Whether enjoyed in its classic form as a Margherita with just tomatoes, mozzarella, and basil, or with a variety of creative toppings, pizza offers something for everyone. Its crispy crust, gooey cheese, and flavorful toppings make it a favorite for casual meals, gatherings, and even gourmet dining experiences. The beauty of pizza lies in its simplicity and the endless possibilities it offers for customization, making it a dish that can be tailored to any taste.",
                    Colors.grey,
                    13,
                    FontWeight.bold),
              ),
              Divider(
                color: Colors.grey,
                thickness: 0.5, // Customize the thickness of the line
                indent: 25, // Adds left padding to the line
                endIndent: 35,
              ),
              Padding(
                padding: EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Customize your Order',
                        style: TextStyle(fontSize: 18)),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      focusColor: Color(0xfffc6111),
                      value: selectedSize,
                      hint: Text('- Select the size of portion -'),
                      onChanged: (value) {
                        setState(() {
                          selectedSize = value;
                        });
                      },
                      items: sizeOptions.map((size) {
                        return DropdownMenuItem<String>(
                          value: size,
                          child: Text(size),
                        );
                      }).toList(),
                    ),
                    SizedBox(height: 16),
                    DropdownButtonFormField<String>(
                      value: selectedIngredient,
                      hint: Text('- Select the ingredients -'),
                      onChanged: (value) {
                        setState(() {
                          selectedIngredient = value;
                        });
                      },
                      items: ingredientOptions.map((ingredient) {
                        return DropdownMenuItem<String>(
                          value: ingredient,
                          child: Text(ingredient),
                        );
                      }).toList(),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 13.0),
                    child: text("Number of Portions",
                        Colors.black.withOpacity(0.8), 16, FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 10.0),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xfffc6111)),
                        onPressed: _decreament,
                        child: Icon(
                          Icons.remove,
                          color: Colors.white,
                        )),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                    decoration: BoxDecoration(
                      border: Border.all(color: Colors.orange, width: 2),
                      borderRadius: BorderRadius.circular(20),
                    ),
                    child: Text(
                      '$add',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    ),
                  ),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color(0xfffc6111)),
                      onPressed: _increament,
                      child: Icon(
                        Icons.add,
                        color: Colors.white,
                      )),
                ],
              ),
              Stack(
                alignment: Alignment.center,
                children: [
                  Container(
                    height: 250,
                    // color: Colors.red,
                  ),
                  Positioned(
                    left: 0,
                    child: Container(
                      height: 220,
                      width: screen.width * 0.32,
                      decoration: BoxDecoration(
                          boxShadow: [
                            BoxShadow(
                                color: Colors.grey,
                                offset: Offset(0, 10),
                                // spreadRadius: 9,
                                blurRadius: 15)
                          ],
                          color: Color(0xfffc6111),
                          borderRadius: BorderRadius.horizontal(
                              // left: Radius.circular(50),
                              right: Radius.circular(50))),
                    ),
                  ),
                  Positioned(
                    right: 50,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Color(0xfffdfdfd),
                            boxShadow: [
                              BoxShadow(
                                  color: Colors.grey,
                                  offset: Offset(4, 10),
                                  // spreadRadius: 9,
                                  blurRadius: 10)
                            ],
                            borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(60),
                                bottomLeft: Radius.circular(60),
                                topRight: Radius.circular(15),
                                bottomRight: Radius.circular(15))),
                        height: 160,
                        width: screen.width * 0.7,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            text("Total Price", Colors.black, 13,
                                FontWeight.bold),
                            text(
                                "Rs. $add1", Colors.black, 23, FontWeight.bold),
                            GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) => _addaddress
                                            ? order_place()
                                            : add_address()));
                              },
                              child: Container(
                                height: 35,
                                width: 150,
                                decoration: BoxDecoration(
                                    color: Color(0xfffc6111),
                                    borderRadius: BorderRadius.circular(30)),
                                child: Center(
                                  child: text("Order Place", Colors.white, 16,
                                      FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    right: 38,
                    child: Container(
                      height: 40,
                      width: 40,
                      decoration: BoxDecoration(
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey,
                              offset: Offset(0, 10),
                              blurRadius: 12)
                        ],
                        color: Color(0xfffdfdfd),
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                      ),
                      child: Builder(builder: (context) {
                        return IconButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => home_page()),
                            );
                          },
                          icon: Icon(
                            Icons.shopping_cart,
                            color: Color(0xfffc6111),
                          ),
                        );
                      }),
                    ),
                  ),
                ],
              ),
              Container(
                height: 150,
              )
            ],
          ),
        ),
        Positioned(
          top: 235,
          right: 50,
          child: ClipPath(
            clipper: TriangleClipper(),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Color(0xfffdfdfd),
                ),
                height: 75,
                width: 75,
                child: IconButton(
                  onPressed: _toggleVisibility1,
                  icon: Icon(
                    color: Color(0xfffc6111),
                    _obscureText1
                        ? FontAwesomeIcons.heart
                        : FontAwesomeIcons.solidHeart,
                  ),
                )),
          ),
        ),
        Positioned(
          top: 235,
          right: 50,
          child: ClipPath(
            clipper: TriangleClipper1(),
            child: Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(60),
                  color: Color(0xfffc6111),
                ),
                height: 75,
                width: 75,
                child: IconButton(
                  onPressed: _toggleVisibility1,
                  icon: Icon(
                    color: Color(0xfffdfdfd),
                    _obscureText1
                        ? FontAwesomeIcons.heart
                        : FontAwesomeIcons.solidHeart,
                  ),
                )),
          ),
        ),
      ],
    ));
  }
}

class TriangleClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(size.width, 0) // Add line p1p2
      ..lineTo(size.width, size.height)
      // ..lineTo(0, size.height) // Add line p1p2
      // ..lineTo(size.width, size.height) // Add line p2p3
      ..close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper oldClipper) => false;
}

class TriangleClipper1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path()
      ..lineTo(0, size.height) // Add line p1p2
      ..lineTo(size.width, size.height) // Add line p2p3
      ..close();

    return path;
  }

  @override
  bool shouldReclip(TriangleClipper1 oldClipper) => false;
}
