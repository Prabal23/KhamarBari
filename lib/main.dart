import 'package:flutter/material.dart';
import 'package:login_page/splash_screen.dart';
import 'login_page.dart';
import 'home_page.dart';
import 'reg_page.dart';
import 'dart:async';

int section = 1;

Color header = Color(0xFF1B8E99);

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Hello Khamarbari',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.lightBlue,
        fontFamily: 'Nunito',
      ),
      home: SplashScreen(),
    );
  }
}
