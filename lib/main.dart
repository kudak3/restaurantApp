import 'package:flutter/material.dart';

import 'ui/login_page.dart';



void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
        theme: ThemeData(
            brightness: Brightness.light,
            accentColor: Colors.deepOrangeAccent,
            primarySwatch: Colors.deepPurple),
        home: Scaffold(
          appBar: AppBar(
            title: Text('List Application'),
          ),
          body: LoginPage(),
        ));
  }
}