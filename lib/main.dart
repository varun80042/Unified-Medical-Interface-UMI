import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

import 'package:hashcode/screens/choice.dart';
import 'package:hashcode/screens/signIN.dart';
import 'package:hashcode/screens/signUP.dart';
import 'package:hashcode/screens/home.dart';
import 'package:hashcode/screens/thanks.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(HashCode());
}

class HashCode extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/' : (context) => Choice(),
        '/login' : (context) => LoginPage(),
        '/register' : (context) => RegisterPage(),
        '/home' : (context) => HomePage(),
        '/thanks' : (context) => Thanks(),
      },
    );
  }
}