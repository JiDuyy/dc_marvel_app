// ignore_for_file: prefer_const_constructors
import 'dart:async';
import 'dart:math';
import 'package:dc_marvel_app/components/score_game.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import '../../components/Answer.dart';
import '../../components/Icon_helper.dart';
import '../../components/ShowDialogSettingPlayGame.dart';

class PlayingGame extends StatefulWidget {
  PlayingGame(
      {super.key,
      required this.level,
      required this.diamond,
      required this.exp,
      required this.hightScore,
      required this.chapter});
  int level;
  int diamond;
  int exp;
  int hightScore;
  int chapter;
  @override
  State<PlayingGame> createState() => _PlayingGameState();
}

class _PlayingGameState extends State<PlayingGame> {
  TextEditingController chaptertitle = TextEditingController();
  final auth = FirebaseAuth.instance;
  final _database = FirebaseDatabase.instance.ref();
  int num = 0,
      selectOption = 0,
      _current = 240,
      _timerStart = 240,
      total = 0,
      point = 0,
      count = 0,
      countHelp = 0;
  late StreamSubscription _subscription;
  bool trueSelect = false, pause = false;
  late StreamSubscription sub;
  Set<int> setOfInts = {}, setHelp = {};

  @override
  // ignore: must_call_super
  void initState() {
    if (selectOption != 0) {
      //Set time to next when user tap to the awser
      Timer(Duration(milliseconds: 500), () async {
        if (num < widget.chapter * 10) {
          num++;
        }
        if (trueSelect) ++total;
        count++;
        // _Chapter();
        selectOption = 1;
        if (num == widget.chapter * 10 && count == 10) Score();
      });

      //Reset SetHelp
      if (setHelp.isNotEmpty) setHelp.clear();
    } else {
      //fun run to screen playing now
      if (mounted) {
        super.initState();
        for (int i = 0; setOfInts.length < 4; i++) {
          setOfInts.add(Random().nextInt(4) + 1);
        }

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
        seconds: 240,
      ),
      const Duration(seconds: 1),
    );
    sub = countDownTimer.listen(null);
    sub.onData((duration) {
      if (mounted) {
        setState(() {
          _current =
              int.parse((_timerStart - duration.elapsed.inSeconds).toString());
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
          ? point = (total * 100 * ((_current + 5) / 240)).ceil()
          : point = (total * 50 * ((_current + 5) / 240)).ceil();
    }
    Navigator.of(context).pop();
    Navigator.of(context).push(MaterialPageRoute(
        builder: (BuildContext context) => Score_game(
            isWin: total >= 7,
            Lever: widget.level,
            exp: widget.exp,
            Score: point,
            diamond: widget.diamond,
            total: total,
            chapter: widget.chapter,
            hightscore: widget.hightScore,
            time: 240 - _current,
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
                    child: Row(
                      children: [
                        Expanded(
                            flex: 5,
                            child: Container(
                              width: double.infinity,
                              height: MediaQuery.of(context).size.width / 14,
                              decoration: BoxDecoration(
                                border: Border.all(
                                    color:
                                        const Color.fromARGB(255, 19, 19, 19),
                                    width: 3),
                                borderRadius: BorderRadius.circular(30),
                              ),
                              child: Stack(children: [
                                LayoutBuilder(
                                  builder: (context, constraints) => Container(
                                    width:
                                        constraints.maxWidth * (_current / 240),
                                    decoration: BoxDecoration(
                                        gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            // ignore: prefer_const_literals_to_create_immutables
                                            colors: [
                                              Color.fromARGB(255, 183, 0, 255),
                                              Color.fromARGB(255, 21, 228, 255)
                                            ]),
                                        borderRadius:
                                            BorderRadius.circular(30)),
                                  ),
                                ),
                                Positioned.fill(
                                    child: Row(
                                  children: [
                                    const SizedBox(
                                      width: 5,
                                    ),
                                    Text(
                                      "${_current.toString()} sec",
                                      style: const TextStyle(
                                        fontWeight: FontWeight.w700,
                                        color: Colors.white,
                                      ),
                                    )
                                  ],
                                ))
                              ]),
                            )),
                        Expanded(
                          child: InkWell(
                            onTap: () async {
                              setState(() {
                                pause = true;
                                _timerStart = _current;
                              });
                              if (pause) {
                                sub.pause();
                              }
                              pause = await Navigator.of(context).push(
                                        PageRouteBuilder(
                                          opaque: false,
                                          pageBuilder:
                                              (BuildContext context, _, __) =>
                                                  ShowDialogSettingPlayGame(),
                                        ),
                                      ) ==
                                      null
                                  ? pause = true
                                  : pause = false;

                              if (!pause) {
                                sub.cancel();
                                sub.resume();
                                startTimer();
                              }
                            },
                            child: Container(
                              width: size.width / 10,
                              height: size.width / 10,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image: AssetImage(
                                      "assets/images/icon_setting.png"),
                                  // fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
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
                                      trueSelect = int.parse(data['key']) ==
                                          setOfInts.elementAt(0);
                                      selectOption = 5;
                                    });
                                    initState();
                                  },
                            child: Container(
                              color: setHelp.isNotEmpty &&
                                      setHelp.contains(setOfInts.elementAt(0))
                                  ? Color.fromARGB(255, 255, 45, 209)
                                  : selectOption == 5
                                      ? int.parse(data['key']) ==
                                              setOfInts.elementAt(0)
                                          ? Color.fromARGB(255, 9, 216, 231)
                                          : Color.fromARGB(255, 255, 45, 209)
                                      : Color.fromARGB(0, 255, 45, 209),
                              child: Answer(
                                title: 'A',
                                caption: data['${setOfInts.elementAt(0)}']
                                    .toString(),
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
                                      trueSelect = int.parse(data['key']) ==
                                          setOfInts.elementAt(1);
                                      selectOption = 6;
                                    });

                                    initState();
                                  },
                            child: Container(
                              color: setHelp.isNotEmpty &&
                                      setHelp.contains(setOfInts.elementAt(1))
                                  ? Color.fromARGB(255, 255, 45, 209)
                                  : selectOption == 6
                                      ? int.parse(data['key']) ==
                                              setOfInts.elementAt(1)
                                          ? Color.fromARGB(255, 9, 216, 231)
                                          : Color.fromARGB(255, 255, 45, 209)
                                      : Color.fromARGB(0, 255, 45, 209),
                              child: Answer(
                                title: 'B',
                                caption: data['${setOfInts.elementAt(1)}']
                                    .toString(),
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
                                      trueSelect = int.parse(data['key']) ==
                                          setOfInts.elementAt(2);
                                      selectOption = 7;
                                    });

                                    initState();
                                  },
                            child: Container(
                              alignment: Alignment.center,
                              color: setHelp.isNotEmpty &&
                                      setHelp.contains(setOfInts.elementAt(2))
                                  ? Color.fromARGB(255, 255, 45, 209)
                                  : selectOption == 7
                                      ? int.parse(data['key']) ==
                                              setOfInts.elementAt(2)
                                          ? Color.fromARGB(255, 9, 216, 231)
                                          : Color.fromARGB(255, 255, 45, 209)
                                      : Color.fromARGB(0, 255, 45, 209),
                              child: Answer(
                                title: 'C',
                                caption: data['${setOfInts.elementAt(2)}']
                                    .toString(),
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
                                      trueSelect = int.parse(data['key']) ==
                                          setOfInts.elementAt(3);
                                      selectOption = 8;
                                    });

                                    initState();
                                  },
                            child: Container(
                              color: setHelp.isNotEmpty &&
                                      setHelp.contains(setOfInts.elementAt(3))
                                  ? Color.fromARGB(255, 255, 45, 209)
                                  : selectOption == 8
                                      ? int.parse(data['key']) ==
                                              setOfInts.elementAt(3)
                                          ? Color.fromARGB(255, 9, 216, 231)
                                          : Color.fromARGB(255, 255, 45, 209)
                                      : Color.fromARGB(0, 255, 45, 209),
                              child: Answer(
                                title: 'D',
                                caption: data['${setOfInts.elementAt(3)}']
                                    .toString(),
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
                          InkWell(
                            onTap: countHelp >= 4
                                ? null
                                : () async {
                                    countHelp++;
                                    if (_current <= 120) {
                                      setState(() {
                                        pause = true;
                                        _timerStart = _current + 6;
                                      });
                                      sub.cancel();
                                      startTimer();
                                    }
                                  },
                            child: Icon_helper(
                                url: 'assets/images/icon_hammer.png', items: 5),
                          ),
                          InkWell(
                            onTap: countHelp >= 4
                                ? null
                                : () {
                                    countHelp++;
                                    if (setHelp.isNotEmpty) setHelp.clear();
                                    setState(() {
                                      for (int i = 0; setHelp.length < 2; i++) {
                                        var rd = Random().nextInt(3) + 1;
                                        if (setOfInts.elementAt(rd) !=
                                            int.parse(data['key'])) {
                                          setHelp.add(setOfInts.elementAt(rd));
                                        }
                                      }
                                    });
                                  },
                            child: Icon_helper(
                                url: 'assets/images/icon_spider.png', items: 5),
                          ),
                          InkWell(
                            onTap: countHelp >= 4
                                ? null
                                : (() {
                                    countHelp++;
                                    setState(() {
                                      Timer(Duration(milliseconds: 500),
                                          () async {
                                        if (num < widget.chapter * 10) {
                                          ++num;
                                        }
                                        ++total;
                                        count++;

                                        if (num == widget.chapter * 10 &&
                                            count == 10) {
                                          Score();
                                        }
                                      });
                                    });
                                  }),
                            child: Icon_helper(
                                url: 'assets/images/icon_bat.png', items: 5),
                          ),
                          InkWell(
                            onTap: countHelp >= 4
                                ? null
                                : () async {
                                    countHelp++;

                                    setState(() {
                                      pause = true;
                                      _timerStart = _current;
                                    });
                                    if (pause) {
                                      sub.pause();
                                    }
                                    Timer(Duration(seconds: 10), () async {
                                      pause = false;
                                      if (!pause) {
                                        sub.cancel();
                                        sub.resume();
                                        startTimer();
                                      }
                                    });
                                  },
                            child: Icon_helper(
                                url: 'assets/images/icons_khien.png', items: 5),
                          ),
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
