// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:dc_marvel_app/components/Progressbar.dart';
import 'package:dc_marvel_app/components/score_game.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import '../../components/Answer.dart';
import '../../components/Icon_helper.dart';

class PlayingEven extends StatefulWidget {
  PlayingEven(
      {super.key,
      required this.level,
      required this.diamond,
      required this.exp,
      required this.hightScore,
      required this.chapter,
      required this.energy});
  int level;
  int diamond;
  int exp;
  int hightScore;
  int chapter;
  int energy;
  @override
  State<PlayingEven> createState() => _PlayingEvenState();
}

class _PlayingEvenState extends State<PlayingEven> {
  TextEditingController chaptertitle = TextEditingController();
  final auth = FirebaseAuth.instance;
  final _database = FirebaseDatabase.instance.ref();
  int num = 0;
  int selectOption = 0;
  int _current = 300;
  late StreamSubscription _subscription;
  int total = 0;
  int point = 0;
  bool trueSelect = false;

  @override
  // ignore: must_call_super
  void initState() {
    if (selectOption != 0) {
      //Set time to next when user tap to the awser
      Timer(Duration(milliseconds: 500), () async {
        if (num <= (widget.chapter * 10)) {
          num++;
          if (trueSelect) {
            ++total;
          }
        }
        // _Chapter();
        selectOption = 1;
        if (num == widget.chapter * 10 + 1) {
          Score();
        }
      });
    } else {
      //fun run to screen playing now
      if (mounted) {
        super.initState();
        num = (widget.chapter - 1) * 10 + 1;
        startTimer();
        _Chapter();
      }
    }
  }

  //Get chapter in firebase
  // ignore: non_constant_identifier_names
  void _Chapter() {
    _subscription = _database
        .child('questions/$num/chapter')
        .onValue
        .listen((DatabaseEvent event) {
      final data = event.snapshot.value as dynamic;
      if (mounted) {
        setState(() {
          chaptertitle.text = 'Chapter ${data['id']}: ${data['title']} ';
        });
      }
    });
  }

//set timer
  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(
        seconds: 300,
      ),
      const Duration(seconds: 1),
    );
    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      if (mounted) {
        setState(() {
          _current = 300 - duration.elapsed.inSeconds;
          if (_current == 0) {
            Score();
          }
        });
      }
    });

    if (num == widget.chapter * 10 + 1) {
      sub.cancel();
    }
    sub.onDone(() {
      // ignore: avoid_print
      print("Done");
      sub.cancel();
    });
  }

  void Score() {
    if (_current <= 150) {
      point = total * 50;
    } else {
      total >= 5
          ? point = (total * 100 * ((_current + 5) / 300)).ceil()
          : point = (total * 50 * ((_current + 5) / 300)).ceil();
    }
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => Score_game(
            isWin: total >= 5,
            Lever: widget.level,
            exp: widget.exp,
            Score: point,
            diamond: widget.diamond,
            total: total,
            chapter: widget.chapter,
            hightscore: widget.hightScore,
            time: 300 - _current,
            quantiHammer: 5,
            quantiSpider: 5,
            quantiBat: 5,
            quantiShield: 5)));
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background_Play.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: StreamBuilder(
          stream: _database.child('questions/$num').onValue,
          builder: ((context, snapshot) {
            if (num == 0) {
              return CircularProgressIndicator();
            }
            if (snapshot.hasData && snapshot.data != null) {
              final data = Map<String, dynamic>.from(
                Map<String, dynamic>.from((snapshot.data as DatabaseEvent)
                    .snapshot
                    .value as Map<dynamic, dynamic>),
              );
              return Column(
                children: [
                  Expanded(
                    child: ProgressBar(
                      size: size,
                      timeCurrent: _current,
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/FrameQuestion.png"),
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
                                alignment: Alignment.topCenter,
                                child: Text(
                                  data['title'].toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              chaptertitle.text,
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
                          child: GestureDetector(
                            onTap: (selectOption == 5 ||
                                    selectOption == 6 ||
                                    selectOption == 7 ||
                                    selectOption == 8)
                                ? null
                                : () {
                                    setState(() {
                                      trueSelect = int.parse(data['key']) == 1;
                                      selectOption = 5;
                                    });
                                    initState();
                                  },
                            child: Container(
                              color: selectOption == 5
                                  ? int.parse(data['key']) == 1
                                      ? Color.fromARGB(255, 9, 216, 231)
                                      : Color.fromARGB(255, 255, 45, 209)
                                  : Color.fromARGB(0, 255, 45, 209),
                              child: Answer(
                                title: 'A',
                                caption: data['1'].toString(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (selectOption == 5 ||
                                    selectOption == 6 ||
                                    selectOption == 7 ||
                                    selectOption == 8)
                                ? null
                                : () {
                                    setState(() {
                                      trueSelect = int.parse(data['key']) == 2;
                                      selectOption = 6;
                                    });

                                    initState();
                                  },
                            child: Container(
                              color: selectOption == 6
                                  ? int.parse(data['key']) == 2
                                      ? Color.fromARGB(255, 9, 216, 231)
                                      : Color.fromARGB(255, 255, 45, 209)
                                  : Color.fromARGB(0, 255, 45, 209),
                              child: Answer(
                                title: 'B',
                                caption: data['2'].toString(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (selectOption == 5 ||
                                    selectOption == 6 ||
                                    selectOption == 7 ||
                                    selectOption == 8)
                                ? null
                                : () {
                                    setState(() {
                                      trueSelect = int.parse(data['key']) == 3;
                                      selectOption = 7;
                                    });

                                    initState();
                                  },
                            child: Container(
                              alignment: Alignment.center,
                              color: selectOption == 7
                                  ? int.parse(data['key']) == 3
                                      ? Color.fromARGB(255, 9, 216, 231)
                                      : Color.fromARGB(255, 255, 45, 209)
                                  : Color.fromARGB(0, 255, 45, 209),
                              child: Answer(
                                title: 'C',
                                caption: data['3'].toString(),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: GestureDetector(
                            onTap: (selectOption == 5 ||
                                    selectOption == 6 ||
                                    selectOption == 7 ||
                                    selectOption == 8)
                                ? null
                                : () {
                                    setState(() {
                                      trueSelect = int.parse(data['key']) == 4;
                                      selectOption = 8;
                                    });

                                    initState();
                                  },
                            child: Container(
                              color: selectOption == 8
                                  ? int.parse(data['key']) == 4
                                      ? Color.fromARGB(255, 9, 216, 231)
                                      : Color.fromARGB(255, 255, 45, 209)
                                  : Color.fromARGB(0, 255, 45, 209),
                              child: Answer(
                                title: 'D',
                                caption: data['4'].toString(),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/FramePlayer.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon_helper(
                              url: 'assets/images/icon_hammer.png', items: 5),
                          Icon_helper(
                              url: 'assets/images/icon_spider.png', items: 5),
                          Icon_helper(
                              url: 'assets/images/icon_bat.png', items: 5),
                          Icon_helper(
                              url: 'assets/images/icons_khien.png', items: 5),
                        ],
                      ),
                    ),
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          }),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    _subscription.cancel();

    super.deactivate();
  }
}
