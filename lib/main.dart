import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:hashcode/screens/choice.dart';
import 'package:hashcode/screens/signIN.dart';
import 'package:hashcode/screens/signUP.dart';
import 'package:hashcode/screens/home.dart';
import 'package:hashcode/screens/map.dart';
import 'package:hashcode/screens/booking.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(DotSlash());
}

class DotSlash extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/home',
      routes: {
        '/' : (context) => Choice(),
        '/login' : (context) => LoginPage(),
        '/register' : (context) => RegisterPage(),
        '/home' : (context) => HomePage(),
        '/map' : (context) => MapPage(),
        '/book' : (context) => MyMapLauncher(),
      },
    );
  }
}