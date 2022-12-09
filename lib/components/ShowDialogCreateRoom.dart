// ignore_for_file: prefer_const_constructors, no_leading_underscores_for_local_identifiers
import 'dart:async';

import 'package:dc_marvel_app/components/DropDownChooseGameMode.dart';
import 'package:dc_marvel_app/components/DropDownSelectDiamond.dart';
import 'package:dc_marvel_app/view/play/playing_battle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'ButtonBack.dart';
import 'PlayerRoom.dart';

class ShowDialogCreateRoom extends StatefulWidget {
  const ShowDialogCreateRoom({super.key, required this.roomId});
  final String roomId;

  @override
  State<ShowDialogCreateRoom> createState() => _ShowDialogCreateRoomState();
}

class _ShowDialogCreateRoomState extends State<ShowDialogCreateRoom> {
  TextEditingController userTwo = TextEditingController();
  TextEditingController userOne = TextEditingController();
  TextEditingController status = TextEditingController();
  TextEditingController frameRankUserOne = TextEditingController();
  TextEditingController frameRankUserTwo = TextEditingController();

  final auth = FirebaseAuth.instance;
  final _database = FirebaseDatabase.instance.ref();
  late StreamSubscription _subscription;
  late StreamSubscription _getRoom;
  late StreamSubscription _getStart;

  @override
  void initState() {
    super.initState();
    _getPlayerTwo();
    _getPlayerOne();
    _getStatus();
  }

  void _getPlayerTwo() {
    _subscription = _database
        .child('rooms/${widget.roomId}/playerTwo')
        .onValue
        .listen((event) {
      final data = event.snapshot.value as dynamic;
      setState(() {
        userTwo.text = data['userName'].toString();
        frameRankUserTwo.text = data['rank'].toString();
      });
    });
  }

  void _getPlayerOne() {
    _getRoom = _database
        .child('rooms/${widget.roomId}/playerOne')
        .onValue
        .listen((event) {
      final data = event.snapshot.value as dynamic;
      setState(() {
        userOne.text = data['userName'].toString();
        frameRankUserOne.text = data['rank'].toString();
      });
    });
  }

  void _getStatus() {
    _getStart = _database.child('rooms/${widget.roomId}/status').onValue.listen(
      (event) {
        final String status = event.snapshot.value.toString();
        setState(
          () {
            // status.text = statu;
            if (status == 'true') {
              Timer(
                Duration(seconds: 3),
                () {
                  Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => PlayingBattle(),
                    ),
                  );
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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.8),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                width: size.width / 1.5,
                alignment: Alignment.center,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/BgProfileBetween.png"),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'CREATE ROOM',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      'ID: ${widget.roomId}',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Column(
                    children: [
                      PlayerRoom(
                        pathFrameRank: frameRankUserOne.text,
                        size: size,
                        path: 'assets/images/Avatar.jpg',
                      ),
                      Text(
                        userOne.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                  Align(
                    alignment: Alignment.topCenter,
                    child: Container(
                      width: 100,
                      height: 100,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/vsbattle.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                  Column(
                    children: [
                      PlayerRoom(
                        size: size,
                        path: 'assets/images/Avatar.jpg',
                        pathFrameRank: frameRankUserTwo.text,
                      ),
                      Text(
                        userTwo.text,
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 24,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 1,
              child: SizedBox(
                width: size.width,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    DropDownSelectDiamond(),
                    DropDownChooseGameMode(),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: InkWell(
                onTap: () {
                  _database.child('rooms/${widget.roomId}/status').set(true);
                },
                child: Container(
                  width: MediaQuery.of(context).size.width / 1.5,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ButonSetting.png'),
                    ),
                  ),
                  child: Center(
                    child: Text(
                      'PLAY NOW',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                        letterSpacing: 2.0,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 1,
              child: ButtonBack(
                roomId: widget.roomId,
                size: size,
                marginTop: 200,
                marginLeft: 50,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    _subscription.cancel();
    _getRoom.cancel();
    _getStart.cancel();
    super.deactivate();
  }
}
