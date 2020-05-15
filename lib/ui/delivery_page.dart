import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'package:flutter_map/flutter_map.dart';
import 'package:latlong/latlong.dart';
import 'package:geolocator/geolocator.dart';

import 'package:geocoder/geocoder.dart';


import 'package:font_awesome_flutter/font_awesome_flutter.dart';



class TrackDelivery extends StatefulWidget {
   final Position currentPosition;
  TrackDelivery({this.currentPosition});


  @override
  _TrackDeliveryState createState() => _TrackDeliveryState();
}

class _TrackDeliveryState extends State<TrackDelivery> {
 
   @override
  void initState() {
    super.initState();
  }
  @override
 Widget build(BuildContext context) {
    return Scaffold(
   body: Padding(
        padding: EdgeInsets.all(8.0),
        child: Column(
          children: [
            
            Flexible(
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
                     Marker(
                      width: 60.0,
                      height: 60.0,
                      point: LatLng(widget.currentPosition.latitude,
                          widget.currentPosition.longitude),
                      builder: (ctx) => new Container(
                        child: IconButton(
                          onPressed: null,
                          icon: FaIcon(FontAwesomeIcons.mapMarker),
                          iconSize: 30.0,
                          color: Color(0xff311b92),
                        ),
                      ),
                    ),
                     Marker(
                      width: 60.0,
                      height: 60.0,
                      point: LatLng(widget.currentPosition.latitude,
                          widget.currentPosition.longitude),
                      builder: (ctx) => new Container(
                        child: IconButton(
                          onPressed: null,
                          icon: Icon(Icons.play_circle_outline),
                          iconSize: 45.0,
                          color: Color(0xff231c84),
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
      ),
      floatingActionButton: FloatingActionButton(onPressed: null,child: Icon(FontAwesomeIcons.locationArrow),),
    );
  }
}


  
