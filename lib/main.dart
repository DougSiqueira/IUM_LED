import 'package:flutter/material.dart';
import 'package:ium_led/homePage.dart';

import 'login_page.dart';


void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IMU_LED',
      theme: ThemeData(primarySwatch: Colors.blue,
      ),
      home: LoginPage(), // HomePage(),//
    );
  }
}

