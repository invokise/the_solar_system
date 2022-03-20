import 'package:flutter/material.dart';

class ChildDropDownMenuItem extends StatelessWidget {
  const ChildDropDownMenuItem(
      {required this.color, required this.text, Key? key})
      : super(key: key);
  final Color? color;
  final String text;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 100,
      height: 20,
      child: Row(
        children: [
          Container(
            height: 10,
            width: 10,
            color: color,
          ),
          const SizedBox(
            width: 5,
          ),
          Text(text),
        ],
      ),
    );
  }
}
