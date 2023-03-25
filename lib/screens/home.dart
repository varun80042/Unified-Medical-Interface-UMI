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
                      height: 150,
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Text(
                      "Food or Clothes (if any)",
                      style: TextStyle(
                          fontFamily: "Times New Roman",
                          fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: 320.0,
                      height: 115,
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        maxLines: 5,
                        // textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // hintText: "Enter your password",
                          // prefixIcon: Icon(Icons.lock),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black)),
                        ),
                        onChanged: (value) {
                          resources = value;
                        },
                      ),
                    ),
                    SizedBox(height: 50,),
                    Text(
                      "Money (in rupees, if any)",
                      style: TextStyle(
                        fontFamily: "Times New Roman",
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    SizedBox(height: 10,),
                    SizedBox(
                      width: 320.0,
                      height: 50,
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        // textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          // hintText: "Enter your password",
                          // prefixIcon: Icon(Icons.lock),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black)),
                        ),
                        onChanged: (value) {
                          money = int.parse(value);
                        },
                      ),
                    ),
                    SizedBox(height: 50,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.pink[400],
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
                        setState(() { _isLoading = true; });
                        _firestore.collection('resources').add({
                          'Food/Clothes' : resources,
                          'Money' : money,
                        });
                        _controllerResources.clear();
                        _controllerMoney.clear();

                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/thanks')..then((value) {
                          setState(() {
                            _isLoading = false;
                          });
                        });;
                      },
                      child: const Text('Donate Now'),
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
