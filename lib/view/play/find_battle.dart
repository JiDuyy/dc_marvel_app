// ignore_for_file: use_build_context_synchronously

import 'dart:async';
import 'dart:math';

import 'package:dc_marvel_app/view/setting.dart';
import 'package:dc_marvel_app/view/test.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PlayBattle extends StatefulWidget {
  const PlayBattle({super.key});

  @override
  State<PlayBattle> createState() => PlayBattleState();
}

class PlayBattleState extends State<PlayBattle> {
  final _rank = TextEditingController();
  final _roomID = TextEditingController();
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseDatabase.instance.ref();
  late StreamSubscription _getRank, _getStart;

  @override
  void initState() {
    super.initState();
    getRank();
    _getStatus();
  }

  void getRank() {
    _getRank =
        _db.child('members/${_auth.currentUser!.uid}').onValue.listen((event) {
      final data = event.snapshot.value as dynamic;
      setState(() {
        _rank.text = data['rank'].toString();
      });
    });
  }

  void _getStatus() {
    _getStart = _db.child('battle/${_roomID.text}').onValue.listen(
      (event) {
        final data = event.snapshot.value as dynamic;
        setState(
          () {
            if (data['status'].toString() == 'true') {
              Timer(
                Duration(seconds: 2),
                () {
                  // Navigator.pop(context);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Setting()),
                  );
                },
              );
            }
            if (data['statusEnd'].toString() == 'true') {
              Navigator.pop(context);
              Timer(
                const Duration(seconds: 1),
                () {
                  _db.child('rooms/${_roomID.text}').remove();
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
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.9),
      body: SizedBox(
        // padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Stack(
                children: [
                  Container(
                    alignment: Alignment.center,
                    margin: const EdgeInsets.only(top: 10, bottom: 10),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/FrameTitle.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: const Text(
                      'Battle',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 35,
                        fontFamily: 'Horizon',
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    alignment: Alignment.topRight,
                    child: IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: const Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                margin: const EdgeInsets.all(30.0),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(_rank.text == ""
                        ? "assets/images/rank1.png"
                        : "assets/images/rank${_rank.text}.png"),
                    // fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  height: 80,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ButtonPlaynow.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () async {
                      final snapshot = await _db.child('battle').get();
                      // print(snapshot.children.length);
                      List lstRooms = [];
                      if (snapshot.children.isNotEmpty) {
                        for (int i = 0; i < snapshot.children.length; i++) {
                          final a = snapshot.children
                              .elementAt(i)
                              .child('playerTwo/userName');
                          if (a.value == "") {
                            // print(snapshot.children.elementAt(i).key.toString());
                            lstRooms.add(
                                snapshot.children.elementAt(i).key.toString());
                          }
                        }

                        // print(a.value.toString());
                        // print(a.child('playerOne/userName').value.toString());
                        // print(a.child('playerOne/userName').value.toString() ==
                        //         "JiDuy"
                        //     ? true
                        //     : false);
                      }
                      if (lstRooms.isEmpty) {
                        var RoomKey = Random().nextInt(8999) + 1000;
                        setState(() {
                          _roomID.text = RoomKey.toString();
                        });
                        final nextMember = <String, dynamic>{
                          'key': RoomKey,
                          'playerOne': {
                            'userName': "JiDuy",
                          },
                          'playerTwo': {
                            'userName': "",
                          },
                          'status': false,
                          'statusEnd': false,
                          'time': DateTime.now().millisecondsSinceEpoch,
                        };
                        _db.child('battle/$RoomKey').set(nextMember);
                      } else {
                        print(lstRooms[0]);
                        setState(() {
                          _roomID.text = lstRooms[0];
                        });
                        _db
                            .child('battle/${lstRooms[0]}/playerTwo/userName')
                            .set("hehe");
                        _db.child('battle/${lstRooms[0]}/status').set(true);
                      }
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyWidget(roomId: _roomID.text),
                        ),
                      );
                    },
                    child: const Center(
                      child: Text(
                        'PLAY',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontFamily: 'Horizon',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void deactivate() {
    _getRank.cancel();
    _getStart.cancel();
    super.deactivate();
  }
}
