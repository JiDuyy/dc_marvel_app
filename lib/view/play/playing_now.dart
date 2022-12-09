// ignore_for_file: prefer_const_constructors

import 'dart:async';
import 'package:dc_marvel_app/components/Progressbar.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import '../../components/Answer.dart';
import '../../components/Icon_helper.dart';

class PlayingGame extends StatefulWidget {
  PlayingGame({super.key});

  @override
  State<PlayingGame> createState() => _PlayingGameState();
}

class _PlayingGameState extends State<PlayingGame> {
  TextEditingController chaptertitle = TextEditingController();
  final auth = FirebaseAuth.instance;
  final _database = FirebaseDatabase.instance.ref();
  int num = 0;
  int selectOption = 0;
  int _start = 300;
  int _current = 300;
  late StreamSubscription _subscription;

  @override
  void initState() {
    if (selectOption != 0) {
      Timer(Duration(seconds: 1), () {
        setState(() {
          if (num <= 9) {
            num++;
          }
        });
        _Chapter();
        selectOption = 1;
      });
    } else {
      (setState(
        () {
          startTimer();
          num++;
        },
      ));
    }
  }

  void _Chapter() {
    _subscription = _database
        .child('questions/$num/chapter')
        .onValue
        .listen((DatabaseEvent event) {
      final data = event.snapshot.value as dynamic;
      setState(() {
        chaptertitle.text = 'Chapter ${data['id']}: ${data['title']} ';
      });
    });
  }

  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(
        seconds: _start,
      ),
      const Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
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
          stream: _database.child('questions/${num}').onValue,
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
                            onTap: () {
                              setState(() {
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
                            onTap: () {
                              setState(() {
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
                            onTap: () {
                              setState(() {
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
                            onTap: () {
                              setState(() {
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
