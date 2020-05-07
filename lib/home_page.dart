import 'package:flutter/material.dart';
import 'package:login_page/comment_page.dart';
import 'package:login_page/history_page.dart';
import 'package:login_page/login_page.dart';
import 'package:login_page/notification_page.dart';
import 'package:login_page/profile.dart';
import 'package:login_page/profile_edit.dart';
import 'package:login_page/reg_page.dart';

class HomePage extends StatefulWidget {
  static String tag = 'home-page';
  @override
  _HomePageState createState() => new _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _currentIndex = 0;

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  final List<Widget> _children = [
    new ProfilePage(),
    new HistoryPage(),
    new CommentPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: Color(0xFF1B8E99)),
        automaticallyImplyLeading: false,
        backgroundColor: Colors.white,
        title: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: <Widget>[
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: <Widget>[
                    Hero(
                      tag: 'hero',
                      child: Container(
                        padding: EdgeInsets.all(10.0),
                        child: CircleAvatar(
                          backgroundColor: Colors.transparent,
                          //backgroundImage: ExactAssetImage('assets/logo.png'),
                          minRadius: 15,
                          maxRadius: 15,
                          //radius: 68.0,
                          child: Image.asset('assets/khamarbari.png'),
                        ),
                      ),
                    ),
                    Text("Hello",
                        style: TextStyle(fontSize: 17, color: Colors.black54)),
                    Container(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
                      child: Text("Khamarbari",
                          style: TextStyle(
                              fontSize: 17, color: Color(0xFF1B8E99))),
                    ),
                  ],
                ),
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => NotificationPage()));
                },
                child: Container(
                  margin: EdgeInsets.only(right: 5),
                  padding: EdgeInsets.all(5),
                  child: Stack(
                    children: <Widget>[
                      Container(
                          margin: EdgeInsets.only(top: 5),
                          child: Icon(Icons.notifications)),
                      Container(
                          padding: EdgeInsets.all(2),
                          margin: EdgeInsets.only(left: 14, bottom: 10),
                          decoration: BoxDecoration(
                              color: Colors.redAccent[400],
                              //border: Border.all(color: Color(0xFF1B8E99), width: 0.5),
                              borderRadius: BorderRadius.circular(5)),
                          child: Text("50",
                              style: TextStyle(
                                  fontSize: 10,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold)))
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
      body: _children[_currentIndex],
      //body: body,
      bottomNavigationBar: new Theme(
        data: Theme.of(context).copyWith(
            // sets the background color of the `BottomNavigationBar`
            canvasColor: Colors.white,
            //backgroundColor: Colors.lightBlue,
            // sets the active color of the `BottomNavigationBar` if `Brightness` is light
            primaryColor: Color(0xFF1B8E99),
            //disabledColor: Colors.blue,
            textTheme: Theme.of(context)
                .textTheme
                .copyWith(caption: new TextStyle(color: Colors.grey))),
        child: new BottomNavigationBar(
          onTap: onTabTapped,
          currentIndex:
              _currentIndex, // this will be set when a new tab is tapped
          items: [
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.person_outline,
                size: 19,
              ),
              title: new Text(
                'Profile',
                style: TextStyle(fontSize: 12),
              ),
            ),
            BottomNavigationBarItem(
              icon: new Icon(
                Icons.hourglass_empty,
                size: 19,
              ),
              title: new Text(
                'View History',
                style: TextStyle(fontSize: 12),
              ),
            ),
            BottomNavigationBarItem(
              icon: Icon(
                Icons.chat_bubble_outline,
                size: 19,
              ),
              title: Text(
                'Comment',
                style: TextStyle(fontSize: 12),
              ),
            )
          ],
        ),
      ),
    );
  }
}
