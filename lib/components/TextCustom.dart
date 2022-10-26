import 'package:flutter/material.dart';

class TextCustom extends StatelessWidget {
  TextCustom({super.key, required this.title});
  var title;

  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
          color: Colors.white, letterSpacing: 1, fontWeight: FontWeight.w500),
    );
  }
}
