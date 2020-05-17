import 'package:flutter/material.dart';

class CommentFarmerPage extends StatefulWidget {
  @override
  _CommentFarmerPageState createState() => _CommentFarmerPageState();
}

class _CommentFarmerPageState extends State<CommentFarmerPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  String _radioSatisfied, _radioProvide, _radioavailable;

  void _handleRadioValueChange1(String value) {
    setState(() {
      _radioProvide = value;

      switch (_radioProvide) {
        case '1':
          //Fluttertoast.showToast(msg: 'Male',toastLength: Toast.LENGTH_SHORT);
          break;
        case '2':
          //Fluttertoast.showToast(msg: 'Female',toastLength: Toast.LENGTH_SHORT);
          break;
      }
      debugPrint(_radioProvide);
    });
  }

  void _handleRadioValueChange2(String value) {
    setState(() {
      _radioavailable = value;

      switch (_radioavailable) {
        case '1':
          //Fluttertoast.showToast(msg: 'Male',toastLength: Toast.LENGTH_SHORT);
          break;
        case '2':
          //Fluttertoast.showToast(msg: 'Female',toastLength: Toast.LENGTH_SHORT);
          break;
        case '3':
          //Fluttertoast.showToast(msg: 'Male',toastLength: Toast.LENGTH_SHORT);
          break;
        case '4':
          //Fluttertoast.showToast(msg: 'Female',toastLength: Toast.LENGTH_SHORT);
          break;
        case '5':
          //Fluttertoast.showToast(msg: 'Female',toastLength: Toast.LENGTH_SHORT);
          break;
      }
      debugPrint(_radioavailable);
    });
  }

  void _handleRadioValueChange3(String value) {
    setState(() {
      _radioSatisfied = value;

      switch (_radioSatisfied) {
        case '1':
          //Fluttertoast.showToast(msg: 'Male',toastLength: Toast.LENGTH_SHORT);
          break;
        case '2':
          //Fluttertoast.showToast(msg: 'Female',toastLength: Toast.LENGTH_SHORT);
          break;
      }
      debugPrint(_radioSatisfied);
    });
  }

  Future _submit() async {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      //Navigator.of(context).pushNamed(HomePage.tag);
      _asyncConfirmDialog();
    }
  }

  Future<Null> _asyncConfirmDialog() async {
    return showDialog<Null>(
        context: context,
        barrierDismissible: true,
        builder: (BuildContext context) {
          return new AlertDialog(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.all(Radius.circular(5.0))),
            elevation: 0.0,
            backgroundColor: Colors.transparent,
            content: SingleChildScrollView(
              child: Stack(
                children: <Widget>[
                  Container(
                    color: Colors.transparent,
                  ),
                  Column(
                    children: <Widget>[
                      Container(
                        width: MediaQuery.of(context).size.width,
                        padding: EdgeInsets.all(20),
                        margin: EdgeInsets.only(top: 0),
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(5)),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Container(
                              alignment: Alignment.center,
                              //transform: Matrix4.translationValues(0.0, 0.0, 0.0),
                              padding: EdgeInsets.all(0.0),
                              child: CircleAvatar(
                                radius: 30.0,
                                backgroundColor: Colors.transparent,
                                backgroundImage:
                                    AssetImage('assets/khamarbari.png'),
                              ),
                              decoration: new BoxDecoration(
                                color: Colors.white, // border color
                                shape: BoxShape.circle,
                              ),
                            ),
                            Container(
                                width: MediaQuery.of(context).size.width,
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  "Success!",
                                  textAlign: TextAlign.start,
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14,
                                      fontWeight: FontWeight.w400),
                                )),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              margin: EdgeInsets.only(top: 10),
                              child: Text(
                                'Your comment about doctor has been given successfully!',
                                textAlign: TextAlign.justify,
                                style: TextStyle(
                                    color: Colors.black54, fontSize: 15.0),
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          Navigator.of(context).pop();
                                        });
                                      },
                                      child: Container(
                                          padding: EdgeInsets.all(10),
                                          margin: EdgeInsets.only(
                                              left: 0,
                                              right: 0,
                                              top: 15,
                                              bottom: 0),
                                          decoration: BoxDecoration(
                                              color: Color(0xFF1B8E99),
                                              borderRadius: BorderRadius.all(
                                                  Radius.circular(5))),
                                          child: Text(
                                            "OK",
                                            style: TextStyle(
                                              color: Colors.white,
                                              fontSize: 15,
                                              fontFamily: 'BebasNeue',
                                            ),
                                            textAlign: TextAlign.center,
                                          )),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: _submit,
        // onPressed: () {
        //   Navigator.of(context).pushNamed(HomePage.tag);
        // },
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        color: Color(0xFF1B8E99),
        child: Text('Submit', style: TextStyle(color: Colors.white)),
      ),
    );

    return Scaffold(
      //key: scaffoldKey,
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
                    Text("Farmer's",
                        style: TextStyle(fontSize: 17, color: Colors.black54)),
                    Container(
                      padding:
                          EdgeInsets.only(top: 5, bottom: 5, right: 5, left: 5),
                      child: Text("Comment",
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
        child: Padding(
          padding: const EdgeInsets.only(left: 24.0, right: 24.0),
          child: Container(
            child: Center(
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: <Widget>[
                      //pic(),
                      Container(
                          width: MediaQuery.of(context).size.width,
                          margin: EdgeInsets.only(top: 20),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                "Comment on Doctor",
                                style: TextStyle(
                                    color: Colors.black,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 16),
                              ),
                              Container(
                                width: 70,
                                child: Divider(
                                  color: Color(0xFF1B8E99),
                                ),
                              )
                            ],
                          )),

                      SizedBox(
                        height: 20.0,
                      ),
                      Container(
                        decoration: new BoxDecoration(
                            //border: new Border.all(color: Colors.black54),
                            //borderRadius: BorderRadius.circular(15),
                            ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: new Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisSize: MainAxisSize.max,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.mood,
                                    color: Colors.black38,
                                  ),
                                  new Text(
                                    '    Are you satisfied with his suggestion?',
                                    style: TextStyle(
                                        color: Color(0xFF1B8E99),
                                        fontSize: 17.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Row(
                                children: <Widget>[
                                  new Radio(
                                      value: '1',
                                      groupValue: _radioProvide,
                                      activeColor: Color(0xFF1B8E99),
                                      //onChanged:(int e) => showDatas(e),
                                      onChanged: _handleRadioValueChange1),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _handleRadioValueChange1("1");
                                        });
                                      },
                                      child: Container(
                                        child: new Text(
                                          'Yes',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 17.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 25),
                                    child: new Radio(
                                        value: '2',
                                        groupValue: _radioProvide,
                                        activeColor: Color(0xFF1B8E99),
                                        //onChanged: (int e) => showDatas(e),
                                        onChanged: _handleRadioValueChange1),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _handleRadioValueChange1("2");
                                      });
                                    },
                                    child: Container(
                                      child: new Text(
                                        'No',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Divider(color: Colors.grey[300]),
                      Container(
                        decoration: new BoxDecoration(
                            //border: new Border.all(color: Colors.black54),
                            //borderRadius: BorderRadius.circular(15),
                            ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: new Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisSize: MainAxisSize.max,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.thumb_up,
                                    color: Colors.black38,
                                  ),
                                  new Text(
                                    '    Did he able to solve your problem?',
                                    style: TextStyle(
                                        color: Color(0xFF1B8E99),
                                        fontSize: 17.0),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Row(
                                children: <Widget>[
                                  new Radio(
                                      value: '1',
                                      groupValue: _radioSatisfied,
                                      activeColor: Color(0xFF1B8E99),
                                      //onChanged:(int e) => showDatas(e),
                                      onChanged: _handleRadioValueChange3),
                                  Expanded(
                                    child: GestureDetector(
                                      onTap: () {
                                        setState(() {
                                          _handleRadioValueChange3("1");
                                        });
                                      },
                                      child: Container(
                                        child: new Text(
                                          'Yes',
                                          style: TextStyle(
                                              color: Colors.black54,
                                              fontSize: 17.0),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 25),
                                    child: new Radio(
                                        value: '2',
                                        groupValue: _radioSatisfied,
                                        activeColor: Color(0xFF1B8E99),
                                        //onChanged: (int e) => showDatas(e),
                                        onChanged: _handleRadioValueChange3),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _handleRadioValueChange3("2");
                                      });
                                    },
                                    child: Container(
                                      child: new Text(
                                        'No',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      new Divider(color: Colors.grey[300]),
                      Container(
                        decoration: new BoxDecoration(
                            //border: new Border.all(color: Colors.black54),
                            //borderRadius: BorderRadius.circular(15),
                            ),
                        child: Column(
                          children: <Widget>[
                            Container(
                              child: new Row(
                                // crossAxisAlignment: CrossAxisAlignment.center,
                                // mainAxisSize: MainAxisSize.max,
                                // mainAxisAlignment: MainAxisAlignment.center,
                                children: <Widget>[
                                  new Icon(
                                    Icons.star,
                                    color: Colors.black38,
                                  ),
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 15),
                                      child: new Text(
                                        'For his suggestion/service, please rate him by selecting from below :',
                                        style: TextStyle(
                                            color: Color(0xFF1B8E99),
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Row(
                                children: <Widget>[
                                  new Radio(
                                      value: '1',
                                      groupValue: _radioavailable,
                                      activeColor: Color(0xFF1B8E99),
                                      //onChanged:(int e) => showDatas(e),
                                      onChanged: _handleRadioValueChange2),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _handleRadioValueChange2("1");
                                      });
                                    },
                                    child: Container(
                                      child: new Text(
                                        'Bad (1)',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 0),
                                    child: new Radio(
                                        value: '2',
                                        groupValue: _radioavailable,
                                        activeColor: Color(0xFF1B8E99),
                                        //onChanged: (int e) => showDatas(e),
                                        onChanged: _handleRadioValueChange2),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _handleRadioValueChange2("2");
                                      });
                                    },
                                    child: Container(
                                      child: new Text(
                                        'Fare (2)',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Row(
                                children: <Widget>[
                                  new Radio(
                                      value: '3',
                                      groupValue: _radioavailable,
                                      activeColor: Color(0xFF1B8E99),
                                      //onChanged:(int e) => showDatas(e),
                                      onChanged: _handleRadioValueChange2),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _handleRadioValueChange2("3");
                                      });
                                    },
                                    child: Container(
                                      child: new Text(
                                        'Good (3)',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 0),
                                    child: new Radio(
                                        value: '4',
                                        groupValue: _radioavailable,
                                        activeColor: Color(0xFF1B8E99),
                                        //onChanged: (int e) => showDatas(e),
                                        onChanged: _handleRadioValueChange2),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _handleRadioValueChange2("4");
                                      });
                                    },
                                    child: Container(
                                      child: new Text(
                                        'Excellent (4)',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Row(
                                children: <Widget>[
                                  new Radio(
                                      value: '5',
                                      groupValue: _radioavailable,
                                      activeColor: Color(0xFF1B8E99),
                                      //onChanged:(int e) => showDatas(e),
                                      onChanged: _handleRadioValueChange2),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _handleRadioValueChange2("5");
                                      });
                                    },
                                    child: Container(
                                      child: new Text(
                                        'Outstanding (5)',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),

                      SizedBox(
                        height: 0.0,
                      ),
                      new Divider(color: Colors.grey[300]),
                      SizedBox(height: 5.0),

                      Container(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            SizedBox(height: 5),
                            loginButton,
                          ],
                        ),
                      ),
                      SizedBox(height: 25),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
