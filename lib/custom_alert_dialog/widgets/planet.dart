import 'package:flutter/material.dart';

class PlanetWidget extends StatefulWidget {
  final double radiusPlanet;
  final Color? colorPlanet;
  final double remotenessPlanet;

  final AnimationController animationController;
  const PlanetWidget({
    Key? key,
    required this.radiusPlanet,
    required this.colorPlanet,
    required this.remotenessPlanet,
    required this.animationController,
  }) : super(key: key);

  @override
  State<PlanetWidget> createState() => _AddPlanetState();
}

class _AddPlanetState extends State<PlanetWidget> {
  double _rotationAngle = 0;

  @override
  void initState() {
    super.initState();
    widget.animationController.addListener(() {
      setState(() {
        _rotationAngle = widget.animationController.value * 2 * 3.14;
      });
    });
    widget.animationController.repeat();
  }

  @override
  void dispose() {
    widget.animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Transform.rotate(
      angle: _rotationAngle,
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.transparent,
          shape: BoxShape.circle,
        ),
        width: widget.remotenessPlanet * 10,
        height: widget.remotenessPlanet * 10,
        alignment: Alignment.topLeft,
        child: Container(
          height: widget.radiusPlanet * 2,
          width: widget.radiusPlanet * 2,
          decoration: BoxDecoration(
            color: widget.colorPlanet,
            shape: BoxShape.circle,
          ),
        ),
      ),
    );
  }
}
