// ignore_for_file: prefer_const_constructors

import 'dart:async';

import 'package:dc_marvel_app/components/AnswerBattle.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

class PlayingBattle extends StatefulWidget {
  const PlayingBattle({super.key, required this.roomID});
  final String roomID;

  @override
  State<PlayingBattle> createState() => _PlayingBattleState();
}

class _PlayingBattleState extends State<PlayingBattle> {
  TextEditingController userTwo = TextEditingController();
  TextEditingController userOne = TextEditingController();
  TextEditingController frameRankUserOne = TextEditingController();
  TextEditingController frameRankUserTwo = TextEditingController();
  TextEditingController userImageOne = TextEditingController();
  TextEditingController userImageTwo = TextEditingController();
  TextEditingController highScoreOne = TextEditingController();
  TextEditingController highScoreTwo = TextEditingController();
  bool isCheck1 = false;
  bool isCheck2 = false;
  bool isCheck3 = false;
  bool isCheck4 = false;
  int ScoreOne = 0;
  int ScoreTwo = 0;

  final _db = FirebaseDatabase.instance.ref();
  late StreamSubscription _subscription;
  late StreamSubscription _getRoom;

  @override
  void initState() {
    super.initState();
    _getPlayerOne();
    _getPlayerTwo();
  }

  void _getPlayerOne() {
    _getRoom =
        _db.child('rooms/${widget.roomID}/playerOne').onValue.listen((event) {
      final data = event.snapshot.value as dynamic;
      setState(() {
        userOne.text = data['userName'].toString();
        userImageOne.text = data['image'].toString();
        frameRankUserOne.text = data['rank'].toString();
        highScoreOne.text = data['highScore'].toString();
      });
    });
  }

  void _getPlayerTwo() {
    _subscription =
        _db.child('rooms/${widget.roomID}/playerTwo').onValue.listen((event) {
      final data = event.snapshot.value as dynamic;
      setState(() {
        userTwo.text = data['userName'].toString();
        userImageTwo.text = data['image'].toString();
        frameRankUserTwo.text = data['rank'].toString();
        highScoreTwo.text = data['highScore'].toString();
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background_Play.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/FrameTitle.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                // padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Center(
                                child: Image.asset(
                                  userImageOne.text == ""
                                      ? 'assets/images/iconAddfriend.png'
                                      : 'assets/images/AvatarChibi${userImageOne.text}.jpg',
                                  height: 66,
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  frameRankUserOne.text.isEmpty
                                      ? "assets/images/FrameRank1.png"
                                      : "assets/images/FrameRank${frameRankUserOne.text}.png",
                                  height: 100,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            highScoreOne.text,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/vsbattle.png"),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Center(
                                child: Image.asset(
                                  userImageTwo.text == ""
                                      ? 'assets/images/iconAddfriend.png'
                                      : 'assets/images/AvatarChibi${userImageOne.text}.jpg',
                                  height: 66,
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  frameRankUserTwo.text.isEmpty
                                      ? "assets/images/FrameRank1.png"
                                      : "assets/images/FrameRank${frameRankUserTwo.text}.png",
                                  height: 100,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            highScoreTwo.text,
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/FrameTitle.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.all(size.width / 15),
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Mình tự đánh mình, mình cảm thấy đâu là mình mạnh hay mình yếu?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '30',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Chương 1: Vũ trụ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () async {
                        setState(
                          () {
                            isCheck1 = true;
                            isCheck2 = false;
                            isCheck3 = false;
                            isCheck4 = false;
                            ScoreOne += 20;
                            ScoreTwo += 20;
                          },
                        );
                        final snapshot = await _db
                            .child(
                                'members/${FirebaseAuth.instance.currentUser!.uid}/userName')
                            .get();
                        if (snapshot.value == userOne.text) {
                          _db
                              .child(
                                  'rooms/${widget.roomID}/playerOne/highScore')
                              .set(ScoreOne);
                        } else {
                          _db
                              .child(
                                  'rooms/${widget.roomID}/playerTwo/highScore')
                              .set(ScoreTwo);
                        }
                      },
                      child: AnswerBattle(
                        frameAnswer: !isCheck1
                            ? "assets/images/FrameTitle.png"
                            : "assets/images/FrameCopper.png",
                        title: 'A',
                        caption: 'Lú cái đầu',
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            isCheck1 = false;
                            isCheck2 = true;
                            isCheck3 = false;
                            isCheck4 = false;
                          },
                        );
                      },
                      child: AnswerBattle(
                        frameAnswer: !isCheck2
                            ? "assets/images/FrameTitle.png"
                            : "assets/images/FrameCopper.png",
                        title: 'B',
                        caption: 'Lú cái đầu',
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            isCheck1 = false;
                            isCheck2 = false;
                            isCheck3 = true;
                            isCheck4 = false;
                          },
                        );
                      },
                      child: AnswerBattle(
                        frameAnswer: !isCheck3
                            ? "assets/images/FrameTitle.png"
                            : "assets/images/FrameCopper.png",
                        title: 'C',
                        caption: 'Lú cái đầu',
                      ),
                    ),
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        setState(
                          () {
                            isCheck1 = false;
                            isCheck2 = false;
                            isCheck3 = false;
                            isCheck4 = true;
                          },
                        );
                      },
                      child: AnswerBattle(
                        frameAnswer: !isCheck4
                            ? "assets/images/FrameTitle.png"
                            : "assets/images/FrameCopper.png",
                        title: 'D',
                        caption: 'Lú cái đầu',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(
              flex: 1,
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
    super.deactivate();
  }
}
