import 'package:flutter/material.dart';
import 'package:meal_time/allfun.dart';
import 'package:meal_time/home/home.dart';
import 'package:meal_time/home/home_page/buying_food.dart';
import 'package:meal_time/home/home_page/hoem_page.dart';
import 'package:meal_time/home/home_page/homepage.addaddress.dart';
import 'package:meal_time/home/more/morepage.paymentdetails.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:meal_time/main.dart';
import 'package:shared_preferences/shared_preferences.dart';

class order_place extends StatefulWidget {
  const order_place({super.key});

  @override
  State<order_place> createState() => _order_placeState();
}

class _order_placeState extends State<order_place> {
  Future<void> _reterrrive_address() async {
    SharedPreferences preder = await SharedPreferences.getInstance();
    //
    // if (await preder.getBool("addaddress") == true) {
    //   Navigator.pop(context);
    // } else {
    //   Navigator.pushReplacement(
    //     context,
    //     MaterialPageRoute(builder: (context) => add_address()),
    //   );
    // }
    if (Navigator.canPop(context)) {
      Navigator.pop(context);
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
            builder: (context) => add_address()), // Or another fallback page
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xfffdfdfd),
      appBar: AppBar(
        // leading: IconButton(
        //     onPressed: () {
        //       Navigator.pop(context);
        //     },
        //     icon: Icon(Icons.arrow_back_ios)),
        leading: IconButton(
            onPressed: _reterrrive_address, icon: Icon(Icons.arrow_back_ios)),
        title: text("Checkout", Colors.black, 25, FontWeight.bold),
        backgroundColor: Color(0xfffdfdfd),
      ),
      body: place(),
      // ),
    );
  }
}

class place extends StatefulWidget {
  const place({super.key});

  @override
  State<place> createState() => _placeState();
}

class _placeState extends State<place> {
  String addname = "";
  String addarea = "";
  String addhouseno = "";
  String addpincode = "";
  String addcity = "";
  double deliverycost = 25;
  double discount = add1 * 10 / 100 ?? 200;
  double total = 0 ?? 1000;

  void initState() {
    super.initState();

    _reterive_address();

    _toggleVisibility();
  }

  Future<void> _reterive_address() async {
    SharedPreferences preder = await SharedPreferences.getInstance();
    await preder.setBool("addaddress", true);
    setState(() {
      addname = preder.getString("fullname") ?? "unknown";
      addarea = preder.getString("area") ?? "unknown";
      addhouseno = preder.getString("houseno") ?? "unknown";
      addpincode = preder.getString("pincode") ?? "unknown";
      addcity = preder.getString("city") ?? "unknown";
    });
  }

  bool _obscureText = true;
  bool _obscureText1 = true;
  bool _obscureText2 = true;

  void _toggleVisibility() {
    setState(() {
      _obscureText = false;
      _obscureText1 = true;
      _obscureText2 = true;
    });
  }

  Future<void> _editaddress(BuildContext context) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();

    // Remove the 'login' key to clear the logged-in state
    await prefs.remove('addaddress');

    // Clear the entire navigation stack and go to the Onboard screen
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(builder: (context) => address()),
      (route) => false,
    );
  }

  Widget a(String t1, dynamic t2, Color c1, Color c2, double n1) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Padding(
              padding: EdgeInsets.only(bottom: 3, top: 12, right: 12),
              child: text(t1, c1, 16, FontWeight.bold),
            ),
            text(t2, c2, n1, FontWeight.normal)
          ],
        ),
      ],
    );
  }

  Widget a1() {
    return Divider(
      color: Colors.grey,
      thickness: 0.5, // Customize the thickness of the line
      indent: 15, // Adds left padding to the line
      endIndent: 15,
    );
  }

  void _toggleVisibility1() {
    setState(() {
      _obscureText1 = !_obscureText1;
      _obscureText = true;
      _obscureText2 = true;
    });
  }

  void _toggleVisibility2() {
    setState(() {
      _obscureText2 = !_obscureText2;
      _obscureText1 = true;
      _obscureText = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    total = add1 + deliverycost - discount;

    final screensize = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text("Delivery Address", Colors.black.withOpacity(0.6), 16,
                FontWeight.bold),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Flexible(
                    child: text(
                        "$addname,\n$addhouseno,$addarea,\n$addcity,$addpincode",
                        Colors.black,
                        18,
                        FontWeight.bold),
                  ),
                  GestureDetector(
                    onTap: () => _editaddress(context),
                    // () {
                    //   Navigator.push(
                    //       context,
                    //       MaterialPageRoute(
                    //           builder: (context) => add_address()));
                    // },

                    child:
                        text("Change", Color(0xfffc6111), 16, FontWeight.bold),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(left: 8.0, top: 5),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => address()));
                },
                child:
                    text("Add Address", Color(0xfffc6111), 16, FontWeight.bold),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: 20.0,
              ),
              child: Container(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        text("payment method", Colors.black.withOpacity(0.6),
                            14, FontWeight.bold),
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => payament()));
                          },
                          child: text("+ Add Card", Color(0xfffc6111), 16,
                              FontWeight.bold),
                        ),
                      ],
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: GestureDetector(
                        onTap: _toggleVisibility,
                        child: Container(
                          height: 50,
                          width: screensize.width * 1,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.07),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                text(
                                    "Cash on delivery",
                                    Colors.black.withOpacity(0.7),
                                    18,
                                    FontWeight.bold),
                                IconButton(
                                  onPressed: _toggleVisibility,
                                  icon: Icon(
                                    color: Color(0xfffc6111),
                                    _obscureText
                                        ? Icons.fiber_manual_record_outlined
                                        : Icons.fiber_manual_record,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0),
                      child: GestureDetector(
                        onTap: _toggleVisibility1,
                        child: Container(
                          height: 50,
                          width: screensize.width * 1,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.07),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                text("VISA", Colors.blueAccent, 20,
                                    FontWeight.bold),
                                Padding(
                                  padding: EdgeInsets.only(right: 100.0),
                                  child: text(
                                      ".... .... ....6766",
                                      Colors.black.withOpacity(0.7),
                                      18,
                                      FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: _toggleVisibility1,
                                  icon: Icon(
                                    color: Color(0xfffc6111),
                                    _obscureText1
                                        ? Icons.fiber_manual_record_outlined
                                        : Icons.fiber_manual_record,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.only(top: 15.0, bottom: 20),
                      child: GestureDetector(
                        onTap: _toggleVisibility2,
                        child: Container(
                          height: 50,
                          width: screensize.width * 1,
                          decoration: BoxDecoration(
                              color: Colors.grey.withOpacity(0.07),
                              borderRadius: BorderRadius.circular(10)),
                          child: Padding(
                            padding: EdgeInsets.only(left: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Icon(
                                  FontAwesomeIcons.googlePay,
                                  color: Colors.blueAccent,
                                ),
                                Padding(
                                  padding: EdgeInsets.only(right: 70.0),
                                  child: text(
                                      "kgokulraj.developer@gmail.com",
                                      Colors.black.withOpacity(0.7),
                                      12,
                                      FontWeight.bold),
                                ),
                                IconButton(
                                  onPressed: _toggleVisibility2,
                                  icon: Icon(
                                    color: Color(0xfffc6111),
                                    _obscureText2
                                        ? Icons.fiber_manual_record_outlined
                                        : Icons.fiber_manual_record,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ),
                    a("Quantity", "$add", Colors.black, Color(0xfffc6111), 16),
                    a("Sub Total", "₹$add1", Colors.black, Color(0xfffc6111),
                        16),
                    a("Delivery Cost", "₹$deliverycost", Colors.black,
                        Color(0xfffc6111), 16),
                    a("discount", "- ₹$discount", Colors.black,
                        Color(0xfffc6111), 16),
                    a1(),
                    a("Total", "₹$total", Colors.black, Color(0xfffc6111), 25),
                    Padding(
                      padding: EdgeInsets.only(
                          left: 40.0, right: 40, top: 30, bottom: 100),
                      child: GestureDetector(
                        onTap: () {
                          showBottomSheet(
                              context: context,
                              builder: (context) {
                                return aa1();
                              });
                        },
                        child: Container(
                          margin:
                              EdgeInsets.only(bottom: 20), // Adjusting margin
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(45),
                            color: Color(0xfffc6111),
                          ),
                          height: 65,

                          width: screensize.width * 1,
                          child: Center(
                            child: Text(
                              "Place the Order",
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                              ),
                            ),
                          ),
                        ),
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

class aa1 extends StatefulWidget {
  const aa1({super.key});

  @override
  State<aa1> createState() => _aa1State();
}

class _aa1State extends State<aa1> {
  @override
  Widget build(BuildContext context) {
    final screensize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Container(
        child: Stack(
          children: [
            Container(
              height: 680,
              width: double.infinity,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      // blurRadius: 850,
                      spreadRadius: 300,
                      color: Colors.grey.withOpacity(0.7))
                ],
                borderRadius: BorderRadius.only(
                  topRight: Radius.circular(30),
                  topLeft: Radius.circular(30),
                ),
                color: Color(0xfffdfdfd),
              ),
              child: ListView(
                // crossAxisAlignment: CrossAxisAlignment.center,

                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 330.0),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: Icon(
                          Icons.close,
                          color: Colors.black,
                        )),
                  ),
                  Container(
                      height: 250, // Ensure the container has height
                      width: double.infinity / 2, // Set width to match parent
                      decoration: BoxDecoration(
                        // color: Colors.red,
                        shape: BoxShape.rectangle,
                        image: DecorationImage(
                          scale: 1,
                          image: AssetImage(
                            "assets/i99.jpg",
                          ),
                          // fit: BoxFit.fill, // Adjust image fitting
                        ),
                      )),
                  Padding(
                    padding: EdgeInsets.only(
                      top: 15.0,
                    ),
                    child: Center(
                        child: text(
                            "Thank You!", Colors.black, 30, FontWeight.bold)),
                  ),
                  Center(
                      child: text(
                          "for your order", Colors.black, 20, FontWeight.bold)),
                  Padding(
                    padding: EdgeInsets.all(15.0),
                    child: text(
                        "Thank you for your order! Your order has been successfully placed and is being processed. You will receive an email confirmation shortly with the order details. If you have any questions or need further assistance, please feel free to contact our support team. We appreciate your business and look forward to serving you again!",
                        Colors.grey,
                        10,
                        FontWeight.bold),
                  ),
                  Padding(
                    padding: EdgeInsets.only(
                        left: 40.0, right: 40, top: 30, bottom: 100),
                    child: GestureDetector(
                      onTap: () {
                        Navigator.pushAndRemoveUntil(
                          context,
                          MaterialPageRoute(
                              builder: (context) =>
                                  HomePageWithTabs()), // Replace with your home screen widget
                          (Route<dynamic> route) =>
                              false, // This removes all the routes in the stack
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(bottom: 20), // Adjusting margin
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(45),
                          color: Color(0xfffc6111),
                        ),
                        height: 65,

                        width: screensize.width * 1,
                        child: Center(
                          child: Text(
                            "Back To Home",
                            style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    height: 100,
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
