import 'package:flutter/material.dart';
import 'package:restaurantapp/model/meal.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';

import 'package:geocoder/geocoder.dart';

class OrderPage extends StatefulWidget {
  final List<Meal> meals;
  final totalAmount;
  final Position currentPosition;
  OrderPage({this.meals, this.totalAmount, this.currentPosition});

  @override
  _OrderPageState createState() => _OrderPageState();
}

class _OrderPageState extends State<OrderPage> {
  final _formKey = GlobalKey<FormState>();
  String address = "";

  @override
  void initState() {
    _getAddress();
    super.initState();
  }

  _getAddress() async {
    final coordinates = new Coordinates(
        widget.currentPosition.latitude, widget.currentPosition.longitude);
    final addresses =
        await Geocoder.local.findAddressesFromCoordinates(coordinates);

    setState(() {
      address = addresses.first.addressLine;
    });
  }

  @override
  Widget build(BuildContext context) {
    final ColorScheme colorScheme = Theme.of(context).colorScheme;
    return Scaffold(
      appBar: AppBar(
        title: Text('Complete Order'),
        elevation: 0,
      ),
      body: Column(
        children: <Widget>[
          Container(
            height: 180,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  ...widget.meals.map(
                    (_meal) => Column(
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(_meal.name +
                                "         " +
                                "X  " +
                                _meal.quantity.toString()),
                            Text((_meal.price * _meal.quantity).toString()),
                          ],
                        ),
                        Divider(
                          height: 2,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Text("Total Amount"),
                      Text("\$ " + widget.totalAmount.toString()),
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  SingleChildScrollView(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: <Widget>[
                        TextFormField(
                          controller: TextEditingController(
                              text: address == "" ? null : address),
                          decoration: InputDecoration(
                            icon: Icon(Icons.not_listed_location,
                                color: Colors.blue),
                            labelText: "Place of delevery",
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Card(
            height:220,
            
            child: FlutterMap(
              options: MapOptions(
                center: LatLng(widget.currentPosition.latitude,
                    widget.currentPosition.longitude),
                zoom: 15.0,
              ),
              layers: [
                new TileLayerOptions(
                  //  urlTemplate: "https://{s}.tile.openstreetmap.org/{z}/{x}/{y}.png",
                  // subdomains: ['a', 'b', 'c']

                  urlTemplate: "https://api.tiles.mapbox.com/v4/"
                      "{id}/{z}/{x}/{y}@2x.png?access_token={accessToken}",
                  additionalOptions: {
                    'accessToken':
                        'pk.eyJ1IjoiYnJpYW50bWFjaGF2dWRhIiwiYSI6ImNrN2Qyb2J3cDF2NnQzZnA2b2d4cHc3MHUifQ.VBXC_xfb79zKd3rqdyHzJQ',
                    'id': 'mapbox.streets',
                  },
                ),
                new MarkerLayerOptions(
                  markers: [
                    new Marker(
                      width: 80.0,
                      height: 80.0,
                      point: LatLng(widget.currentPosition.latitude,
                          widget.currentPosition.longitude),
                      builder: (ctx) => new Container(
                        child: IconButton(
                          onPressed: null,
                          icon: FaIcon(FontAwesomeIcons.mapMarker),
                          iconSize: 45.0,
                          color: Color(0xff311b92),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
