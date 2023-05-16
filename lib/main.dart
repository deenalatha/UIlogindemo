import 'package:demo2/Splash.dart';
import 'package:flutter/material.dart';
import 'package:demo2/Splash.dart';

// import 'example.dart';

//import 'package:uiloginexample/loginscreen.dart';
// hello
// good monthhryret
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SplashScreen(),
    );
  }
}
