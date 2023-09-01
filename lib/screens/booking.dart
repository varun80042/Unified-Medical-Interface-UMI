import 'package:map_launcher/map_launcher.dart';
import 'package:flutter/material.dart';
import 'package:hashcode/notifications/notification.dart';

void main() {
  runApp(MyMapLauncher());
}

class MyMapLauncher extends StatefulWidget {
  const MyMapLauncher({Key? key}) : super(key: key);

  @override
  State<MyMapLauncher> createState() => _MyMapLauncherState();
}

class _MyMapLauncherState extends State<MyMapLauncher> {
  @override
  void initState() {
    super.initState();

    NotificationApi.init();
  }

  int selectedBoxIndex = 3;

  void handleBoxTap(int index) {
    setState(() {
      selectedBoxIndex = index;
    });
  }

  final destination = Coords(12.8891, 77.6185);

  showDirectionWithFirstMap() async {
    final List<AvailableMap> availableMaps = await MapLauncher.installedMaps;
    await availableMaps.first.showDirections(
      destination: destination,
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
          backgroundColor: Colors.grey[300],
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
                GestureDetector(
                  onTap: () {
                    handleBoxTap(0);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          elevation: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(
                                    "Monitor the person's vital signs: If you have a blood pressure cuff or a pulse oximeter, you can monitor the person's vital signs and provide the information to the emergency medical services when they arrive."),
                                Text("\n"),
                                Text(
                                    "Don't give the person anything to eat or drink: It's important not to give the person anything to eat or drink, even if they ask for it. This can cause complications if the person requires medical procedures later on."),
                                Text("\n"),
                                Text(
                                    "Provide emotional support: A heart attack can be a very frightening experience, so it's important to provide emotional support to the person. Let them know that you are there for them and reassure them that help is on the way."),
                                Text("\n"),
                                Text(
                                    "Be prepared: It's a good idea to learn basic first aid skills, including CPR and using an AED. Keep a first aid kit handy and know the location of the nearest AED. Knowing these things can help you act quickly and potentially save a life."),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: selectedBoxIndex == 0
                          ? Colors.blue[100]
                          : Colors.white,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.heart_broken,
                          color: Colors.red,
                          size: 50,
                        ),
                        SizedBox(width: 40),
                        Text("Heart Attack"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    handleBoxTap(1);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          elevation: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(
                                    "Call for emergency medical services: Dial your country's emergency number (e.g. 911 in the United States) immediately and request an ambulance. Give the operator the location of the accident, the number of people involved, and any other relevant information."),
                                Text("\n"),
                                Text(
                                    "Assess the situation: Assess the situation to determine if it's safe to approach the accident scene. If it's not safe, wait for emergency services to arrive."),
                                Text("\n"),
                                Text(
                                    "Check for injuries: Check for injuries on the people involved in the accident. If anyone is unconscious, not breathing, or bleeding severely, provide first aid treatment as necessary."),
                                Text("\n"),
                                Text(
                                    "Provide comfort: Provide comfort to the people involved in the accident by talking to them and reassuring them that help is on the way."),
                                Text("\n"),
                                Text(
                                    "Provide CPR: If someone is not breathing, provide CPR until emergency services arrive. Chest compressions and rescue breaths can help maintain circulation and oxygenation of the body."),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: selectedBoxIndex == 1
                          ? Colors.blue[100]
                          : Colors.white,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.car_crash,
                          color: Colors.blue,
                          size: 50,
                        ),
                        SizedBox(width: 40),
                        Text("Accident"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    handleBoxTap(2);
                    showDialog(
                      context: context,
                      builder: (context) {
                        return Dialog(
                          elevation: 16,
                          child: Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Column(
                              children: [
                                Text(
                                    "Stay calm and reassure her: This is a very stressful and intense moment for the woman, so it's important to remain calm and reassure her that everything will be okay."),
                                Text("\n"),
                                Text(
                                    "Help her get into a comfortable position: The woman may want to lie down or squat, or she may feel more comfortable standing or leaning over something. Ask her what position feels best for her and help her get into that position."),
                                Text("\n"),
                                Text(
                                    "Assist with breathing techniques: Breathing techniques can help the woman stay calm and focused during the birth. Encourage her to take slow, deep breaths and remind her to exhale fully."),
                                Text("\n"),
                                Text(
                                    "Help with the delivery: If the baby is coming quickly and the ambulance has not arrived, you may need to assist with the delivery. Follow any instructions the woman gives you and encourage her to push when she feels the urge. Remember to wash your hands and wear gloves if possible."),
                                Text("\n"),
                                Text(
                                    "Keep the baby warm: Once the baby is born, wrap him or her in a warm blanket or towel to keep them warm."),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                  },
                  child: Container(
                    height: 100,
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: selectedBoxIndex == 2
                          ? Colors.blue[100]
                          : Colors.white,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.pregnant_woman,
                          color: Colors.black,
                          size: 50,
                        ),
                        SizedBox(width: 40),
                        Text("Pregnancy"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () => handleBoxTap(3),
                  child: Container(
                    height: 100,
                    width: 250,
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.grey,
                        width: 2,
                      ),
                      borderRadius: BorderRadius.circular(8),
                      color: selectedBoxIndex == 3
                          ? Colors.blue[100]
                          : Colors.white,
                    ),
                    padding: const EdgeInsets.all(12),
                    child: Row(
                      children: [
                        SizedBox(width: 10),
                        Icon(
                          Icons.question_mark,
                          color: Colors.black,
                          size: 50,
                        ),
                        SizedBox(width: 40),
                        Text("Other"),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 35,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      minimumSize: const Size(150, 40),
                      padding: const EdgeInsets.symmetric(
                          horizontal: 40, vertical: 15),
                      textStyle: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    onPressed: () async {
                      showDirectionWithFirstMap();
                      Navigator.pushNamed(context, '/details');

                      await NotificationApi.showNotification(
                          title: 'Your Ambulance has been booked!',
                          body: 'OTP: 4209');
                    },
                    child: const Text('Book Now')),
              ],
            ),
          )),
    );
  }
}
