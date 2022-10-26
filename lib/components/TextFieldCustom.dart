import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class TextFieldCustom extends StatefulWidget {
  const TextFieldCustom({super.key, required this.icon, required this.label});
  final IconData icon;
  final String label;

  @override
  State<TextFieldCustom> createState() => _TextFieldCustomState();
}

class _TextFieldCustomState extends State<TextFieldCustom> {
  @override
  Widget build(BuildContext context) {
    return TextField(
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        enabledBorder: const UnderlineInputBorder(
          borderSide: BorderSide(width: 2.0, color: Colors.white),
        ),
        border: const UnderlineInputBorder(),
        hintText: widget.label,
        hintStyle: const TextStyle(color: Colors.grey),
        prefixIcon: Icon(
          widget.icon,
          color: Colors.white,
        ),
        focusColor: Colors.yellow,
      ),
    );
  }
}
