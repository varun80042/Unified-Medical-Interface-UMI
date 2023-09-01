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

class MapPage extends StatefulWidget {
  const MapPage({Key? key}) : super(key: key);

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  LatLng _userLocation = LatLng(0, 0); // Initial user location

  void getLocation() async {
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
    setState(() {
      _userLocation = LatLng(position.latitude, position.longitude);
    });
  }

  final PopupController _popupController = PopupController();

  @override
  void initState() {
    super.initState();
    getLocation(); // Get the user's location when the widget is initialized.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue[200],
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Availability of Beds'),
      ),
      body: FlutterMap(
        options: MapOptions(
          center: LatLng(12.8897, 77.6149),
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
              point: LatLng(12.8897, 77.6149),
              builder: (ctx) => Icon(
                Icons.circle,
                color: Colors.blue,
                size: 20,
              ),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.8853, 77.6153),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "Vigneshwara Hospital \n Available Beds: 0",
                  onTap: () {}),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.8878, 77.6104),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "Shreya Hospitals \nAvailable Beds: 33",
                  onTap: () {}),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.8954, 77.6075),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "Rajashri Hospitals \n Available Beds: 19",
                  onTap: () {}),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.8980, 77.6207),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "Shrushti Hospital \n Available Beds: 5",
                  onTap: () {}),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.8791, 77.6085),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "Sri Sairam Hospital \n Available Beds: 42",
                  onTap: () {}),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.8815, 77.6268),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "Jayashree Hospital \n Available Beds: 16",
                  onTap: () {}),
            ),
            // break
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.8953, 77.6253),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "Vishvesh Hospitals \n Available Beds: 10",
                  onTap: () {}),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.8978, 77.6004),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "Suresh Hospitals \nAvailable Beds: 53",
                  onTap: () {}),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.9054, 77.6175),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "Raj Therapy Clinic \n Available Beds: 3",
                  onTap: () {}),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.9080, 77.6307),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "Sai Hospital \n Available Beds: 7",
                  onTap: () {}),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.8891, 77.6185),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "Chegum Hospitals \n Available Beds: 17",
                  onTap: () {}),
            ),
            Marker(
              width: 80.0,
              height: 80.0,
              point: LatLng(12.8905, 77.5968),
              builder: (ctx) => MarkerWithTooltip(
                  child: Icon(
                    Icons.local_hospital,
                    color: Colors.red,
                    size: 50,
                  ),
                  tooltip: "Apollo Hospitals \n Available Beds: 124",
                  onTap: () {}),
            ),
          ]),
        ],
      ),
    );
  }
}
