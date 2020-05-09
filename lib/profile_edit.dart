import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:login_page/home_page.dart';
import 'package:login_page/login_page.dart';
import 'dart:async';
import 'package:image_picker/image_picker.dart';
import 'package:login_page/main.dart';

class ProfilePage extends StatefulWidget {
  static String tag = 'register-page';
  @override
  _ProfilePageState createState() => new _ProfilePageState();
}

enum ConfirmAction { CANCEL, ACCEPT }

class _ProfilePageState extends State<ProfilePage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  String _name;
  String _address;
  String _email;
  String _phone;
  String _password;
  String _radioGender, _radioProvide, _radioavailable;
  String date = "Select Date";
  String upazila = "", district = "", service = "", poultries = "";
  var dd, finalDate;
  DateTime _date = DateTime.now();
  bool chkVal = false, isBalance = false;
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
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        backgroundImage: ExactAssetImage('assets/person.png'),
        //radius: 48.0,
        minRadius: 70,
        maxRadius: 70,
        //child: Image.asset('assets/person.png'),
      ),
    );

    var name = TextFormField(
      autofocus: false,
      //initialValue: 'prabal@gmail.com',
      decoration: InputDecoration(
        icon: const Icon(
          Icons.account_circle,
          color: Colors.black38,
        ),
        hintText: 'Full name',
        //hintStyle: TextStyle(color: Colors.black38),
        labelText: 'Enter Full name',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
      ),
      validator: (val) => val.isEmpty ? 'Full Name is empty' : null,
      onSaved: (val) => _name = val,
      //validator: _validateEmail,
    );

    var ac = TextFormField(
      autofocus: false,
      //initialValue: 'prabal@gmail.com',
      decoration: InputDecoration(
        icon: const Icon(
          Icons.account_circle,
          color: Colors.black38,
        ),
        hintText: 'A/C Name',
        //hintStyle: TextStyle(color: Colors.black38),
        labelText: 'Enter A/C name',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
      ),
      validator: (val) => val.isEmpty ? 'Full Name is empty' : null,
      onSaved: (val) => _name = val,
      //validator: _validateEmail,
    );

    var textFormField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'prabal@gmail.com',
      decoration: InputDecoration(
        icon: const Icon(
          Icons.email,
          color: Colors.black38,
        ),
        hintText: 'E-mail ID',
        labelText: 'Enter E-mail ID',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (val) => val.isEmpty
          ? 'Email ID is empty'
          : !val.contains('@') || !val.contains('.')
              ? 'Not a valid email'
              : null,
      onSaved: (val) => _email = val,
      //validator: _validateEmail,
    );
    final email = textFormField;

    var degree = TextFormField(
      autofocus: false,
      //initialValue: 'prabal@gmail.com',
      decoration: InputDecoration(
        icon: const Icon(
          Icons.account_circle,
          color: Colors.black38,
        ),
        hintText: 'Name of last degree',
        //hintStyle: TextStyle(color: Colors.black38),
        labelText: 'Enter last degree name',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
      ),
      validator: (val) => val.isEmpty ? 'Last Degree Name is empty' : null,
      onSaved: (val) => _name = val,
      //validator: _validateEmail,
    );

    var vet = TextFormField(
      autofocus: false,
      //initialValue: 'prabal@gmail.com',
      decoration: InputDecoration(
        icon: const Icon(
          Icons.account_circle,
          color: Colors.black38,
        ),
        hintText: 'Vet Reg No.',
        //hintStyle: TextStyle(color: Colors.black38),
        labelText: 'Enter Vet Reg No.',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
      ),
      validator: (val) => val.isEmpty ? 'Vet Reg No. is empty' : null,
      onSaved: (val) => _name = val,
      //validator: _validateEmail,
    );

    var phone = TextFormField(
      keyboardType: TextInputType.phone,
      autofocus: false,
      //initialValue: 'prabal@gmail.com',
      decoration: InputDecoration(
        icon: const Icon(
          Icons.phone_android,
          color: Colors.black38,
        ),
        hintText: 'Mobile No.',
        labelText: 'Enter Mobile No.',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (val) => val.isEmpty ? 'Mobile No. is empty' : null,
      onSaved: (val) => _email = val,
      //validator: _validateEmail,
    );

    var bkash = TextFormField(
      keyboardType: TextInputType.phone,
      autofocus: false,
      //initialValue: 'prabal@gmail.com',
      decoration: InputDecoration(
        icon: const Icon(
          Icons.phone_android,
          color: Colors.black38,
        ),
        hintText: 'Bkash/Rocket A/C No.',
        labelText: 'Enter Bkash/Rocket A/C No.',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (val) => val.isEmpty ? 'Bkash/Rocket A/C No. is empty' : null,
      onSaved: (val) => _email = val,
      //validator: _validateEmail,
    );

    var other = TextFormField(
      keyboardType: TextInputType.phone,
      autofocus: false,
      //initialValue: 'prabal@gmail.com',
      decoration: InputDecoration(
        hintText: 'Type Speciality...',
        hintStyle: TextStyle(color: Colors.black54, fontSize: 17),
        //labelText: 'Enter Speciality',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (val) => val.isEmpty ? 'Speciality is empty' : null,
      onSaved: (val) => _email = val,
      //validator: _validateEmail,
    );

    final password = TextFormField(
      autofocus: false,
      //initialValue: '230193',
      obscureText: true,
      decoration: InputDecoration(
        icon: const Icon(
          Icons.lock,
          color: Colors.black38,
        ),
        hintText: 'Create Password/Pin No.',
        labelText: 'Enter Password/Pin No.',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (val) => val.isEmpty
          ? 'Password/Pin No. is empty'
          : val.length < 8 ? 'Password/Pin No. too short' : null,
      onSaved: (val) => _password = val,
      //obscureText: true,
    );

    final conpassword = TextFormField(
      autofocus: false,
      //initialValue: '230193',
      obscureText: true,
      decoration: InputDecoration(
        icon: const Icon(
          Icons.lock_open,
          color: Colors.black38,
        ),
        hintText: 'Confirm Password/Pin No.',
        labelText: 'Enter Confirm Password/Pin No.',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        fillColor: Colors.white,
        border: InputBorder.none,
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
      ),
      validator: (val) => val.isEmpty
          ? 'Confirm Password/Pin No. is empty'
          : val.length < 8 ? 'Confirm Password/Pin No. too short' : null,
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
        child: Text('Update Profile', style: TextStyle(color: Colors.white)),
      ),
    );

    final imagePick = Padding(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        //onPressed: _submit,
        onPressed: () {
          pickImagefromGallery(ImageSource.gallery);
        },
        padding: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 7.0),
        //color: Colors.grey,
        child: Text('Choose Profile Image',
            style: TextStyle(
                color: Colors.black45,
                fontSize: 12.0,
                fontWeight: FontWeight.bold)),
      ),
    );

    final forgotLabel = FlatButton(
      child: Text(
        'Forgot password?',
        style: TextStyle(color: Colors.black54),
      ),
      onPressed: () {},
    );

    return Scaffold(
      //key: scaffoldKey,
      backgroundColor: Colors.white,
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
                                "View & Edit Profile",
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
                      SizedBox(height: 5.0),
                      Container(
                        margin: EdgeInsets.only(top: isBalance ? 0 : 5),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Container(
                              margin: EdgeInsets.only(right: 0),
                              child: Row(
                                children: <Widget>[
                                  Container(
                                    margin: EdgeInsets.only(left: 0),
                                    child: Row(
                                      children: <Widget>[
                                        Text("Doctor/Consultant",
                                            style: TextStyle(
                                                color: Colors.black54,
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.bold)),
                                        Container(
                                            height: 20,
                                            width: 20,
                                            margin: EdgeInsets.only(left: 5),
                                            child: Image.asset(
                                              'assets/transportation.png',
                                              fit: BoxFit.cover,
                                            )),
                                      ],
                                    ),
                                  ),
                                ],
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
                                          child:
                                              Image.asset('assets/taka.png')),
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
                                              padding:
                                                  const EdgeInsets.all(8.0),
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
                                                      width: 0.4,
                                                      color: Colors.grey),
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
                                                        fontWeight:
                                                            FontWeight.bold),
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
                      SizedBox(height: 45.0),
                      new FutureBuilder<File>(
                        future: fileImage,
                        builder: (BuildContext context,
                            AsyncSnapshot<File> snapshot) {
                          if (snapshot.connectionState ==
                                  ConnectionState.done &&
                              snapshot.data != null) {
                            return CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage: FileImage(snapshot.data),
                              //radius: 48.0,
                              minRadius: 70,
                              maxRadius: 70,
                              //child: Image.file(snapshot.data),
                            );
                            // return Image.file(
                            //   snapshot.data,
                            //   width: 100,
                            //   height: 100,
                            // );

                          } else if (snapshot.error != null) {
                            return const Text(
                              'Error Picking Image',
                              textAlign: TextAlign.center,
                            );
                          } else {
                            return CircleAvatar(
                              backgroundColor: Colors.transparent,
                              backgroundImage:
                                  ExactAssetImage('assets/person.png'),
                              //radius: 48.0,
                              minRadius: 70,
                              maxRadius: 70,
                              //child: Image.asset('assets/person.png'),
                            );

                            // return const Text(
                            //   'No Image Selected',
                            //   textAlign: TextAlign.center,
                            // );
                          }
                        },
                      ),

                      //logo,
                      SizedBox(height: 10.0),
                      imagePick,
                      SizedBox(height: 10.0),
                      name,
                      SizedBox(
                        height: 0.0,
                      ),
                      new Divider(color: Colors.grey[300]),
                      SizedBox(height: 0.0),
                      ac,
                      SizedBox(
                        height: 0.0,
                      ),
                      new Divider(color: Colors.grey[300]),
                      SizedBox(height: 0.0),
                      email,
                      SizedBox(
                        height: 0.0,
                      ),
                      new Divider(color: Colors.grey[300]),
                      SizedBox(height: 0.0),
                      degree,
                      SizedBox(
                        height: 0.0,
                      ),
                      new Divider(color: Colors.grey[300]),
                      SizedBox(height: 0.0),
                      vet,
                      SizedBox(
                        height: 0.0,
                      ),
                      new Divider(color: Colors.grey[300]),
                      SizedBox(height: 0.0),
                      Container(
                        decoration: new BoxDecoration(
                            //border: new Border.all(color: Colors.black54),
                            //borderRadius: BorderRadius.circular(15),
                            ),
                        child: new Row(
                          // crossAxisAlignment: CrossAxisAlignment.center,
                          // mainAxisSize: MainAxisSize.max,
                          // mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            new Icon(
                              Icons.calendar_today,
                              color: Colors.black38,
                            ),
                            new Text(
                              '    Vet Reg. Date :',
                              style: TextStyle(
                                  color: Color(0xFF1B8E99), fontSize: 17.0),
                            ),
                            new FlatButton(
                                child: new Text(
                                  '$date',
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 17.0),
                                ),
                                onPressed: () {
                                  _selectDate(context);
                                })
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 0.0,
                      ),
                      new Divider(color: Colors.grey[300]),
                      phone,
                      SizedBox(
                        height: 0.0,
                      ),
                      new Divider(color: Colors.grey[300]),
                      SizedBox(height: 0.0),
                      bkash,
                      SizedBox(
                        height: 0.0,
                      ),
                      new Divider(color: Colors.grey[300]),
                      SizedBox(height: 0.0),
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
                                    Icons.location_on,
                                    color: Colors.black38,
                                  ),
                                  new Text(
                                    '    Area interested to provide service :',
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
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text(
                                      'Upazila : ',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 17.0),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black87,
                                          ),
                                          value: upazila,
                                          hint: Text("Upazila",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black87)),
                                          items: _dropDownUpaItems,
                                          onChanged: (String value) {
                                            setState(() {
                                              upazila = value;
                                            });
                                          },
                                        ),
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
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text(
                                      'District : ',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 17.0),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
                                      child: DropdownButtonHideUnderline(
                                        child: DropdownButton(
                                          style: TextStyle(
                                            fontSize: 17,
                                            color: Colors.black87,
                                          ),
                                          value: district,
                                          hint: Text("District",
                                              style: TextStyle(
                                                  fontSize: 17,
                                                  color: Colors.black87)),
                                          items: _dropDownDistItems,
                                          onChanged: (String value) {
                                            setState(() {
                                              district = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )
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
                                    Icons.location_on,
                                    color: Colors.black38,
                                  ),
                                  new Text(
                                    '    Service Status :',
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
                                  Container(
                                    margin: EdgeInsets.only(left: 15),
                                    child: Text(
                                      'Status : ',
                                      style: TextStyle(
                                          color: Colors.black54,
                                          fontSize: 17.0),
                                    ),
                                  ),
                                  Expanded(
                                    child: Container(
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
                                    Icons.group_work,
                                    color: Colors.black38,
                                  ),
                                  new Text(
                                    '    Special on :',
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
                                      groupValue: _radioGender,
                                      activeColor: Color(0xFF1B8E99),
                                      //onChanged:(int e) => showDatas(e),
                                      onChanged: _handleRadioValueChange),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _handleRadioValueChange("1");
                                      });
                                    },
                                    child: Container(
                                      child: new Text(
                                        'Dairy',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 42),
                                    child: new Radio(
                                        value: '2',
                                        groupValue: _radioGender,
                                        activeColor: Color(0xFF1B8E99),
                                        //onChanged: (int e) => showDatas(e),
                                        onChanged: _handleRadioValueChange),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _handleRadioValueChange("2");
                                      });
                                    },
                                    child: Container(
                                      child: new Text(
                                        'Poultry',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _radioGender == "2"
                                ? Container(
                                    margin: EdgeInsets.only(left: 40),
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(left: 10),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton(
                                        style: TextStyle(
                                          fontSize: 17,
                                          color: Colors.black87,
                                        ),
                                        value: poultries,
                                        hint: Text("Poultry",
                                            style: TextStyle(
                                                fontSize: 17,
                                                color: Colors.black54)),
                                        items: _dropDownPoulItems,
                                        onChanged: (String value) {
                                          setState(() {
                                            poultries = value;
                                          });
                                        },
                                      ),
                                    ),
                                  )
                                : Container(),
                            Container(
                              margin: EdgeInsets.only(left: 25),
                              child: Row(
                                children: <Widget>[
                                  new Radio(
                                      value: '3',
                                      groupValue: _radioGender,
                                      activeColor: Color(0xFF1B8E99),
                                      //onChanged:(int e) => showDatas(e),
                                      onChanged: _handleRadioValueChange),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _handleRadioValueChange("3");
                                      });
                                    },
                                    child: Container(
                                      child: new Text(
                                        'Pet Animal',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                  new Radio(
                                      value: '4',
                                      groupValue: _radioGender,
                                      activeColor: Color(0xFF1B8E99),
                                      //onChanged: (int e) => showDatas(e),
                                      onChanged: _handleRadioValueChange),
                                  GestureDetector(
                                    onTap: () {
                                      setState(() {
                                        _handleRadioValueChange("4");
                                      });
                                    },
                                    child: Container(
                                      child: new Text(
                                        'Others',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            _radioGender == "4"
                                ? Container(
                                    margin: EdgeInsets.only(left: 40),
                                    width: MediaQuery.of(context).size.width,
                                    padding: EdgeInsets.only(
                                        left: 10, bottom: 3, top: 3),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(15),
                                        border: Border.all(
                                            color: Colors.grey, width: 0.5)),
                                    child: other)
                                : Container()
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
                                    Icons.group_work,
                                    color: Colors.black38,
                                  ),
                                  new Text(
                                    '    Ready to provide :',
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
                                          'Consultancy over phone',
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
                                        'Firm Inspection',
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
                                    Icons.group_work,
                                    color: Colors.black38,
                                  ),
                                  new Text(
                                    '    You are available at :',
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
                                        'Morning',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 42),
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
                                        'Noon',
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
                                        'Afternoon',
                                        style: TextStyle(
                                            color: Colors.black54,
                                            fontSize: 17.0),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(left: 28),
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
                                        'Night',
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
                                        'Any Time',
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
                      password,
                      SizedBox(
                        height: 0.0,
                      ),
                      new Divider(color: Colors.grey[300]),
                      SizedBox(height: 0.0),
                      conpassword,
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
