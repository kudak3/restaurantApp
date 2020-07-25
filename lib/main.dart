import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

import 'service/customer_service.dart';
import 'service/driver_service.dart';
import 'ui/authentication_service.dart';
import 'ui/login_page.dart';





void main() {
  setupLocator();
  runApp(MyApp());
}

void setupLocator(){
   GetIt.I.registerLazySingleton(()=> DriverService());
   GetIt.I.registerLazySingleton(()=> CustomerService());
  GetIt.I.registerLazySingleton(()=> AuthenticationService());


  
}

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
         
          body: LoginPage(),
        ));
  }
}