// ignore_for_file: non_constant_identifier_names

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _db = FirebaseDatabase.instance.ref();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: IconButton(
            onPressed: () {
              _db.child('questions').child('100').set({
                '1': "Con bươm bướm.",
                '2': "Con hổ.",
                '3': "Con dế.",
                '4': "Con cua.",
                'chapter': {
                  'id': 10,
                  'title': "Siêu cấp",
                },
                'id': 100,
                'key': '4',
                'title': 'Con gì càng to càng nhỏ vậy bạn?'
              });
            },
            icon: const Icon(Icons.add),
            iconSize: 300,
          ),
        ),
      ),
    );
  }
}
