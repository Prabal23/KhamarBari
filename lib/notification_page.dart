import 'package:flutter/material.dart';

class NotificationPage extends StatefulWidget {
  @override
  _NotificationPageState createState() => _NotificationPageState();
}

class _NotificationPageState extends State<NotificationPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF1B8E99)),
        //automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Text("Farmer's",
                        style: TextStyle(fontSize: 17, color: Colors.black54)),
                    Container(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
                      child: Text("Call request",
                          style: TextStyle(
                              fontSize: 17, color: Color(0xFF1B8E99))),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      body: Column(
        children: <Widget>[
          Container(
            //padding: EdgeInsets.all(5),
            margin: EdgeInsets.only(top: 20, bottom: 5, left: 20, right: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: <Widget>[
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    Text(
                      "10 Pending requests",
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
              //height: 500,
              child: ListView.separated(
                itemCount: 10,
                itemBuilder: (context, index) {
                  return ListTile(
                    ///contentPadding: EdgeInsets.all(0),
                    title: Container(
                      //color: Colors.grey.withOpacity(0.1),
                      //padding: EdgeInsets.all(5),
                      margin: EdgeInsets.only(left: 3, right: 5),
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
                                minRadius: 21,
                                maxRadius: 21,
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
                                    margin: EdgeInsets.only(left: 0, right: 20),
                                    child: Text(
                                      index % 2 == 0
                                          ? "Rahim Miah"
                                          : "Md. Karim",
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 15,
                                          color: Colors.black),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.location_on,
                                          size: 13,
                                          color: Colors.black45,
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 2, left: 3),
                                          child: Text(
                                            index % 2 == 0
                                                ? "Sylhet Sadar, Sylhet"
                                                : "Sunamgonj, Sylhet",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Colors.black45),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 3),
                                    alignment: Alignment.centerLeft,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: <Widget>[
                                        Icon(
                                          Icons.business,
                                          size: 13,
                                          color: Colors.black45,
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 2, left: 3),
                                          child: Text(
                                            index % 2 == 0
                                                ? "Dairy | 123XXX"
                                                : "Poultry | 567XXX",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Colors.black45),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    width: 45,
                                    margin: EdgeInsets.only(top: 5),
                                    padding: EdgeInsets.only(
                                        top: 3, bottom: 3, right: 4, left: 4),
                                    decoration: BoxDecoration(
                                        color: index % 2 != 0
                                            ? Color(0xFF6E9CA4).withOpacity(0.8)
                                            : Color(0xFF6498CE)
                                                .withOpacity(0.8),
                                        borderRadius: BorderRadius.circular(5)),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: <Widget>[
                                        Text(
                                          index % 2 == 0
                                              ? "69%"
                                              : "88%",
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
                          ),
                          Row(
                            children: <Widget>[
                              Container(
                                padding: EdgeInsets.all(5),
                                margin: EdgeInsets.only(right: 15),
                                child: Container(
                                  //width: 75,
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.green.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Icon(
                                    Icons.done,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                              Container(
                                padding: EdgeInsets.all(5),
                                child: Container(
                                  //width: 75,
                                  padding: EdgeInsets.all(3),
                                  decoration: BoxDecoration(
                                      color: Colors.red.withOpacity(0.7),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Icon(
                                    Icons.close,
                                    color: Colors.white,
                                    size: 14,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.grey[300]);
                },
              ),
            ),
          ),
        ],
      ),
    );
  }
}
