import 'package:map_launcher/map_launcher.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

void main() {
  runApp(MyMapLauncher());
}

class MyMapLauncher extends StatefulWidget {
  const MyMapLauncher({Key? key}) : super(key: key);

  @override
  State<MyMapLauncher> createState() => _MyMapLauncherState();
}

class _MyMapLauncherState extends State<MyMapLauncher> {

  int selectedBoxIndex = 0;

  void handleBoxTap(int index) {
    setState(() {
      selectedBoxIndex = index;
    });
  }

  final coordinates = Coords(12.9395, 77.5345);
  final destination = Coords(12.9497, 77.5392);
  final title = "PES University";
  final description = "PES University";


  showMarkerWithFirstMap() async {
    final List<AvailableMap> availableMaps = await MapLauncher.installedMaps;
    await availableMaps.first.showMarker(
      coords: coordinates,
      title: title,
    );
  }

  showDirectionWithFirstMap() async {
    final List<AvailableMap> availableMaps = await MapLauncher.installedMaps;
    await availableMaps.first.showDirections(
      destination: destination,
    );
  }

  openMapsSheet(BuildContext context) async {
    try {
      final List<AvailableMap> availableMaps = await MapLauncher.installedMaps;

      showModalBottomSheet(
        context: context,
        builder: (BuildContext context) {
          return Scaffold(
            resizeToAvoidBottomInset: false,
            backgroundColor: Colors.grey[300],
            body: Column(
              children: <Widget>[
                for (AvailableMap map in availableMaps)
                  ListTile(
                    onTap: () => map.showDirections(
                      destination: coordinates,
                    ),
                    title: Text(map.mapName),
                    leading: SvgPicture.asset(
                      map.icon,
                      height: 30.0,
                      width: 30.0,
                    ),
                  ),
              ],
            ),
          );
        },
      );
    } catch (e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          appBar: AppBar(
            toolbarHeight: 80,
            backgroundColor: Colors.red,
            centerTitle: true,
            title: Text('Book an Ambulance'),
          ),
          body: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Text(
                //   coordinates.latitude.toString(),
                //   style: Theme.of(context).textTheme.headline5,
                // ),
                // Text(
                //   coordinates.longitude.toString(),
                //   style: Theme.of(context).textTheme.headline5,
                // ),
                // const SizedBox(
                //   height: 20,
                // ),
                // ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       backgroundColor: Colors.red,
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(50),
                //       ),
                //       minimumSize: const Size(150, 40),
                //       padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                //       textStyle:
                //       const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                //     ),
                //     onPressed: () => showMarkerWithFirstMap(),
                //     child: const Text('Locate Yourself')),
                // SizedBox(
                //   height: 25,
                // ),
                GestureDetector(
                  onTap: () => handleBoxTap(0),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: selectedBoxIndex == 0 ? Colors.blue[100] : null,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.heart_broken,
                          color: Colors.red,
                        ),
                        SizedBox(width: 8),
                        Text("Heart Attack"),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleBoxTap(1),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: selectedBoxIndex == 1 ? Colors.blue[100] : null,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.heart_broken,
                          color: Colors.red,
                        ),
                        SizedBox(width: 8),
                        Text("Heart Attack"),
                      ],
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () => handleBoxTap(2),
                  child: Container(
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 1,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: selectedBoxIndex == 2 ? Colors.blue[100] : null,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        Icon(
                          Icons.heart_broken,
                          color: Colors.red,
                        ),
                        SizedBox(width: 8),
                        Text("Heart Attack"),
                      ],
                    ),
                  ),
                ),

                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size(150, 40),
                      padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      textStyle:
                      const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () => showDirectionWithFirstMap(),
                    child: const Text('Book Now')),
              ],
            ),
          )),
    );
  }
}