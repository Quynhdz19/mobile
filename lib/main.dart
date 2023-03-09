import 'package:flutter/material.dart';
import 'package:mobile_front_end/auth/login.dart';


void main() {
  runApp( MyApp() );
}
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginPage(),
    );
  }
}

