import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_page/home_page.dart';
import 'package:login_page/login_page.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';

class CommentPage extends StatefulWidget {
  static String tag = 'register-page';
  @override
  _CommentPageState createState() => new _CommentPageState();
}

enum ConfirmAction { CANCEL, ACCEPT }

class _CommentPageState extends State<CommentPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  String _name;
  String _address;
  String _email;
  String _phone;
  String _password;
  String _radioGender, _radioProvide, _radioavailable;
  String date = "Select Date";
  String upazila = "",
      district = "",
      service = "",
      poultries = "",
      training = "",
      management = "";
  var dd, finalDate;
  DateTime _date = DateTime.now();
  bool chkVal = false;
  Future<File> fileImage;

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
                                  "Our terms and conditions",
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
                                'Terms and Conditions agreements act as a legal contract between you (the company) who has the website or mobile app and the user who access your website and mobile app.',
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
                                            "Edit Profile",
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

  List upa = ["U1", "U2"];
  List dist = ["D1", "D2"];
  List serveSts = ["SS1", "SS2"];
  List poul = ["Layer", "Broiler", "Breeder", "Hatchary"];

  List<DropdownMenuItem<String>> _dropDownUpaItems,
      _dropDownDistItems,
      _dropDownServiceItems,
      _dropDownPoulItems;

  List<DropdownMenuItem<String>> getDropDownUpaItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String upazilas in upa) {
      items.add(new DropdownMenuItem(
          value: upazilas,
          child: new Text(
            upazilas,
            style: TextStyle(fontSize: 17, color: Colors.black54),
          )));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getDropDownDistItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String dists in dist) {
      items.add(new DropdownMenuItem(
          value: dists,
          child: new Text(
            dists,
            style: TextStyle(fontSize: 17, color: Colors.black54),
          )));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getDropDownServiceItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String serv in serveSts) {
      items.add(new DropdownMenuItem(
          value: serv,
          child: new Text(
            serv,
            style: TextStyle(fontSize: 17, color: Colors.black54),
          )));
    }
    return items;
  }

  List<DropdownMenuItem<String>> getDropDownPoultryItems() {
    List<DropdownMenuItem<String>> items = new List();
    for (String pouls in poul) {
      items.add(new DropdownMenuItem(
          value: pouls,
          child: new Text(
            pouls,
            style: TextStyle(fontSize: 17, color: Colors.black54),
          )));
    }
    return items;
  }

  pickImagefromGallery(ImageSource src) {
    setState(() {
      fileImage = ImagePicker.pickImage(source: src);
    });
  }

  Future<Null> _selectDate(BuildContext context) async {
    final DateTime picked = await showDatePicker(
      context: context,
      initialDate: _date,
      firstDate: DateTime(1915),
      lastDate: DateTime(2100),
    );
    if (picked != null && picked != _date) {
      dd = DateTime.parse(_date.toString());
      finalDate = "${dd.day}-${dd.month}-${dd.year}";
      date = finalDate.toString();
      //print('Birth Date : $finalDate');
      //print('Birth Date : $date');
      setState(() {
        _date = picked;
        var dd1 = DateTime.parse(_date.toString());
        var finalDate1 = "${dd1.day}-${dd1.month}-${dd1.year}";
        date = finalDate1.toString();
        // DateTime dateTime = DateTime.parse(date);
        // Fluttertoast.showToast(msg: dateTime.toString(),toastLength: Toast.LENGTH_SHORT);
        // _date = dateTime;
      });
    }
  }

  Future _submit() async {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      //Navigator.of(context).pushNamed(HomePage.tag);
      _asyncConfirmDialog();
    }
  }

  @override
  void initState() {
    setState(() {
      _radioGender = "";
    });
    _dropDownUpaItems = getDropDownUpaItems();
    upazila = _dropDownUpaItems[0].value;

    _dropDownDistItems = getDropDownDistItems();
    district = _dropDownDistItems[0].value;

    _dropDownServiceItems = getDropDownServiceItems();
    service = _dropDownServiceItems[0].value;

    _dropDownPoulItems = getDropDownPoultryItems();
    poultries = _dropDownPoulItems[0].value;
    super.initState();
  }

  void _handleRadioValueChange(String value) {
    setState(() {
      _radioGender = value;

      switch (_radioGender) {
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
      }
      debugPrint(_radioGender);
    });
  }

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
      debugPrint(_radioGender);
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
      debugPrint(_radioGender);
    });
  }

  @override
  Widget build(BuildContext context) {
    final suggest = TextFormField(
      autofocus: false,
      decoration: InputDecoration(
        icon: const Icon(
          Icons.thumbs_up_down,
          color: Colors.black38,
        ),
        hintText: 'Enter Medicine Name',
        labelText: 'Suggest a medicine to the farmer',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (val) => val.isEmpty ? 'Medicine Name is empty' : null,
      onSaved: (val) => _password = val,
      //obscureText: true,
    );

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
      // body: Center(
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
                                "Comment on farm inspection",
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

                      Container(
                        margin: EdgeInsets.only(top: 20),
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
                                    Icons.home,
                                    color: Colors.black38,
                                  ),
                                  new Text(
                                    '    Select a farm :',
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
                                  Expanded(
                                    child: Container(
                                      margin: EdgeInsets.only(left: 17),
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black87,
                                          ),
                                          value: service,
                                          hint: Text("Service",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black87)),
                                          items: _dropDownServiceItems,
                                          onChanged: (String value) {
                                            setState(() {
                                              service = value;
                                            });
                                          },
                                        ),
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
                                    Icons.work,
                                    color: Colors.black38,
                                  ),
                                  new Text(
                                    '    Did farmer get any training? :',
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
                                    Icons.star,
                                    color: Colors.black38,
                                  ),
                                  new Text(
                                    '    Management of Farm :',
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
                                        'Poor (1) -> 40%',
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
                                        'Fare (2) -> 55%',
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
                                        'Good (3) -> 70%',
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
                                        'Excellent (4) -> 85%',
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
                                        'Outstanding (5) -> 100%',
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
                      //birthdate,
                      SizedBox(height: 0.0),
                      suggest,
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
