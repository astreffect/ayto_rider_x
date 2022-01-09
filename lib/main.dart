import 'package:flutter/material.dart';
import 'package:ayto_rider_x/LoginPages/login_Page.dart';
import 'package:ayto_rider_x/Utilites/edit_text.dart';
import 'package:ayto_rider_x/Utilites/routers.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(

      initialRoute: MyRouters.loginRoute,
      routes: {
        MyRouters.loginRoute :(context)=> const LoginPage(),
      },
    );
  }
}


