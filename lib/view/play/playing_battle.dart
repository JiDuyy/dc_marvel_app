// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'dart:math';

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
  int _activeAnswer = 0;
  int timeDown = 10;
  int _nextQuestion = 1;
  int ScoreOne = 0;
  int ScoreTwo = 0;

  final _db = FirebaseDatabase.instance.ref();
  late StreamSubscription _getRoomPlayerOne, _getRoomPlayerTwo;

  @override
  void initState() {
    super.initState();
    _getPlayerOne();
    _getPlayerTwo();
    _getNextQuestion();
  }

  void _getPlayerOne() {
    _getRoomPlayerOne =
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
    _getRoomPlayerTwo =
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

  void _getNextQuestion() {
    Timer.periodic(Duration(seconds: 1), (timer) async {
      if (timeDown != 0) {
        setState(() {
          --timeDown;
        });
      } else {
        timeDown = 10;
        final snapshotQuestion =
            await _db.child('questions/$_nextQuestion/key').get();
        final snapshot = await _db
            .child('members/${FirebaseAuth.instance.currentUser!.uid}/userName')
            .get();

        if (snapshotQuestion.value == _activeAnswer.toString()) {
          ScoreOne += 20;
          ScoreTwo += 20;
        }

        if (snapshot.value == userOne.text) {
          _db.child('rooms/${widget.roomID}/playerOne/highScore').set(ScoreOne);
        } else {
          _db.child('rooms/${widget.roomID}/playerTwo/highScore').set(ScoreTwo);
        }
        _activeAnswer = 0;
        _nextQuestion = Random().nextInt(99) + 1;
      }
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
              flex: 8,
              child: StreamBuilder(
                  stream: _db.child('questions/$_nextQuestion').onValue,
                  builder: (context, snapshot) {
                    if (snapshot.hasData && snapshot.data != null) {
                      final data = Map<String, dynamic>.from(
                        Map<String, dynamic>.from(
                            (snapshot.data as DatabaseEvent).snapshot.value
                                as Map<dynamic, dynamic>),
                      );
                      return Column(
                        children: [
                          Expanded(
                            child: Container(
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/FrameTitle.png"),
                                  fit: BoxFit.fill,
                                ),
                              ),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: 6,
                                    child: Padding(
                                      padding: EdgeInsets.all(size.width / 15),
                                      child: Align(
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                          data['title'].toString(),
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
                                          timeDown.toString(),
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
                                      data['id'].toString(),
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
                            child: Column(
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () async {
                                      setState(
                                        () {
                                          _activeAnswer = 1;
                                        },
                                      );
                                    },
                                    child: AnswerBattle(
                                      frameAnswer: _activeAnswer == 1
                                          ? "assets/images/FrameCopper.png"
                                          : "assets/images/FrameTitle.png",
                                      title: 'A',
                                      caption: data['1'].toString(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          _activeAnswer = 2;
                                        },
                                      );
                                    },
                                    child: AnswerBattle(
                                      frameAnswer: _activeAnswer == 2
                                          ? "assets/images/FrameCopper.png"
                                          : "assets/images/FrameTitle.png",
                                      title: 'B',
                                      caption: data['2'].toString(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          _activeAnswer = 3;
                                        },
                                      );
                                    },
                                    child: AnswerBattle(
                                      frameAnswer: _activeAnswer == 3
                                          ? "assets/images/FrameCopper.png"
                                          : "assets/images/FrameTitle.png",
                                      title: 'C',
                                      caption: data['3'].toString(),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(
                                        () {
                                          _activeAnswer = 4;
                                        },
                                      );
                                    },
                                    child: AnswerBattle(
                                      frameAnswer: _activeAnswer == 4
                                          ? "assets/images/FrameCopper.png"
                                          : "assets/images/FrameTitle.png",
                                      title: 'D',
                                      caption: data['4'].toString(),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    }
                    return CircularProgressIndicator();
                  }),
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
    _getRoomPlayerOne.cancel();
    _getRoomPlayerTwo.cancel();
    super.deactivate();
  }
}
