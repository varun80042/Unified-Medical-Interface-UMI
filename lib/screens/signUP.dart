import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {

  final _auth = FirebaseAuth.instance;

  String fullName = "";
  late int phone;
  String city = "";
  String email = "";
  String password = "";

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
                      height: 30,
                    ),
                    SizedBox(
                      width: 320.0,
                      height: 50,
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter your full name",
                          prefixIcon: Icon(Icons.account_circle),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black)),
                        ),
                        onChanged: (value) {
                          fullName = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      width: 320.0,
                      height: 50,
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.phone,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter your phone number",
                          prefixIcon: Icon(Icons.phone),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black)),
                        ),
                        onChanged: (value) {
                          phone = int.parse(value);
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      width: 320.0,
                      height: 50,
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter your address",
                          prefixIcon: Icon(Icons.location_city),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black)),
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      width: 320.0,
                      height: 50,
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        keyboardType: TextInputType.emailAddress,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter your email",
                          prefixIcon: Icon(Icons.email),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black)),
                        ),
                        onChanged: (value) {
                          email = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 12.0,
                    ),
                    SizedBox(
                      width: 320.0,
                      height: 50,
                      child: TextField(
                        style: const TextStyle(color: Colors.black),
                        obscureText: true,
                        textAlign: TextAlign.center,
                        decoration: const InputDecoration(
                          filled: true,
                          fillColor: Colors.white,
                          hintText: "Enter your password",
                          prefixIcon: Icon(Icons.lock),
                          contentPadding:
                          EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
                          border: OutlineInputBorder(
                              borderSide: BorderSide(width: 3, color: Colors.black)),
                        ),
                        onChanged: (value) {
                          password = value;
                        },
                      ),
                    ),
                    const SizedBox(
                      height: 40.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minimumSize: const Size(150, 40),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () async {
                        try {
                          setState(() { _isLoading = true; });
                          final user = await _auth.createUserWithEmailAndPassword(email: email, password: password);
                          if (user != null) {
                            Navigator.pop(context);
                            Navigator.pushNamed(context, '/login');
                            setState(() {
                              _isLoading = false;
                            });
                          }

                        }
                        catch (e) {
                          print(e);
                          setState(() { _isLoading = false; });
                        }
                      },
                      child: const Text('Sign Up'),
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(50),
                        ),
                        minimumSize: const Size(150, 40),
                        padding:
                        const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        textStyle: const TextStyle(
                            fontSize: 20, fontWeight: FontWeight.bold),
                      ),
                      onPressed: () {
                        Navigator.pop(context);
                        Navigator.pushNamed(context, '/login');
                      },
                      child: const Text('Sign In'),
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
