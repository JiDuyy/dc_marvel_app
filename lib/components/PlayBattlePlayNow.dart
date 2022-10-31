import 'package:flutter/material.dart';

class showDialogPlayBattleNow extends StatefulWidget {
  const showDialogPlayBattleNow({
    Key? key,
  }) : super(key: key);

  @override
  State<showDialogPlayBattleNow> createState() =>
      _showDialogPlayBattleNowState();
}

class _showDialogPlayBattleNowState extends State<showDialogPlayBattleNow> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black.withOpacity(.6),
      title: const Text('Basic dialog title'),
      content: Container(
        width: 400,
        height: 500,
        color: Colors.yellow,
      ),
    );
  }
}
