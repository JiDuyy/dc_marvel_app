import 'dart:async';

import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class ButtonBack extends StatefulWidget {
  const ButtonBack({
    Key? key,
    required this.size,
    required this.marginTop,
    required this.marginLeft,
    required this.roomId,
  }) : super(key: key);

  final Size size;
  final double marginTop;
  final double marginLeft;
  final String roomId;

  @override
  State<ButtonBack> createState() => _ButtonBackState();
}

class _ButtonBackState extends State<ButtonBack> {
  final _db = FirebaseDatabase.instance.ref('rooms');

  late StreamSubscription _getStart;
  @override
  void initState() {
    super.initState();
    _getStatus();
  }

  void _getStatus() {
    _getStart = _db.child('${widget.roomId}/statusEnd').onValue.listen(
      (event) {
        final String status = event.snapshot.value.toString();
        setState(
          () {
            // status.text = statu;
            if (status == 'true') {
              Navigator.pop(context);
              Timer(
                const Duration(seconds: 2),
                () {
                  _db.child(widget.roomId).remove();
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
    return Align(
      alignment: Alignment.topLeft,
      child: Container(
        margin: EdgeInsets.only(
            top: widget.size.height / widget.marginTop,
            left: widget.size.width / widget.marginLeft),
        height: 60,
        width: 60,
        child: InkWell(
          onTap: () {
            _db.child('${widget.roomId}/statusEnd').set(true);
          },
          child: Container(
            height: double.infinity,
            width: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/ButtonBack.png'),
                // fit: BoxFit.cover,
              ),
            ),
          ),
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
