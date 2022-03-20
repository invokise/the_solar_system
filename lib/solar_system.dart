import 'package:flutter/material.dart';
import 'package:solar_system/custom_alert_dialog/adding_planet_dialog.dart';
import 'package:solar_system/custom_alert_dialog/widgets/planet.dart';

class SolarSystem extends StatefulWidget {
  const SolarSystem({Key? key, required this.planets}) : super(key: key);
  final List<PlanetWidget> planets;
  @override
  State<SolarSystem> createState() => _SolarSystemState();
}

class _SolarSystemState extends State<SolarSystem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        tooltip: 'Add Planet',
        onPressed: () {
          showDialog(
              context: context,
              builder: (context) {
                return AddingPlanetDialog(planets: widget.planets);
              });
        },
        child: const Icon(Icons.add),
      ),
      body: Center(
        child: Stack(
          children: [
            for (var i = 0; i < widget.planets.length; i++)
              Center(
                child: widget.planets[i],
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
