// ignore_for_file: file_names, camel_case_types

import 'package:flutter/material.dart';

class showDialogPlayBattle extends StatefulWidget {
  const showDialogPlayBattle({
    Key? key,
  }) : super(key: key);

  @override
  State<showDialogPlayBattle> createState() => _showDialogPlayBattleState();
}

class _showDialogPlayBattleState extends State<showDialogPlayBattle> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black.withOpacity(.6),
      title: const Text('Basic dialog title'),
      content: Container(
        width: 400,
        height: 500,
        color: Colors.purple,
      ),
    );
  }
}
