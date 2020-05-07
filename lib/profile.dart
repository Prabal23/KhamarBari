import 'package:carousel_pro/carousel_pro.dart';
import 'package:flutter/material.dart';
import 'package:login_page/login_page.dart';
import 'package:login_page/reg_page.dart';

class Profile extends StatefulWidget {
  static String tag = 'profile-page';
  @override
  _ProfileState createState() => new _ProfileState();
}
class _ProfileState extends State<Profile> {

  @override
  Widget build(BuildContext context) {
    final alucard = Hero(
      tag: 'hero',
      child: Padding(
        padding: EdgeInsets.all(16.0),
        child: CircleAvatar(
          radius: 72.0,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage('assets/prabal.jpg'),
        ),
      ),
    );

    final welcome = Padding(
      padding: EdgeInsets.all(10.0),
      child: Text(
        'Prabal Bhattacharjee',
        style: TextStyle(fontSize: 24.0, color: Colors.black, fontWeight: FontWeight.bold),
      ),
    );

    final lorem = Padding(
      padding: EdgeInsets.all(0.0),
      child: Text(
        'Android Application Developer',
        style: TextStyle(fontSize: 14.0, color: Colors.black38),
      ),
    );

    final body = Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.all(28.0),
      decoration: BoxDecoration(
        gradient: LinearGradient(colors: [
          Colors.white,
          Colors.white,
        ]),
      ),
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            children: <Widget>[
              new SizedBox(
                height: 30.0,
              ),
              //new SizedBox(height:50.0),
              new Container(
                //margin: EdgeInsets.fromLTRB(0.0, -20.0, 0.0, 0.0),
                child: Column(
                  children: <Widget>[
                    new Container(
                      transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                      padding: EdgeInsets.all(3.0),
                      child: CircleAvatar(
                        radius: 72.0,
                        backgroundColor: Colors.transparent,
                        backgroundImage: AssetImage('assets/prabal.jpg'),
                      ),
                      decoration: new BoxDecoration(
                        color: Colors.grey, // border color
                        shape: BoxShape.circle,
                      ),
                    ),
                    Container(
                      transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                      decoration: new BoxDecoration(
                        // color: Colors.white, // border color
                        // shape: BoxShape.rectangle,
                        // borderRadius: BorderRadius.circular(5),
                        // border: new Border.all(color: Colors.black26)
                      ),
                      child: new Column(
                        children: <Widget>[
                          welcome,
                          lorem
                        ],
                      ),
                    ),
                    SizedBox(height: 15,),
                    Container(
                      width: MediaQuery.of(context).size.width,
                      //margin: EdgeInsets.only(right: 20, left: 20),
                      transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                      padding: EdgeInsets.all(5),
                      alignment: Alignment.center,
                      decoration: new BoxDecoration(
                        color: Colors.black12, // border color
                        shape: BoxShape.rectangle,
                        borderRadius: BorderRadius.circular(5),
                        border: new Border.all(color: Colors.black26)
                      ),
                      child: new Column(
                        children: <Widget>[
                          new Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              new Column(
                                children: <Widget>[
                                  new Text(
                                    'Play Store',
                                    style: new TextStyle(color: Colors.black, fontSize: 13)
                                  ),
                                  SizedBox(height: 2),
                                  new Text(
                                    '10+ Apps',
                                    style: new TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)
                                  ),
                                ],
                              ),
                              SizedBox(width: 30),
                              new Column(
                                children: <Widget>[
                                  new Text(
                                    'Extra Apps',
                                    style: new TextStyle(color: Colors.black, fontSize: 13)
                                  ),
                                  SizedBox(height: 2),
                                  new Text(
                                    '10+ Apps',
                                    style: new TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)
                                  ),
                                ],
                              ),
                              SizedBox(width: 30),
                              new Column(
                                children: <Widget>[
                                  new Text(
                                    'Total',
                                    style: new TextStyle(color: Colors.black, fontSize: 13)
                                  ),
                                  SizedBox(height: 2),
                                  new Text(
                                    '20+ Apps',
                                    style: new TextStyle(color: Colors.black, fontSize: 14, fontWeight: FontWeight.bold)
                                  ),
                                ],
                              )
                            ],
                          )
                        ],
                      ),
                    ),
                  ],
                ),
                
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );

    return Scaffold(
      body: body,
    );
  }
}