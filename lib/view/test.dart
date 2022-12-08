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
              _db.child('questions').child('5').set({
                '1': "bảo toàn năng lượng.",
                '2': "bảo toàn khối lượng.",
                '3': "bảo toàn momen động lượng.",
                '4': "bảo toàn động lượng.",
                'chapter': {
                  'id': 1,
                  'title': "Vũ trụ",
                },
                'id': 5,
                'key': '3',
                'title':
                    ' Việc các hành tinh quay xung quanh Mặt Trời theo cùng một chiều được giải thích là hệ quả của định luật'
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
