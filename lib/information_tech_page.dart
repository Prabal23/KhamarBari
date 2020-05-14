import 'package:flutter/material.dart';
import 'package:login_page/Weblist_page.dart';
import 'package:login_page/main.dart';

class InformationTechPage extends StatefulWidget {
  @override
  _InformationPageState createState() => _InformationPageState();
}

class _InformationPageState extends State<InformationTechPage> {
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
                    Text("Information",
                        style: TextStyle(fontSize: 17, color: Colors.black54)),
                    Container(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
                      child: Text("Box",
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
      body: DefaultTabController(
        length: 3,
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
                    margin: EdgeInsets.only(left: 0, right: 0, top: 5),
                    decoration: BoxDecoration(
                        // color: Colors.grey[200],
                        // boxShadow: [
                        //   BoxShadow(
                        //     blurRadius: 3.0,
                        //     color: Colors.black.withOpacity(.2),
                        //     //offset: Offset(6.0, 7.0),
                        //   ),
                        // ],
                        //border: Border.all(color: sub_white, width: 0.3),
                        borderRadius: BorderRadius.all(Radius.circular(10))),
                    child: new TabBar(
                      labelStyle:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 13),
                      tabs: [
                        new Tab(
                          text: "Sparm Preservation  info",
                        ),
                        new Tab(
                          text: "Medicine info",
                        ),
                        new Tab(
                          text: "Others info",
                        ),
                      ],
                      isScrollable: true,
                      indicatorColor: header,
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
                    WebListPage(),
                    WebListPage(),
                    WebListPage(),
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
