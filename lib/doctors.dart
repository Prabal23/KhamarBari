import 'package:flutter/material.dart';
import 'package:login_page/main.dart';

class DoctorsListPage extends StatefulWidget {
  final page;
  DoctorsListPage(this.page);

  @override
  _DoctorsListPageState createState() => _DoctorsListPageState();
}

class _DoctorsListPageState extends State<DoctorsListPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
                    Text(
                        widget.page == 1
                            ? "Consultancy"
                            : widget.page == 2
                                ? "Visiting"
                                : widget.page == 3
                                    ? "Dairy"
                                    : widget.page == 4
                                        ? "Pet Animal"
                                        : "Poultry",
                        style: TextStyle(fontSize: 17, color: Colors.black54)),
                    Container(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
                      child: Text("Doctors",
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
      body: Container(
        child: Column(
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
                      Row(
                        children: <Widget>[
                          Text(
                            "10 ",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[700],
                                fontSize: 12),
                          ),
                          Text(
                            widget.page == 1
                                ? "Consultancy"
                                : widget.page == 2
                                    ? "Visiting"
                                    : widget.page == 3
                                        ? "Dairy"
                                        : widget.page == 4
                                            ? "Pet Animal"
                                            : "Poultry",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[700],
                                fontSize: 12),
                          ),
                          Text(
                            " Doctors",
                            style: TextStyle(
                                fontWeight: FontWeight.w400,
                                color: Colors.grey[700],
                                fontSize: 12),
                          ),
                        ],
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
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 0, right: 20),
                                    child: Text(
                                      index % 2 == 0
                                          ? "Dr. Rahim Miah"
                                          : "Dr. Md. Karim",
                                      textAlign: TextAlign.start,
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
                                          Icons.phone,
                                          size: 13,
                                          color: Colors.black45,
                                        ),
                                        Container(
                                          margin:
                                              EdgeInsets.only(top: 2, left: 3),
                                          child: Text(
                                            index % 2 == 0
                                                ? "017XXXXXXXX"
                                                : "016XXXXXXXX",
                                            style: TextStyle(
                                                fontWeight: FontWeight.w400,
                                                fontSize: 12,
                                                color: Colors.black45),
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
                            width: 45,
                            padding: EdgeInsets.all(5),
                            decoration: BoxDecoration(
                                color: header.withOpacity(0.8),
                                borderRadius: BorderRadius.circular(5)),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: <Widget>[
                                Text(
                                  "Call",
                                  style: TextStyle(
                                      fontWeight: FontWeight.w500,
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
                separatorBuilder: (BuildContext context, int index) {
                  return Divider(color: Colors.grey[300]);
                },
              )),
            ),
          ],
        ),
      ),
    );
  }
}
