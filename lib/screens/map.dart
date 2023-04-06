import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';

void main() async {
  runApp(MapPage());
}

class MapPage extends StatelessWidget {

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Flutter Map'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(12.9354, 77.5358),
          zoom: 13.0,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate: "https://api.mapbox.com/styles/v1/varun80042/clfe0hrf8007r01rxptrd4ovn/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidmFydW44MDA0MiIsImEiOiJjbGVqcnc2eHcwZWN3M3FsbjBoOThiZGc0In0.5r3p9FR2AWUOtFqtYMzUwg",
              additionalOptions: {
                'accessToken' : 'pk.eyJ1IjoidmFydW44MDA0MiIsImEiOiJjbGVqcnc2eHcwZWN3M3FsbjBoOThiZGc0In0.5r3p9FR2AWUOtFqtYMzUwg',
                'id' : 'mapbox.mapbox-streets-v8',
              }
          ),
          MarkerLayerOptions(
              markers: [
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(12.9384, 77.5450),
                  builder: (ctx) =>
                      Icon(
                        Icons.fire_truck,
                        color: Colors.red,
                        size: 50,
                      ),

                ),
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(12.9303, 77.5334),
                  builder: (ctx) =>
                      Icon(
                        Icons.fire_truck,
                        color: Colors.red,
                        size: 50,
                      ),
                ),
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(12.9395, 77.5345),
                  builder: (ctx) =>
                      Icon(
                        Icons.fire_truck,
                        color: Colors.red,
                        size: 50,
                      ),
                ),
                Marker(
                  width: 80.0,
                  height: 80.0,
                  point: LatLng(12.9497, 77.5392),
                  builder: (ctx) =>
                      Icon(
                        Icons.fire_truck,
                        color: Colors.red,
                        size: 50,
                      ),
                ),
              ]
          ),

        ],
      ),
    );
  }
}
