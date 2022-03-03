import 'dart:math';

import 'package:flutter/material.dart';
import 'package:solar_system/add_planet.dart';

class SolarSystem extends StatefulWidget {
  const SolarSystem({Key? key}) : super(key: key);

  @override
  State<SolarSystem> createState() => _SolarSystemState();
}

class _SolarSystemState extends State<SolarSystem>
    with TickerProviderStateMixin {
  List<AddPlanet> planets = [];

  int randWithoutZero() {
    int res = Random().nextInt(10);
    while (res == 0) {
      res = Random().nextInt(10);
    }
    return res;
  }

  void addPlanet() {
    planets.add(AddPlanet(
        animationController: AnimationController(
            vsync: this, duration: Duration(seconds: randWithoutZero())),
        radiusPlanet: 30,
        colorPlanet: Colors.red,
        remotnessPlanet: 2,
        speedRotation: 1));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Planet',
        onPressed: () {
          setState(() {
            addPlanet();
          });
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Stack(
          children: [
            for (var i = 0; i < planets.length; i++)
              Positioned(
                left: 90,
                top: 200,
                child: planets[i],
              ),
            Center(
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.yellow,
                  shape: BoxShape.circle,
                ),
                width: 50,
                height: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
