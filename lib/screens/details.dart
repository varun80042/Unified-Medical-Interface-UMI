import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class AmbulanceDetailsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      appBar: AppBar(
        toolbarHeight: 80,
        backgroundColor: Colors.red,
        centerTitle: true,
        title: Text('Ambulance details'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                'Your Ambulance Is On The Way',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 50,
              ),
              const Image(
                image: AssetImage('assets/images/logo.png'),
                height: 100,
              ),
              const SizedBox(
                height: 60,
              ),
              Text(
                'Ambulance Number',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'KA.01.AH.3985',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'OTP',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                '4209',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 20),
              Text(
                'Driver Name',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 8),
              Text(
                'Ravi Kumar',
                style: TextStyle(fontSize: 16),
              ),
              SizedBox(height: 25),
              Center(
                child: ElevatedButton(
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
                  onPressed: () => launch('tel:9398097292'),
                  child: Text('Call Driver'),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
