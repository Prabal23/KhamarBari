import 'package:flutter/material.dart';
import 'package:login_page/home_page.dart';
import 'package:login_page/main.dart';
import 'package:login_page/reg_page.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final scaffoldKey = GlobalKey<ScaffoldState>();
  final formKey = GlobalKey<FormState>();
  String _email;
  String _password, userType = "Farmer";

  void _submit() {
    final form = formKey.currentState;

    if (form.validate()) {
      form.save();
      Navigator.push(
          context, MaterialPageRoute(builder: (context) => HomePage(section)));
      // Email & password matched our validation rules
      // and are saved to _email and _password fields.
      _performLogin();
    }
  }

  void _performLogin() {
    // This is just a demo, so no actual login here.
    final snackbar = SnackBar(
      content: Text('Email: $_email, password: $_password'),
    );

    scaffoldKey.currentState.showSnackBar(snackbar);
  }

  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'hero',
      child: CircleAvatar(
        backgroundColor: Colors.transparent,
        radius: 48.0,
        child: Image.asset('assets/khamarbari.png'),
      ),
    );

    var textFormField = TextFormField(
      keyboardType: TextInputType.emailAddress,
      autofocus: false,
      //initialValue: 'prabal@gmail.com',
      decoration: InputDecoration(
        icon: const Icon(
          Icons.phone,
          color: Colors.black38,
        ),
        hintText: 'Mobile Number',
        labelText: 'Account Number',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
      ),
      validator: (val) => val.isEmpty ? 'Account Number is empty' : null,
      onSaved: (val) => _email = val,
      //validator: _validateEmail,
    );
    final email = textFormField;

    final password = TextFormField(
      autofocus: false,
      //initialValue: '230193',
      obscureText: true,
      decoration: InputDecoration(
        icon: const Icon(
          Icons.lock,
          color: Colors.black38,
        ),
        hintText: 'Password',
        labelText: 'Your Pin Number',
        labelStyle: TextStyle(color: Color(0xFF1B8E99)),
        contentPadding: EdgeInsets.fromLTRB(0.0, 10.0, 20.0, 10.0),
        border: InputBorder.none,
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(15)),
        //border: OutlineInputBorder(borderRadius: BorderRadius.circular(32.0)),
        //border: OutlineInputBorder(borderRadius: BorderRadius.vertical()),
      ),
      validator: (val) => val.isEmpty
          ? 'Pin Number is empty'
          : val.length < 8 ? 'Pin Number too short' : null,
      onSaved: (val) => _password = val,
      //obscureText: true,
    );

    final loginButton = Padding(
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        //onPressed: _submit,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => HomePage(section)));
        },
        padding: EdgeInsets.fromLTRB(20.0, 15.0, 20.0, 15.0),
        color: Color(0xFF1B8E99),
        child: Text('Sign In', style: TextStyle(color: Colors.white)),
      ),
    );

    final signupTxt = Padding(
      padding: EdgeInsets.symmetric(vertical: 16.0),
      child: Text(
        "Don't have an account?  ",
        style: TextStyle(color: Colors.black45, fontSize: 12.0),
      ),
    );

    final signupBtn = Padding(
      padding: EdgeInsets.symmetric(vertical: 7.0),
      child: RaisedButton(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(24),
        ),
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => RegisterPage()));
        },
        padding: EdgeInsets.fromLTRB(10.0, 7.0, 10.0, 7.0),
        color: Colors.grey,
        child: Text('Sign Up',
            style: TextStyle(color: Colors.white, fontSize: 12.0)),
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
      appBar: AppBar(
        actions: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 20),
            child: Row(
              children: <Widget>[
                Text('Login as',
                    style: TextStyle(
                        color: Colors.black45,
                        fontSize: 12.0,
                        fontWeight: FontWeight.bold)),
                PopupMenuButton<int>(
                  itemBuilder: (context) => [
                    PopupMenuItem(
                      value: 1,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Farmer",
                            style: TextStyle(
                                color: header,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              height: 20,
                              width: 20,
                              margin: EdgeInsets.only(left: 5),
                              child: Image.asset(
                                'assets/man.png',
                                fit: BoxFit.cover,
                              ))
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 2,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "Doctor/Consultant",
                            style: TextStyle(
                                color: header,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              height: 20,
                              width: 20,
                              margin: EdgeInsets.only(left: 5),
                              child: Image.asset(
                                'assets/doctor.png',
                                fit: BoxFit.cover,
                              ))
                        ],
                      ),
                    ),
                    PopupMenuItem(
                      value: 3,
                      child: Row(
                        children: <Widget>[
                          Text(
                            "A/I Technician",
                            style: TextStyle(
                                color: header,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold),
                          ),
                          Container(
                              height: 20,
                              width: 20,
                              margin: EdgeInsets.only(left: 5),
                              child: Image.asset(
                                'assets/transportation.png',
                                fit: BoxFit.cover,
                              ))
                        ],
                      ),
                    ),
                  ],
                  //icon: Icon(Icons.library_add),
                  offset: Offset(0, 100),
                  child: Container(
                    margin: EdgeInsets.only(left: 5),
                    child: Row(
                      children: <Widget>[
                        Text(userType,
                            style: TextStyle(
                                color: header,
                                fontSize: 12.0,
                                fontWeight: FontWeight.bold)),
                        Container(
                            height: 20,
                            width: 20,
                            margin: EdgeInsets.only(left: 5),
                            child: Image.asset(
                              section == 1
                                  ? 'assets/man.png'
                                  : section == 2
                                      ? 'assets/doctor.png'
                                      : 'assets/transportation.png',
                              fit: BoxFit.cover,
                            ))
                      ],
                    ),
                  ),
                  onSelected: (value) {
                    setState(() {
                      if (value == 1) {
                        section = 1;
                        userType = "Farmer";
                      } else if (value == 2) {
                        section = 2;
                        userType = "Doctor/Consultant";
                      } else {
                        section = 3;
                        userType = "A/I Technician";
                      }
                    });
                  },
                ),
              ],
            ),
          ),
        ],
        backgroundColor: Colors.white,
        elevation: 0,
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
                      logo,
                      SizedBox(height: 20.0),
                      Container(
                          child: Text("Login to your Hello Khamarbari account",
                              style: TextStyle(
                                  fontSize: 13, fontWeight: FontWeight.bold))),
                      SizedBox(height: 20.0),
                      email,
                      SizedBox(
                        height: 2.0,
                      ),
                      new Divider(color: Colors.grey),
                      SizedBox(height: 0.0),
                      password,
                      SizedBox(
                        height: 0.0,
                      ),
                      new Divider(color: Colors.grey),
                      SizedBox(height: 0),
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: <Widget>[
                          //SizedBox(height: 25),
                          forgotLabel,
                        ],
                      ),
                      SizedBox(height: 0),
                      new Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: <Widget>[
                          //SizedBox(height: 10),
                          loginButton,
                        ],
                      ),
                      new Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: <Widget>[
                          SizedBox(height: 25),
                          signupTxt,
                          signupBtn
                        ],
                      ),
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
