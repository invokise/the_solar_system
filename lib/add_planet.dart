import 'package:flutter/material.dart';
import 'dart:math' as math;

class AddPlanet extends StatefulWidget {
  final double radiusPlanet;
  final Color colorPlanet;
  final double remotnessPlanet;
  final double speedRotation;
  final AnimationController animationController;
  const AddPlanet({
    Key? key,
    required this.radiusPlanet,
    required this.colorPlanet,
    required this.remotnessPlanet,
    required this.speedRotation,
    required this.animationController,
  }) : super(key: key);

  @override
  State<AddPlanet> createState() => _AddPlanetState();
}

class _AddPlanetState extends State<AddPlanet> {
  double rotationAngle = 0;

  @override
  void initState() {
    super.initState();
    widget.animationController.addListener(() {
      setState(() {
        rotationAngle = widget.animationController.value * 2 * math.pi;
      });
    });
    widget.animationController.forward();
    widget.animationController.repeat();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: rotationAngle,
      child: Container(
        padding: EdgeInsets.all(widget.remotnessPlanet),
        decoration: BoxDecoration(
          color: widget.colorPlanet,
          shape: BoxShape.circle,
        ),
        width: widget.radiusPlanet * 2,
        height: widget.radiusPlanet * 2,
      ),
    );
  }
}
