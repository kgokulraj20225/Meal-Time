import 'package:flutter/material.dart';
import 'package:meal_time/home/home.dart';
import 'package:meal_time/login_details/registry.dart';
import 'package:meal_time/splash%20screen.dart';
import 'allfun.dart';
import 'package:firebase_core/firebase_core.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(first());
}

String ip = "192.168.144.81";

class first extends StatefulWidget {
  const first({super.key});

  @override
  State<first> createState() => _firstState();
}

class _firstState extends State<first> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // initialRoute: '/signup',
      // routes: {
      //   '/signup': (context) => create(),
      //   '/home': (context) => HomePageWithTabs(),
      // },
      home: First_page(),
    );
  }
}

class home extends StatefulWidget {
  const home({super.key});

  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        // appBar: AppBar(),
        body: home1(),
      ),
    );
  }
}

class home1 extends StatefulWidget {
  const home1({super.key});

  @override
  State<home1> createState() => _home1State();
}

class _home1State extends State<home1> {
  List<Widget> a = <Widget>[
    Center(
      child: all(),
    ),
    Center(
      child: all(),
    ),
    Center(
      child: all(),
    ),
    Center(
      child: all(),
    ),
    Center(
      child: all(),
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 5,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            'Menu',
            style: TextStyle(
                color: Color(0xff6e6e6e), fontWeight: FontWeight.bold),
          ),
          actions: [
            IconButton(
              icon: Icon(
                Icons.notifications_none,
                size: 40,
              ),
              onPressed: () {},
            ),
          ],
        ),
        body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                    boxShadow: [
                      BoxShadow(
                          color: Colors.black.withOpacity(0.5),
                          blurRadius: 7,
                          spreadRadius: 3,
                          offset: Offset(0, 3))
                    ]),
                child: Center(
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Search Your Menus',
                      prefixIcon: Icon(Icons.search),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 25.0),
              text("Our Food", Color(0xff6e6e6e), 15, FontWeight.bold),
              text("Special For You", Colors.orange, 25, FontWeight.bold),
              SizedBox(height: 10.0),
              TabBar(
                isScrollable: true,
                tabs: [
                  Tab(text: 'All'),
                  Tab(text: 'Featured'),
                  Tab(text: 'Top of Week'),
                  Tab(text: 'Soup'),
                  Tab(text: 'Seafood'),
                ],
                labelColor: Colors.orange,
                unselectedLabelColor: Colors.black,
                physics: BouncingScrollPhysics(),
                automaticIndicatorColorAdjustment: true,
              ),
              Expanded(
                child: TabBarView(
                  children: a,
                ),
              ),
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          selectedItemColor: Colors.orange,
          unselectedItemColor: Colors.orange,
          items: [
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home()));
                  },
                  icon: Icon(
                    Icons.home_outlined,
                    size: 30,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: IconButton(
                  onPressed: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => home()));
                  },
                  icon: Icon(
                    Icons.shopping_cart,
                    size: 30,
                  ),
                ),
                label: ''),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => home()));
                    },
                    icon: Icon(
                      Icons.list_alt_outlined,
                      size: 30,
                    )),
                label: 'Profile'),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => home()));
                    },
                    icon: Icon(
                      Icons.person_outline,
                      size: 30,
                    )),
                label: ''),
            BottomNavigationBarItem(
                icon: IconButton(
                    onPressed: () {
                      Navigator.push(context,
                          MaterialPageRoute(builder: (context) => home()));
                    },
                    icon: Icon(
                      Icons.messenger_outline,
                      size: 30,
                    )),
                label: ''),
          ],
        ),
      ),
    );
  }
}

class all extends StatefulWidget {
  const all({super.key});

  @override
  State<all> createState() => _allState();
}

class _allState extends State<all> {
  Widget piccontainer(String img, String tx, String tx1) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => home()));
      },
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image(
              fit: BoxFit.fill,
              width: 165,
              height: 165,
              alignment: Alignment.topCenter,
              image: NetworkImage(
                img,
              ),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            tx,
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
          Text(
            tx1,
            style: TextStyle(color: Colors.orange, fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        Padding(
          padding: EdgeInsets.all(5),
          child: Column(
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    piccontainer(
                        "https://t3.ftcdn.net/jpg/03/13/00/70/240_F_313007059_Lbgy6IGzphFh9xFpNOMSa8AaEdg89yVL.jpg",
                        "Squild Sweet b Sour....",
                        "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer(
                        "https://t3.ftcdn.net/jpg/02/48/92/96/240_F_248929619_JkVBYroM1rSrshWJemrcjriggudHMUhV.jpg",
                        "Squild Sweet b Sour....",
                        "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer(
                        "https://t3.ftcdn.net/jpg/02/55/53/44/240_F_255534476_n8JzjZtzOFW5g3TXTLMd6QGVnToi6hqj.jpg",
                        "Squild Sweet b Sour....",
                        "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer(
                        "https://t4.ftcdn.net/jpg/02/09/31/77/240_F_209317774_yDBNUzK0JuAB3HgBrHFlAm0Xi8GrbKKP.jpg",
                        "Squild Sweet b Sour....",
                        "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer(
                        "https://t4.ftcdn.net/jpg/02/09/31/77/240_F_209317774_yDBNUzK0JuAB3HgBrHFlAm0Xi8GrbKKP.jpg",
                        "Squild Sweet b Sour....",
                        "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer(
                        "https://t4.ftcdn.net/jpg/01/88/78/99/240_F_188789920_QJZ7Vj46XdVLSfHK4o0Q74MLOMeFVo7m.jpg",
                        "Squild Sweet b Sour....",
                        "\$ 18.29"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    piccontainer(
                        "https://t3.ftcdn.net/jpg/03/13/00/70/240_F_313007059_Lbgy6IGzphFh9xFpNOMSa8AaEdg89yVL.jpg",
                        "Squild Sweet b Sour....",
                        "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer(
                        "https://t4.ftcdn.net/jpg/02/09/31/77/240_F_209317774_yDBNUzK0JuAB3HgBrHFlAm0Xi8GrbKKP.jpg",
                        "Squild Sweet b Sour....",
                        "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer(
                        "https://t3.ftcdn.net/jpg/02/55/53/44/240_F_255534476_n8JzjZtzOFW5g3TXTLMd6QGVnToi6hqj.jpg",
                        "Squild Sweet b Sour....",
                        "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer(
                        "https://t3.ftcdn.net/jpg/02/81/76/44/240_F_281764445_OWXUobpyBgxQw6LU3sckSY0nGGVTeoXs.jpg",
                        "Squild Sweet b Sour....",
                        "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer(
                        "https://t3.ftcdn.net/jpg/00/52/30/24/240_F_52302491_UKE2P7dSdkK9WhCPfk7T4xD6Yu3Gc7dx.jpg",
                        "Squild Sweet b Sour....",
                        "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer(
                        "https://t4.ftcdn.net/jpg/03/13/50/71/240_F_313507159_6Y1UnTwolwy7a9C7QxAjAWuqaxXoBxo8.jpg",
                        "Squild Sweet b Sour....",
                        "\$ 18.29"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                    SizedBox(
                      width: 20,
                    ),
                    piccontainer("https://wallpaperaccess.com/full/9327602.jpg",
                        "Squild Sweet b Sour....", "\$ 18.29"),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
            ],
          ),
        )
      ],
    );
  }
}
