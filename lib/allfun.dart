import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:file/local.dart';
import "login_details/registry.dart";

Widget text(String text, Color color, double size, FontWeight weight) {
  return Container(
    child: Text(
      text,
      textScaler: TextScaler.linear(1),
      style: TextStyle(
        color: color,
        fontSize: size,
        fontWeight: weight,
      ),
    ),
  );
}

Widget textfield(
    Color c1,
    Color c2,
    Color c3,
    double int,
    Offset offset,
    BorderRadius br,
    IconData icon,
    EdgeInsets ei,
    String text,
    String retunnn,
    TextEditingController tec,
    TextInputType inputtype) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 13.0),
    decoration: BoxDecoration(borderRadius: br, color: c1, boxShadow: [
      BoxShadow(color: c2, blurRadius: int, offset: offset, spreadRadius: 3)
    ]),
    child: TextFormField(
      controller: tec,
      style: TextStyle(color: c3),
      cursorColor: c3,
      keyboardType: inputtype,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return retunnn;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: c3),
        contentPadding: ei,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
            borderRadius: br,
            borderSide: BorderSide.merge(
              BorderSide(color: Colors.red),
              BorderSide.none,
            )),
      ),
    ),
  );
}

//reset password page
Widget textfieldd(
    Color c1,
    Color c2,
    Color c3,
    double int,
    Offset offset,
    BorderRadius br,
    IconData icon,
    EdgeInsets ei,
    String text,
    String retunnn,
    // TextEditingController tec,
    TextInputType inputtype) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 40.0, vertical: 13.0),
    decoration: BoxDecoration(borderRadius: br, color: c1, boxShadow: [
      BoxShadow(color: c2, blurRadius: int, offset: offset, spreadRadius: 3)
    ]),
    child: TextFormField(
      // controller: tec,
      style: TextStyle(color: c3),
      cursorColor: c3,
      keyboardType: inputtype,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return retunnn;
        }
        return null;
      },
      decoration: InputDecoration(
        labelText: text,
        labelStyle: TextStyle(color: c3),
        contentPadding: ei,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
            borderRadius: br,
            borderSide: BorderSide.merge(
              BorderSide(color: Colors.red),
              BorderSide.none,
            )),
      ),
    ),
  );
}

Widget addresstextfield(
    Color c1,
    Color c2,
    Color c3,
    double int,
    Offset offset,
    BorderRadius br,
    EdgeInsets ei,
    String text1,
    String text2,
    String retunnn,
    TextEditingController tec,
    TextInputType inputtype) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Container(
        child: text(text1, Colors.black, 16, FontWeight.bold),
      ),
      Container(
        margin: EdgeInsets.symmetric(horizontal: 10.0, vertical: 13.0),
        decoration: BoxDecoration(borderRadius: br, color: c1, boxShadow: [
          BoxShadow(color: c2, blurRadius: int, offset: offset, spreadRadius: 3)
        ]),
        child: TextFormField(
          controller: tec,
          style: TextStyle(color: c3),
          cursorColor: c3,
          keyboardType: inputtype,
          validator: (value) {
            if (value == null || value.isEmpty) {
              return retunnn;
            }
            return null;
          },
          decoration: InputDecoration(
            hintText: text2,
            hintStyle: TextStyle(color: c3),
            contentPadding: ei,
            border: OutlineInputBorder(
                borderRadius: br,
                borderSide: BorderSide.merge(
                  BorderSide(color: Colors.red),
                  BorderSide.none,
                )),
          ),
        ),
      ),
    ],
  );
}

Widget textfiellld(
    Color c2,
    Color c3,
    BorderRadius br,
    IconData icon,
    EdgeInsets ei,
    String text,
    // String retunn,
    TextEditingController tec,
    TextInputType inputtype) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
    decoration: BoxDecoration(
      borderRadius: br,
    ),
    child: TextFormField(
      controller: tec,
      style: TextStyle(color: c3),
      cursorColor: c3,
      keyboardType: inputtype,
      // focusNode: FocusNode,

      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        labelText: text,
        labelStyle: TextStyle(color: c3),
        contentPadding: ei,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: br,
        ),
      ),
    ),
  );
}

Widget textfielld(
    Color c1,
    Color c2,
    Color c3,
    double int,
    Offset offset,
    BorderRadius br,
    IconData icon,
    EdgeInsets ei,
    String text,
    String retunn,
    // TextEditingController tec,
    TextInputType inputtype) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: 30.0, vertical: 10.0),
    decoration: BoxDecoration(borderRadius: br, color: c1, boxShadow: [
      BoxShadow(color: c2, blurRadius: int, offset: offset, spreadRadius: 3)
    ]),
    child: TextFormField(
      // controller: tec,
      style: TextStyle(color: c3),
      cursorColor: c3,
      keyboardType: inputtype,
      // focusNode: FocusNode,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return retunn;
        }
        return null;
      },
      decoration: InputDecoration(
        focusedBorder: InputBorder.none,
        labelText: text,
        labelStyle: TextStyle(color: c3),
        contentPadding: ei,
        suffixIcon: Icon(icon),
        border: OutlineInputBorder(
            borderRadius: br,
            borderSide: BorderSide.merge(
              BorderSide(color: Colors.red),
              BorderSide.none,
            )),
      ),
    ),
  );
}

Widget textfielld2(
    Color c1,
    Color c2,
    Color c3,
    BorderRadius br,
    EdgeInsets ei,
    double hor,
    double ver,
    String text,
    String retun,
    TextEditingController txt,
    TextInputType inputtype) {
  return Container(
    margin: EdgeInsets.symmetric(horizontal: hor, vertical: ver),
    decoration: BoxDecoration(
      borderRadius: br,
      color: c1,
    ),
    child: TextFormField(
      style: TextStyle(color: c3),
      controller: txt,
      cursorColor: c3,
      keyboardType: inputtype,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return retun;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: c2),
        contentPadding: ei,
        border:
            OutlineInputBorder(borderRadius: br, borderSide: BorderSide.none),
      ),
    ),
  );
}

Widget datetextfielld2(
    Color c1,
    Color c2,
    Color c3,
    BorderRadius br,
    EdgeInsets ei,
    double hei,
    double wid,
    // double hor,
    // double ver,
    TextEditingController txt,
    String text,
    String retun,
    TextInputType inputtype) {
  return Container(
    height: hei,
    width: wid,
    // margin: EdgeInsets.symmetric(horizontal: hor, vertical: ver),
    decoration: BoxDecoration(
      borderRadius: br,
      color: c1,
    ),
    child: TextFormField(
      style: TextStyle(color: c3),
      cursorColor: c3,
      controller: txt,
      keyboardType: inputtype,
      validator: (value) {
        if (value == null || value.isEmpty) {
          return retun;
        }
        return null;
      },
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(color: c2),
        contentPadding: ei,
        border:
            OutlineInputBorder(borderRadius: br, borderSide: BorderSide.none),
      ),
    ),
  );
}

Widget textfield1(Color c1, Color c2, Color c3, double int, Offset offset,
    BorderRadius br, EdgeInsets ei, String text) {
  return Container(
    decoration: BoxDecoration(borderRadius: br, color: c1, boxShadow: [
      BoxShadow(color: c2, blurRadius: int, offset: offset, spreadRadius: 3)
    ]),
    child: TextField(
      style: TextStyle(color: c3),
      cursorColor: c3,
      decoration: InputDecoration(
        hintText: text,
        hintStyle: TextStyle(
          color: c3,
        ),
        contentPadding: ei,
        border: OutlineInputBorder(
            borderRadius: br,
            borderSide: BorderSide.merge(
              BorderSide(color: Colors.red),
              BorderSide.none,
            )),
      ),
    ),
  );
}

Widget textfield2(Color c1, Color c2, Color c3, double int, Offset offset,
    BorderRadius br, EdgeInsets ei, String text) {
  return Container(
    decoration: BoxDecoration(borderRadius: br, color: c1, boxShadow: [
      BoxShadow(color: c2, blurRadius: int, offset: offset, spreadRadius: 2)
    ]),
    child: TextField(
      style: TextStyle(color: c3),
      cursorColor: c3,
      decoration: InputDecoration(
        prefixIcon: Icon(Icons.search),
        // focusedBorder: InputBorder.none,
        labelText: text,
        labelStyle: TextStyle(
          color: c3,
        ),
        contentPadding: ei,
        border: OutlineInputBorder(
            borderRadius: br,
            borderSide: BorderSide.merge(
              BorderSide(color: Colors.red),
              BorderSide.none,
            )),
      ),
    ),
  );
}

Widget catego(String img, String t1, String t2, BoxFit bf, BoxShape bs,
    BorderRadius br, Widget page, BuildContext contxt) {
  final siize = MediaQuery.of(contxt).size;
  return Container(
    // color: Colors.red,
    height: 130,
    width: siize.width * 1,
    child: Stack(
      children: [
        Positioned(
          left: 55,
          child: Container(
            height: 100,
            width: siize.width * 0.76,
            decoration: BoxDecoration(
              color: Color(0xfffdfdfd),
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(70),
                bottomLeft: Radius.circular(70),
                topRight: Radius.circular(26),
                bottomRight: Radius.circular(26),
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  spreadRadius: 0,
                  offset: Offset(0, 4),
                  blurRadius: 10,
                ),
              ],
            ),
          ),
        ),
        Positioned(
          left: 17,
          top: 12.5,
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              borderRadius: br,
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 2),
                  blurRadius: 12,
                ),
              ],
              shape: bs,
              image: DecorationImage(
                fit: bf,
                image: NetworkImage(
                  img,
                ),
              ),
            ),
          ),
        ),
        Positioned(
          left: 150,
          bottom: 52,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(
                t1,
                Colors.black87,
                25,
                FontWeight.bold,
              ),
              text(
                t2,
                Colors.grey,
                16,
                FontWeight.bold,
              ),
            ],
          ),
        ),
        Positioned(
          left: siize.width * 0.85,
          top: 29,
          child: Container(
            height: 40,
            width: 40,
            decoration: BoxDecoration(
              color: Color(0xfffdfdfd),
              borderRadius: BorderRadius.all(Radius.circular(30)),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  offset: Offset(0, 5),
                  blurRadius: 12,
                ),
              ],
            ),
            child: Builder(
              builder: (context) {
                return IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xfffc6111),
                  ),
                );
              },
            ),
          ),
        ),
      ],
    ),
  );
}

Widget catego1(String img, String t1, String t2, BoxFit bf, BoxShape bs,
    Widget page1, BuildContext con) {
  final siize = MediaQuery.of(con).size;
  return Container(
    // color: Colors.yellow,
    height: 130,
    width: siize.width * 1,
    child: Stack(
      children: [
        Positioned(
            left: 55,
            child: Container(
              height: 100,
              width: siize.width * 0.76,
              decoration: BoxDecoration(
                  color: Color(0xfffdfdfd),
                  borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(70),
                      bottomLeft: Radius.circular(70),
                      topRight: Radius.circular(26),
                      bottomRight: Radius.circular(26)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        spreadRadius: 0,
                        offset: Offset(0, 4),
                        blurRadius: 10)
                  ]),
            )),
        Positioned(
          left: 17,
          top: 12.5,
          child: Container(
            clipBehavior: Clip.hardEdge,
            height: 80,
            width: 80,
            decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 2), blurRadius: 12)
                ],
                shape: bs,
                image: DecorationImage(
                    fit: bf,
                    image: NetworkImage(
                      img,
                    ))),
          ),
        ),
        Positioned(
          left: 150,
          bottom: 52,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(
                t1,
                Colors.black87,
                25,
                FontWeight.bold,
              ),
              text(
                t2,
                Colors.grey,
                16,
                FontWeight.bold,
              ),
            ],
          ),
        ),
        Positioned(
            left: siize.width * 0.85,
            top: 29,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                  color: Color(0xfffdfdfd),
                  borderRadius: BorderRadius.all(Radius.circular(30)),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey,
                        offset: Offset(0, 5),
                        blurRadius: 12)
                  ]),
              child: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page1),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xfffc6111),
                  ),
                );
              }),
            ))
      ],
    ),
  );
}

Widget more_caterage(IconData icn, String t1, Widget page1) {
  return Container(
    // color: Colors.yellow,
    height: 130,
    width: 400,
    child: Stack(
      children: [
        Positioned(
            left: 38,
            child: Container(
              height: 100,
              width: 320,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 10), blurRadius: 12)
                ],
                color: Color(0xfffdfdfd),
                borderRadius: BorderRadius.circular(20),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: CircleAvatar(
                      backgroundColor: Color(0xfffc6111),
                      radius: 30,
                      child: IconButton(
                        onPressed: () {},
                        icon: Icon(
                          icn,
                          size: 30,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 18.0),
                    child: text(
                      t1,
                      Colors.black87,
                      20,
                      FontWeight.bold,
                    ),
                  ),
                ],
              ),
            )),
        Positioned(
            left: 335,
            top: 29,
            child: Container(
              height: 40,
              width: 40,
              decoration: BoxDecoration(
                boxShadow: [
                  BoxShadow(
                      color: Colors.grey, offset: Offset(0, 10), blurRadius: 12)
                ],
                color: Color(0xfffdfdfd),
                borderRadius: BorderRadius.all(Radius.circular(30)),
              ),
              child: Builder(builder: (context) {
                return IconButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => page1),
                    );
                  },
                  icon: Icon(
                    Icons.arrow_forward_ios,
                    color: Color(0xfffc6111),
                  ),
                );
              }),
            ))
      ],
    ),
  );
}

Widget banner(String img, String t1, String t2, String t3, Widget page,
    BuildContext context) {
  final scrr = MediaQuery.of(context).size;
  return Stack(
    children: [
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Builder(builder: (context) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => page));
            },
            child: Container(
              clipBehavior: Clip.hardEdge,
              // padding: EdgeInsets.all(30),
              height: 220,
              width: scrr.width * 0.95,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Color(0xfffdfdfd),
                  shape: BoxShape.rectangle,
                  image: DecorationImage(
                      fit: BoxFit.cover, image: NetworkImage(scale: 1, img))),
            ),
          );
        }),
      ),
      Positioned(
        left: 30,
        bottom: 30,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(t1, Colors.white, 13, FontWeight.bold),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.deepOrange,
                ),
                SizedBox(
                  width: 3,
                ),
                text(t2, Colors.deepOrange, 10, FontWeight.normal),
                SizedBox(
                  width: 2,
                ),
                text(t3, Colors.white, 10, FontWeight.bold),
              ],
            )
          ],
        ),
      )
    ],
  );
}

Widget offerbanner(String img, String t1, String t2, String t3, String t4,
    String t5, String t6, Widget page, BuildContext context) {
  final scrrr = MediaQuery.of(context).size;
  return Column(
    children: [
      Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Builder(builder: (context) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(
                      context, MaterialPageRoute(builder: (context) => page));
                },
                child: Container(
                  clipBehavior: Clip.hardEdge,
                  // padding: EdgeInsets.all(30),
                  height: 230,
                  width: scrrr.width * 0.95,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Color(0xfffdfdfd),
                      shape: BoxShape.rectangle,
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(scale: 1, img))),
                ),
              );
            }),
          ),
          Positioned(
            left: 8.5,
            bottom: 8.5,
            child: Container(
              height: 80,
              width: 130,
              decoration: BoxDecoration(
                  color: Colors.orangeAccent.withOpacity(0.8),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20),
                      topRight: Radius.circular(30))),
              child: Center(
                child: Container(
                  color: Colors.transparent,
                  child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        text(t1, Colors.white, 50, FontWeight.bold),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            text(t2, Colors.white, 30, FontWeight.bold),
                            text(t3, Colors.white, 20, FontWeight.bold)
                          ],
                        )
                      ]),
                ),
              ),
            ),
          ),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(t4, Colors.black54, 13, FontWeight.bold),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.deepOrange,
                ),
                SizedBox(
                  width: 3,
                ),
                text(t5, Colors.deepOrange, 10, FontWeight.normal),
                SizedBox(
                  width: 2,
                ),
                text(t6, Colors.black54, 10, FontWeight.bold),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget textfieldprofile(String t1, String t2, BuildContext context) {
  final sccr = MediaQuery.of(context).size;
  return Container(
    height: 65,
    width: sccr.width * 0.85,
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(50)),
    child: Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          text(t1, Colors.grey, 10, FontWeight.normal),
          text(t2, Colors.black, 16, FontWeight.bold),
        ],
      ),
    ),
  );
}

Widget textfieldpprofile(String t1, String t2, BuildContext context) {
  final sccr = MediaQuery.of(context).size;
  return Container(
    height: 65,
    width: sccr.width * 0.85,
    decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.2),
        borderRadius: BorderRadius.circular(50)),
    child: Padding(
      padding: const EdgeInsets.only(left: 30.0, top: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // text(t1, Colors.grey, 10, FontWeight.normal),
          Text(
            t1,
            style: TextStyle(
              color: Colors.grey,
              fontSize: 10,
            ),
          ),
          Text(
            t2,
            style: TextStyle(
                color: Colors.black, fontSize: 16, fontWeight: FontWeight.bold),
          )
          // text(t2, Colors.black, 16, FontWeight.bold),
        ],
      ),
    ),
  );
}

// Home_page Functions
Widget home_banner(String img, String t4, String t5, String t6, Widget page,
    BuildContext context) {
  final scrrr = MediaQuery.of(context).size;
  return Column(
    children: [
      Stack(
        children: [
          Builder(builder: (context) {
            return GestureDetector(
              onTap: () {
                Navigator.push(
                    context, MaterialPageRoute(builder: (context) => page));
              },
              child: Container(
                clipBehavior: Clip.hardEdge,
                // padding: EdgeInsets.all(30),
                height: 250,
                width: scrrr.width * 1,
                decoration: BoxDecoration(
                    // borderRadius: BorderRadius.circular(15),
                    color: Color(0xfffdfdfd),
                    shape: BoxShape.rectangle,
                    image: DecorationImage(
                        fit: BoxFit.cover, image: NetworkImage(scale: 1, img))),
              ),
            );
          }),
        ],
      ),
      Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(t4, Colors.black54, 20, FontWeight.bold),
            Row(
              children: [
                Icon(
                  Icons.star,
                  size: 15,
                  color: Colors.deepOrange,
                ),
                SizedBox(
                  width: 3,
                ),
                text(t5, Colors.deepOrange, 10, FontWeight.normal),
                SizedBox(
                  width: 2,
                ),
                text(t6, Colors.black54, 10, FontWeight.bold),
              ],
            ),
          ],
        ),
      ),
    ],
  );
}

Widget a(String img, BoxShape bs, BoxFit bf, BorderRadius br, String t1,
    double num) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: 80,
          width: 80,
          decoration: BoxDecoration(
              borderRadius: br,
              shape: bs,
              image: DecorationImage(
                  fit: bf,
                  image: NetworkImage(
                    img,
                  ))),
        ),
        Padding(
          padding: EdgeInsets.only(top: 4.0),
          child: text(t1, Colors.black, num, FontWeight.bold),
        ),
      ],
    ),
  );
}

Widget b(String img, BoxShape bs, BoxFit bf, BorderRadius br, String t4,
    String t5, String t6, double num) {
  return GestureDetector(
    onTap: () {},
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          clipBehavior: Clip.hardEdge,
          height: 150,
          width: 250,
          decoration: BoxDecoration(
              borderRadius: br,
              shape: bs,
              image: DecorationImage(
                  fit: bf,
                  image: NetworkImage(
                    img,
                  ))),
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              text(t4, Colors.black54, 13, FontWeight.bold),
              Row(
                children: [
                  text(t6, Colors.black54, 10, FontWeight.bold),
                  SizedBox(
                    width: 2,
                  ),
                  Icon(
                    Icons.star,
                    size: 15,
                    color: Colors.deepOrange,
                  ),
                  SizedBox(
                    width: 3,
                  ),
                  text(t5, Colors.deepOrange, 10, FontWeight.normal),
                ],
              ),
            ],
          ),
        ),
      ],
    ),
  );
}

Widget recent(String img, String t1, String t2, String t3, String t4) {
  return Row(
    children: [
      Container(
        clipBehavior: Clip.hardEdge,
        height: 100,
        width: 100,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            shape: BoxShape.rectangle,
            image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(
                  img,
                ))),
      ),
      Padding(
        padding: EdgeInsets.only(left: 20.0, bottom: 30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            text(t1, Colors.black, 17, FontWeight.bold),
            SizedBox(
              height: 2,
            ),
            text(t2, Colors.grey, 14, FontWeight.bold),
            SizedBox(
              height: 2,
            ),
            Row(
              children: [
                Icon(
                  Icons.star,
                  color: Color(0xfffc6111),
                  size: 14,
                ),
                text(t3, Color(0xfffc6111), 14, FontWeight.normal),
                Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: text(t4, Colors.grey, 14, FontWeight.bold),
                )
              ],
            )
          ],
        ),
      )
    ],
  );
}
