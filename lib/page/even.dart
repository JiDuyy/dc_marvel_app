import 'package:flutter/material.dart';

class Even extends StatefulWidget {
  const Even({super.key});

  @override
  State<Even> createState() => _EvenState();
}

class _EvenState extends State<Even> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 200,
      height: 200,
      color: Colors.red,
      child: const Text('Even'),
    );
  }
}
