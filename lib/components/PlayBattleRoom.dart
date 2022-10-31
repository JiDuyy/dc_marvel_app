import 'package:flutter/material.dart';

class showDialogPlayBattleRoom extends StatefulWidget {
  const showDialogPlayBattleRoom({
    Key? key,
  }) : super(key: key);

  @override
  State<showDialogPlayBattleRoom> createState() => _showDialogPlayBattleRoomState();
}

class _showDialogPlayBattleRoomState extends State<showDialogPlayBattleRoom> {
  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: Colors.black.withOpacity(.6),
      title: const Text('Basic dialog title'),
      content: Container(
        width: 400,
        height: 500,
        color: Colors.blue,
      ),
    );
  }
}
