import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _db = FirebaseDatabase.instance.ref().child('members');
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: FirebaseAnimatedList(
          query: _db,
          itemBuilder: (context, snapshot, animation, index) {
            return ListTile(
              subtitle: Text(snapshot.child('userName').value.toString()),
              title: Text(snapshot.child('userID').value.toString()),
            );
          },
        ),
      ),
    );
  }
}
