import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  final _firestore = FirebaseFirestore.instance;

  String resources = "None";
  final _controllerResources = TextEditingController();

  int money = 0;
  final _controllerMoney = TextEditingController();

  bool _isLoading = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey[300],
        body: Stack(
          children: [
            Opacity(
              opacity: _isLoading ? 1.0 : 0.0,
              child: Container(
                color: Colors.grey[300],
                child: Center(
                  child: SpinKitSpinningLines(
                    color: Colors.red,
                    size: 100.0,
                  ),
                ),
              ),
            ),
            Opacity(
              opacity: _isLoading ? 0.0 : 1.0,
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Image(
                      image: AssetImage('assets/images/logo.png'),
                      height: 100,
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/map');
                      },
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
                      child: const Text('Availability of beds'),
                    ),
                    SizedBox(
                      height: 25,
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/book');
                      },
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
                      child: const Text('Book an Ambulance'),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
