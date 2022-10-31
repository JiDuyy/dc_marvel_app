import 'package:flutter/material.dart';

Future<void> PlayBattleRoom(BuildContext context) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.black.withOpacity(.6),
        title: const Text('Basic dialog title'),
        content: Container(
          width: 400,
          height: 500,
          color: Colors.red,
        ),
      );
    },
  );
}
