import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:latlong2/latlong.dart';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map_marker_popup/flutter_map_marker_popup.dart';

void main() async {
  runApp(MapPage());
}

class MarkerWithTooltip extends StatefulWidget {
  final Widget child;
  final String tooltip;
  final Function onTap;

  MarkerWithTooltip(
      {required this.child, required this.tooltip, required this.onTap});

  @override
  State<MarkerWithTooltip> createState() => _MarkerWithTooltipState();
}

class _MarkerWithTooltipState extends State<MarkerWithTooltip> {
  final key = new GlobalKey();

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final dynamic tooltip = key.currentState;
        tooltip.ensureTooltipVisible();
        widget.onTap();
      },
      child: Tooltip(
        key: key,
        message: widget.tooltip,
        child: widget.child,
      ),
    );
  }
}

class MapPage extends StatelessWidget {
  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }

  final PopupController _popupController = PopupController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Availability of Seats'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(12.9354, 77.5358),
          zoom: 12.5,
        ),
        layers: [
          TileLayerOptions(
              urlTemplate:
                  "https://api.mapbox.com/styles/v1/varun80042/clfe0hrf8007r01rxptrd4ovn/tiles/256/{z}/{x}/{y}@2x?access_token=pk.eyJ1IjoidmFydW44MDA0MiIsImEiOiJjbGVqcnc2eHcwZWN3M3FsbjBoOThiZGc0In0.5r3p9FR2AWUOtFqtYMzUwg",
              additionalOptions: {
                'accessToken':
                    'pk.eyJ1IjoidmFydW44MDA0MiIsImEiOiJjbGVqcnc2eHcwZWN3M3FsbjBoOThiZGc0In0.5r3p9FR2AWUOtFqtYMzUwg',
                'id': 'mapbox.mapbox-streets-v8',
              }),
          MarkerLayerOptions(markers: [
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.9330, 77.5345),
              builder: (ctx) => Icon(
                Icons.circle,
                color: Colors.blue,
                size: 20,
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.9420, 77.5538),
              builder: (ctx) => MarkerWithTooltip(
                child: Icon(
                  Icons.local_hospital,
                  color: Colors.red,
                  size: 50,
                ),
                  tooltip: "Meenakshi Hospital \n Available Beds: 25",
                  onTap: () {}
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.9109, 77.5208),
              builder: (ctx) => MarkerWithTooltip(
                child: Icon(
                  Icons.local_hospital,
                  color: Colors.red,
                  size: 50,
                ),
                  tooltip: "    Unity Hospital \nAvailable Beds: 33",
                  onTap: () {}
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.9056, 77.5426),
              builder: (ctx) => MarkerWithTooltip(
                child: Icon(
                  Icons.local_hospital,
                  color: Colors.red,
                  size: 50,
                ),
                  tooltip: "Nagarathna Hospital \n Available Beds: 19",
                  onTap: () {}
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.9415, 77.5675),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "\t\t\t BMS Hospital \n Available Beds: 0",
                  onTap: () {}
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.9596, 77.5275),
              builder: (ctx) => MarkerWithTooltip(
                child: Icon(
                  Icons.local_hospital,
                  color: Colors.red,
                  size: 50,
                ),
                  tooltip: "Hospital Sharavathi \n Available Beds: 42",
                  onTap: () {}
              ),
            ),
          ]),
        ],
      ),
    );
  }
}
