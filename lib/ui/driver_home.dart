import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:restaurantapp/ui/delivery_page.dart';

class DriverHomePage extends StatefulWidget {
  @override
  _DriverHomePage createState() => _DriverHomePage();
}

class _DriverHomePage extends State<DriverHomePage> {
  bool selected1 = false;
  bool selected2 = false;
  bool selected3 = false;
  bool selected4 = false;
  bool selected5 = false;
  bool selected6 = false;

  Position currentPosition;
  Position destinationPosition;
  var latitude, longitude;

  _getCurrentLocation() async {
    final position = await Geolocator()
        .getCurrentPosition(desiredAccuracy: LocationAccuracy.high);

    setState(() {
      currentPosition = position;
    });
    print("==================" + currentPosition.toString());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Driver'),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          SizedBox(height: 20.0),
          Card(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                InkWell(
                    onTap: () {
                      _selectionConfirmation();
                      setState(() {
                        latitude = -20.233422;
                        longitude = 28.492126;
                      });
                    },
                    child: ListTile(
                      trailing: CircleAvatar(),
                      title: Text("Elton Mukono"),
                      subtitle: Text("2 Calnary Road Hillside"),
                    )),
                InkWell(
                    onTap: () {
                      _selectionConfirmation();
                      setState(() {
                        latitude = -20.261875;
                        longitude = 28.646851;
                      });
                    },
                    child: ListTile(
                      trailing: CircleAvatar(),
                      title: Text("Carol Sibanda"),
                      subtitle: Text("3 Malcom Road CBD"),
                    )),
                InkWell(
                    onTap: () {
                      _selectionConfirmation();
                      setState(() {
                        latitude = -20.157594;
                        longitude = 28.585510;
                      });
                    },
                    child: ListTile(
                      trailing: CircleAvatar(),
                      title: Text("Ben Bernads"),
                      subtitle: Text("4 Chimuti Road Budiriro"),
                    ))
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _selectionConfirmation() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return AlertDialog(
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('Order Selected'),
                Text('Navigate to the Address'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () async {
                await _getCurrentLocation();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => TrackDelivery(
                      latitude: latitude,
                      longitude: longitude,
                      currentPosition: currentPosition,
                    ),
                  ),
                );
              },
            ),
            FlatButton(
              child: Text('No'),
              onPressed: () async {
                await _getCurrentLocation();
                Navigator.of(context).pop();
              },
            ),
          ],
        );
      },
    );
  }

  void _nextSubmit() {}
}
