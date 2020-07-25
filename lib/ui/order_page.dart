import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get_it/get_it.dart';
import 'package:restaurantapp/model/api_response.dart';
import 'package:restaurantapp/model/meal.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';

import 'package:geocoder/geocoder.dart';
import 'package:restaurantapp/service/customer_service.dart';
import 'package:restaurantapp/ui/customer_home.dart';

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
  bool isLoading = false;
  bool _isLoading = false;

  CustomerService get customerService => GetIt.I<CustomerService>();
  APIResponse<bool> _apiResponse = APIResponse(error: false);

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
            height: 100,
            decoration: BoxDecoration(
              color: Colors.white,
            ),
            padding: EdgeInsets.only(
                left: 20.0, right: 20.0, top: 40.0, bottom: 10.0),
            child: SingleChildScrollView(
              child: Column(
                children: widget.meals
                    .map(
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
                    )
                    .toList(),
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
                    child: TextFormField(
                      controller: TextEditingController(
                          text: address == "" ? null : address),
                      decoration: InputDecoration(
                        icon:
                            Icon(Icons.not_listed_location, color: Colors.blue),
                        labelText: "Place of delivery",
                      ),
                    ),
                  ),
                  SizedBox(
                      width: 200,
                      child: RaisedButton(
                        color: Theme.of(context).primaryColor,
                        textColor: Colors.white,
                        child: Text("Complete Order".toUpperCase()),
                        onPressed: () {
                          if (_formKey.currentState.validate()) {
                            _formKey.currentState.save();
                            _signup();
                            // Navigator.pushNamed(context, 'animalRegister');
                          }
                        },
                      )),
                ],
              ),
            ),
          ),
          Container(
            height: 250,
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
                          icon: Icon(
                            Icons.place,
                            color: Colors.purple,
                          ),
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
          SizedBox(
            height: 10,
          )
        ],
      ),
    );
  }

  _signup() async {
    showToast("Order successfully created");
    _selectionConfirmation();
    // Navigator.pushNamed(context, 'animalRegister');
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
                Text('Your order has been submited.'),
                Text('It will be delivered soon'),
              ],
            ),
          ),
          actions: <Widget>[
            FlatButton(
              child: Text('OK'),
              onPressed: () {
                Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => CustomerHomePage(
                         
                       
                        )),
              );
              },
            ),
          ],
        );
      },
    );
  }

  void showToast(String msg, {int duration, int gravity}) {
    Fluttertoast.showToast(
        msg: msg,
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        textColor: Colors.green,
        fontSize: 16.0);
  }
}
