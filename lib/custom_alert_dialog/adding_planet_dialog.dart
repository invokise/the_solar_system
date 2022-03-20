import 'dart:math';
import 'package:flutter/material.dart';
import 'package:solar_system/custom_alert_dialog/widgets/child_drop_down_menu_item.dart';
import 'package:solar_system/custom_alert_dialog/widgets/planet.dart';

class AddingPlanetDialog extends StatefulWidget {
  const AddingPlanetDialog({Key? key, required this.planets}) : super(key: key);
  final List<PlanetWidget> planets;

  @override
  State<AddingPlanetDialog> createState() => _AddingPlanetDialogState();
}

class _AddingPlanetDialogState extends State<AddingPlanetDialog>
    with TickerProviderStateMixin {
  double _radiusPlanetValue = 0;
  double _remotenessPlanetValue = 0;
  Color? _colorPlanet = Colors.red;

  List<DropdownMenuItem<Color>> get dropdownItems {
    List<DropdownMenuItem<Color>> menuItems = const [
      DropdownMenuItem(
          child: ChildDropDownMenuItem(
            color: Colors.red,
            text: "Red",
          ),
          value: Colors.red),
      DropdownMenuItem(
          child: ChildDropDownMenuItem(
            color: Colors.blue,
            text: "Blue",
          ),
          value: Colors.blue),
      DropdownMenuItem(
          child: ChildDropDownMenuItem(
            color: Colors.amber,
            text: "Amber",
          ),
          value: Colors.amber),
      DropdownMenuItem(
          child: ChildDropDownMenuItem(
            color: Colors.black,
            text: "Black",
          ),
          value: Colors.black),
    ];
    return menuItems;
  }

  int randWithoutZero() {
    int res = Random().nextInt(10);
    while (res == 0) {
      res = Random().nextInt(10);
    }
    return res;
  }

  void addPlanet() {
    widget.planets.add(
      PlanetWidget(
        radiusPlanet: _radiusPlanetValue,
        colorPlanet: _colorPlanet,
        remotenessPlanet: _remotenessPlanetValue,
        animationController: AnimationController(
          vsync: this,
          duration: Duration(seconds: randWithoutZero()),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Center(child: Text('Add planet')),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(32.0),
        ),
      ),
      actions: [
        Center(
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                addPlanet();
                Navigator.pop(context);
              });
            },
            child: const Text("Add planet"),
          ),
        ),
      ],
      content: SizedBox(
        width: double.infinity,
        height: 320,
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Choose color planet: "),
                const SizedBox(
                  width: 10,
                ),
                Center(
                  child: DropdownButton<Color>(
                    value: _colorPlanet,
                    items: dropdownItems,
                    onChanged: (newValue) {
                      setState(() {
                        _colorPlanet = newValue;
                      });
                    },
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Choose size planet: "),
                const SizedBox(
                  width: 10,
                ),
                Slider(
                    value: _radiusPlanetValue,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    onChanged: (double newValue) {
                      setState(() => _radiusPlanetValue = newValue);
                    }),
              ],
            ),
            const SizedBox(height: 20),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text("Choose remoteness planet: "),
                const SizedBox(
                  width: 10,
                ),
                Slider(
                    value: _remotenessPlanetValue,
                    min: 0,
                    max: 100,
                    divisions: 100,
                    onChanged: (double newValue) {
                      setState(() => _remotenessPlanetValue = newValue);
                    }),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
