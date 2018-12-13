import 'package:flutter/material.dart';
import 'package:sample_app/home_page.dart';
import 'package:sample_app/login_page.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  final routes = <String, WidgetBuilder>{
    LoginPage.tag: (context) => LoginPage(),
    HomePage.tag: (context) => HomePage()
  };

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Sample app',
      debugShowCheckedModeBanner: true,
      theme: ThemeData(primarySwatch: Colors.lightBlue, fontFamily: 'Nunito'),
      home: LoginPage(),
      routes: routes,
    );
  }
}
