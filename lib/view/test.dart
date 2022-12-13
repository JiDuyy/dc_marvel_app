// ignore_for_file: non_constant_identifier_names

import 'dart:async';

import 'package:dc_marvel_app/view/play/PlayBattleLoad.dart';
import 'package:dc_marvel_app/view/setting.dart';
import 'package:dc_marvel_app/view/testScreens.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key, required this.roomId});
  final String roomId;

  @override
  State<MyWidget> createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final _db = FirebaseDatabase.instance.ref();
  final _auth = FirebaseAuth.instance;

  late StreamSubscription _getRank, _getStart;

  @override
  void initState() {
    super.initState();
    _getStatus();
  }

  void _getStatus() {
    _getStart = _db.child('battle/${widget.roomId}').onValue.listen(
      (event) {
        final data = event.snapshot.value as dynamic;
        setState(
          () {
            if (data['status'].toString() == 'true') {
              Timer(
                Duration(seconds: 3),
                () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            PlayBattleGame(roomID: widget.roomId)),
                  );
                },
              );
            }
            if (data['statusEnd'].toString() == 'true') {
              Navigator.pop(context);
              Timer(
                const Duration(seconds: 1),
                () {
                  _db.child('rooms/${widget.roomId}').remove();
                },
              );
            }
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: Center(
          child: Text('Đang tìm trận'),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    _getStart.cancel();
    super.deactivate();
  }
}
