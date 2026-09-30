//Seth Baal
//ITSE-2343

import 'package:flutter/material.dart';

import 'screens/teams.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  //calls the teams page, which is the 'homepage' here
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Team Builder',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      ),
      home: Teams(),
    );
  }
}
