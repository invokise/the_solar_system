import 'package:flutter/material.dart';
import 'package:solar_system/custom_alert_dialog/widgets/planet.dart';
import 'package:solar_system/solar_system.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    List<PlanetWidget> planets = [];

    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: SolarSystem(
        planets: planets,
      ),
    );
  }
}
