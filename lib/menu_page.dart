import 'package:flutter/material.dart';
import 'package:login_page/comment_farmer_page.dart';
import 'package:login_page/doctors.dart';
import 'package:login_page/main.dart';

class MenuPage extends StatefulWidget {
  @override
  _MenuPageState createState() => _MenuPageState();
}

class _MenuPageState extends State<MenuPage> {
  bool isBalance = false;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Column(
        children: <Widget>[
          Container(
            color: Colors.white,
            child: Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    border: Border.all(width: 0.4, color: Colors.grey),
                    color: Colors.white),
                padding: EdgeInsets.all(15),
                margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Container(
                      margin: EdgeInsets.only(top: 5),
                      child: Container(
                        padding: EdgeInsets.all(0.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          backgroundImage:
                              ExactAssetImage('assets/person.png'),
                          minRadius: 20,
                          maxRadius: 20,
                          //radius: 68.0,
                          // child: Image.asset(
                          //     'assets/person.png',
                          //     fit: BoxFit.cover,),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(left: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(left: 0, right: 0),
                              child: Text(
                                "Md. Karimullah",
                                textAlign: TextAlign.start,
                                style: TextStyle(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 15,
                                    color: Colors.black),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(right: 0, top: 3),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 0),
                                    child: Row(
                                      children: <Widget>[
                                        Text(
                                            section == 1
                                                ? "Farmer"
                                                : section == 2
                                                    ? "Doctor/Consultant"
                                                    : "A/I Technician",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12.0,
                                                fontWeight:
                                                    FontWeight.normal)),
                                        Container(
                                            height: 20,
                                            width: 20,
                                            margin: EdgeInsets.only(
                                              left: 5,
                                            ),
                                            child: Image.asset(
                                              section == 1
                                                  ? 'assets/man.png'
                                                  : section == 2
                                                      ? 'assets/doctor.png'
                                                      : 'assets/transportation.png',
                                              fit: BoxFit.cover,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      child: Row(
                        children: <Widget>[
                          isBalance == false
                              ? Container()
                              : Text(
                                  "Balance : ",
                                  style: TextStyle(
                                      color: Colors.black54,
                                      fontWeight: FontWeight.normal,
                                      fontSize: 12),
                                ),
                          isBalance == false
                              ? Container()
                              : SizedBox(width: 5),
                          isBalance == false
                              ? Container()
                              : Container(
                                  height: 12,
                                  child: Image.asset('assets/taka.png')),
                          SizedBox(width: 3),
                          isBalance == false
                              ? Container()
                              : Text(
                                  "1085.00",
                                  style: TextStyle(
                                      color: header,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 12),
                                ),
                          isBalance == false
                              ? Container()
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isBalance = false;
                                    });
                                  },
                                  child: Container(
                                    child: Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        Icons.close,
                                        color: Colors.grey,
                                        size: 20,
                                      ),
                                    ),
                                  ),
                                ),
                          isBalance == true
                              ? Container()
                              : GestureDetector(
                                  onTap: () {
                                    setState(() {
                                      isBalance = true;
                                    });
                                  },
                                  child: Container(
                                      padding: EdgeInsets.all(5),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          border: Border.all(
                                              width: 0.4, color: Colors.grey),
                                          color: Colors.white),
                                      child: Row(
                                        children: <Widget>[
                                          Container(
                                              height: 12,
                                              child: Image.asset(
                                                  'assets/taka.png')),
                                          SizedBox(width: 5),
                                          Text(
                                            "Check Balance",
                                            style: TextStyle(
                                                color: header,
                                                fontSize: 11,
                                                fontWeight: FontWeight.bold),
                                          ),
                                        ],
                                      )),
                                )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                //padding: EdgeInsets.all(5),
                margin:
                    EdgeInsets.only(top: 25, bottom: 5, left: 20, right: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          "Select from menu",
                          style: TextStyle(
                              fontWeight: FontWeight.w400,
                              color: Colors.black54,
                              fontSize: 15),
                        ),
                        Container(
                          width: 100,
                          child: Divider(
                            color: Color(0xFF1B8E99),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(height: 5.0),
              Container(
                child: Column(
                  children: <Widget>[
                    // Container(
                    //   margin: EdgeInsets.only(left: 20, right: 20),
                    //   child: Row(
                    //     children: <Widget>[
                    //       Expanded(
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         DoctorsListPage(1)));
                    //           },
                    //           child: Container(
                    //               height: 120,
                    //               padding: EdgeInsets.all(5),
                    //               margin: EdgeInsets.only(right: 5),
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(5),
                    //                   border: Border.all(
                    //                       width: 0.4, color: Colors.grey),
                    //                   color: Colors.white),
                    //               child: Column(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.center,
                    //                 children: <Widget>[
                    //                   Container(
                    //                       height: 40,
                    //                       child: Image.asset(
                    //                           'assets/doctor.png')),
                    //                   SizedBox(height: 15),
                    //                   Text(
                    //                     "Doctors for Consultancy",
                    //                     style: TextStyle(
                    //                         color: Colors.black45,
                    //                         fontSize: 13,
                    //                         fontWeight: FontWeight.normal),
                    //                   ),
                    //                 ],
                    //               )),
                    //         ),
                    //       ),
                    //       Expanded(
                    //         child: GestureDetector(
                    //           onTap: () {
                    //             Navigator.push(
                    //                 context,
                    //                 MaterialPageRoute(
                    //                     builder: (context) =>
                    //                         DoctorsListPage(2)));
                    //           },
                    //           child: Container(
                    //               height: 120,
                    //               padding: EdgeInsets.all(5),
                    //               margin: EdgeInsets.only(left: 5),
                    //               decoration: BoxDecoration(
                    //                   borderRadius: BorderRadius.circular(5),
                    //                   border: Border.all(
                    //                       width: 0.4, color: Colors.grey),
                    //                   color: Colors.white),
                    //               child: Column(
                    //                 mainAxisAlignment:
                    //                     MainAxisAlignment.center,
                    //                 children: <Widget>[
                    //                   Container(
                    //                       height: 40,
                    //                       child:
                    //                           Image.asset('assets/d1.png')),
                    //                   SizedBox(height: 15),
                    //                   Text(
                    //                     "Doctors for Visiting",
                    //                     style: TextStyle(
                    //                         color: Colors.black45,
                    //                         fontSize: 13,
                    //                         fontWeight: FontWeight.normal),
                    //                   ),
                    //                 ],
                    //               )),
                    //         ),
                    //       ),
                    //     ],
                    //   ),
                    // ),
                    Container(
                      margin: EdgeInsets.only(left: 20, right: 20, top: 10),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DoctorsListPage(3)));
                              },
                              child: Container(
                                  height: 120,
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 0.4, color: Colors.grey),
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          height: 40,
                                          child:
                                              Image.asset('assets/cow.png')),
                                      SizedBox(height: 15),
                                      Text(
                                        "Dairy Doctor",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DoctorsListPage(4)));
                              },
                              child: Container(
                                  height: 120,
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 0.4, color: Colors.grey),
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          height: 40,
                                          child:
                                              Image.asset('assets/cat.png')),
                                      SizedBox(height: 15),
                                      Text(
                                        "Pet Animal Doctor",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                          left: 20, right: 20, top: 10, bottom: 20),
                      child: Row(
                        children: <Widget>[
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DoctorsListPage(5)));
                              },
                              child: Container(
                                  height: 120,
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 0.4, color: Colors.grey),
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          height: 40,
                                          child: Image.asset(
                                              'assets/rooster.png')),
                                      SizedBox(height: 15),
                                      Text(
                                        "Poultry Doctor",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                          Expanded(
                            child: GestureDetector(
                              onTap: () {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            CommentFarmerPage()));
                              },
                              child: Container(
                                  height: 120,
                                  padding: EdgeInsets.all(5),
                                  margin: EdgeInsets.only(left: 5),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      border: Border.all(
                                          width: 0.4, color: Colors.grey),
                                      color: Colors.white),
                                  child: Column(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center,
                                    children: <Widget>[
                                      Container(
                                          height: 40,
                                          child: Image.asset(
                                              'assets/comment.png')),
                                      SizedBox(height: 15),
                                      Text(
                                        "Comments",
                                        style: TextStyle(
                                            color: Colors.black45,
                                            fontSize: 13,
                                            fontWeight: FontWeight.normal),
                                      ),
                                    ],
                                  )),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              )
            ]),
          ),
        ],
      ),
    );
  }
}
