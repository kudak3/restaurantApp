import 'package:flutter/material.dart';

import 'customer_home.dart';
import 'driver_home.dart';

class LandingPage extends StatefulWidget {
  @override
  _LandingPageState createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  // final String backImg = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(''),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: <Widget>[
          Container(
            color: Colors.black54,
            child: Column(
              children: <Widget>[
                const SizedBox(height: kToolbarHeight + 40),
                Expanded(
                  child: Column(
                    children: <Widget>[
                      Text(
                        "Welcome",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.w500,
                          fontSize: 30.0,
                        ),
                      ),
                      const SizedBox(height: 10.0),
                      Text(
                        "Welcome to Pamashops. \n Good food to lighten your mood",
                        style: TextStyle(
                          color: Colors.white70,
                          fontSize: 18.0,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 10.0),
                Row(
                  children: <Widget>[
                    const SizedBox(width: 10.0),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.red,
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(20.0),
                              bottomLeft: Radius.circular(20.0)),
                        ),
                        child: Text("Customer"),
                        onPressed: () {
                          setState(() {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CustomerHomePage()),
                            );
                          });
                        },
                      ),
                    ),
                    Expanded(
                      child: RaisedButton(
                        color: Colors.grey.shade700,
                        textColor: Colors.white,
                        elevation: 0,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                              topRight: Radius.circular(20.0),
                              bottomRight: Radius.circular(20.0)),
                        ),
                        child: Text("Driver"),
                        onPressed: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => DriverHomePage()),
                          );
                        },
                      ),
                    ),
                    const SizedBox(width: 10.0),
                  ],
                ),
                const SizedBox(height: 80.0),
              ],
            ),
          ),
        ],
      ),
    ));
  }
}
