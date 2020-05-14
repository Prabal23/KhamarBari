import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class HistoryPage extends StatefulWidget {
  static String tag = 'front-page';
  @override
  _HistoryPageState createState() => new _HistoryPageState();
}

class _HistoryPageState extends State<HistoryPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: DefaultTabController(
        length: 2,
        child: SafeArea(
          child: new Column(
            children: <Widget>[
              new Container(
                color: Colors.white,
                child: new Material(
                  color: Colors.white,
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    padding: EdgeInsets.all(0),
                    margin: EdgeInsets.only(left: 20, right: 20, top: 20),
                    decoration: BoxDecoration(
                        color: Colors.grey[200],
                        boxShadow: [
                          BoxShadow(
                            blurRadius: 3.0,
                            color: Colors.black.withOpacity(.2),
                            //offset: Offset(6.0, 7.0),
                          ),
                        ],
                        //border: Border.all(color: sub_white, width: 0.3),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: new TabBar(
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                      tabs: [
                        new Tab(
                          text: "Consultancy History",
                        ),
                        new Tab(
                          text: "Account History",
                        ),
                      ],
                      indicatorColor: Colors.transparent,
                      unselectedLabelColor: Colors.black45,
                      unselectedLabelStyle:
                          TextStyle(fontWeight: FontWeight.w300, fontSize: 12),
                      labelColor: Color(0xFF1B8E99),
                      //labelStyle: TextStyle(fontSize: 15),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: new TabBarView(
                  children: [
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            //padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(
                                top: 20, bottom: 5, left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "10 Consultancy / Inspections",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[700],
                                          fontSize: 12),
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
                          Expanded(
                            child: Container(
                                child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  ///contentPadding: EdgeInsets.all(0),
                                  title: Container(
                                    //color: Colors.grey.withOpacity(0.1),
                                    //padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(left: 3, right: 5),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Container(
                                            padding: EdgeInsets.all(0.0),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: ExactAssetImage(
                                                  'assets/person.png'),
                                              minRadius: 15,
                                              maxRadius: 15,
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
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 0, right: 20),
                                                  child: Text(
                                                    index % 2 == 0
                                                        ? "Rahim Miah"
                                                        : "Md. Karim",
                                                    textAlign: TextAlign.start,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 3),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.calendar_today,
                                                        size: 13,
                                                        color: Colors.black45,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 2, left: 3),
                                                        child: Text(
                                                          index % 2 == 0
                                                              ? "23/11/19"
                                                              : "25/11/19",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black45),
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
                                          width: 75,
                                          padding: EdgeInsets.all(5),
                                          decoration: BoxDecoration(
                                              color: index % 2 != 0
                                                  ? Color(0xFF6E9CA4)
                                                      .withOpacity(0.8)
                                                  : Color(0xFF6498CE)
                                                      .withOpacity(0.8),
                                              borderRadius:
                                                  BorderRadius.circular(5)),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Text(
                                                index % 2 == 0
                                                    ? "Consultancy"
                                                    : "Inspection",
                                                style: TextStyle(
                                                    fontWeight: FontWeight.w400,
                                                    fontSize: 11,
                                                    color: Colors.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(color: Colors.grey[300]);
                              },
                            )),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      child: Column(
                        children: <Widget>[
                          Container(
                            //padding: EdgeInsets.all(5),
                            margin: EdgeInsets.only(
                                top: 20, bottom: 5, left: 20, right: 20),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: <Widget>[
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    Text(
                                      "10 Visiting History",
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          color: Colors.grey[700],
                                          fontSize: 12),
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
                          Expanded(
                            child: Container(
                                child: ListView.separated(
                              physics: BouncingScrollPhysics(),
                              itemCount: 10,
                              itemBuilder: (context, index) {
                                return ListTile(
                                  ///contentPadding: EdgeInsets.all(0),
                                  title: Container(
                                    //color: Colors.grey.withOpacity(0.1),
                                    //padding: EdgeInsets.all(5),
                                    margin: EdgeInsets.only(left: 3, right: 0),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: <Widget>[
                                        Container(
                                          margin: EdgeInsets.only(top: 5),
                                          child: Container(
                                            padding: EdgeInsets.all(0.0),
                                            child: CircleAvatar(
                                              backgroundColor:
                                                  Colors.transparent,
                                              backgroundImage: ExactAssetImage(
                                                  index % 2 == 0
                                                      ? 'assets/cow.png'
                                                      : 'assets/rooster.png'),
                                              minRadius: 12,
                                              maxRadius: 12,
                                              //radius: 68.0,
                                              // child: Image.asset(
                                              //     'assets/person.png',
                                              //     fit: BoxFit.cover,),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          child: Container(
                                            margin: EdgeInsets.only(left: 15),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: <Widget>[
                                                Container(
                                                  margin: EdgeInsets.only(
                                                      left: 0, right: 20),
                                                  child: Text(
                                                    index % 2 == 0
                                                        ? "Dairy"
                                                        : "Poultry",
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 15,
                                                        color: Colors.black),
                                                  ),
                                                ),
                                                Container(
                                                  margin:
                                                      EdgeInsets.only(top: 3),
                                                  alignment:
                                                      Alignment.centerLeft,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    children: <Widget>[
                                                      Icon(
                                                        Icons.calendar_today,
                                                        size: 13,
                                                        color: Colors.black45,
                                                      ),
                                                      Container(
                                                        margin: EdgeInsets.only(
                                                            top: 2, left: 3),
                                                        child: Text(
                                                          index % 2 == 0
                                                              ? "Last visit : 23/11/19"
                                                              : "Last visit : 25/11/19",
                                                          style: TextStyle(
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400,
                                                              fontSize: 12,
                                                              color: Colors
                                                                  .black45),
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
                                          //width: 85,
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: <Widget>[
                                              Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.end,
                                                children: <Widget>[
                                                  Text(
                                                    "Total visit",
                                                    style: TextStyle(
                                                        fontWeight:
                                                            FontWeight.w400,
                                                        fontSize: 11,
                                                        color: Colors.black54),
                                                  ),
                                                  Container(
                                                    margin:
                                                        EdgeInsets.only(top: 3),
                                                    padding: EdgeInsets.all(5),
                                                    decoration: BoxDecoration(
                                                        color: index % 2 != 0
                                                            ? Color(0xFF6E9CA4)
                                                                .withOpacity(
                                                                    0.8)
                                                            : Color(0xFF6498CE)
                                                                .withOpacity(
                                                                    0.8),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5)),
                                                    child: Text(
                                                      index % 2 == 0
                                                          ? "7"
                                                          : "11",
                                                      style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.w400,
                                                          fontSize: 11,
                                                          color: Colors.white),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                              separatorBuilder:
                                  (BuildContext context, int index) {
                                return Divider(color: Colors.grey[300]);
                              },
                            )),
                          ),
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
    );
  }
}
