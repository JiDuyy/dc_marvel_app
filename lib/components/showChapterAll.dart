import 'dart:async';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../view/play/playing_now.dart';
import 'ChapterImage.dart';

class ShowChapterAll extends StatefulWidget {
  const ShowChapterAll({super.key});

  @override
  State<ShowChapterAll> createState() => _ShowChapterAllState();
}

class _ShowChapterAllState extends State<ShowChapterAll> {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseDatabase.instance.ref();
  late StreamSubscription _useLevel;
  int level = 1;
  int hightScore = 0;
  int chapter = 1;
  int exp = 0;
  int diamond = 0;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _userLevel();
  }

  //Get lever user
  void _userLevel() {
    _useLevel =
        _db.child('members/${_auth.currentUser!.uid}').onValue.listen((event) {
      final data = event.snapshot.value as dynamic;
      if (mounted) {
        setState(() {
          level = data['level'];
          hightScore = data['highScore'];
          chapter = data['chapter'];
          exp = data['exp'];
          diamond = data['diamond'];
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.9),
      body: InkWell(
        onTap: () => Navigator.pop(context),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/FrameTitle.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'ALL CHAPTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    GestureDetector(
                      onDoubleTap: () {
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) =>
                                PlayingGame(
                                    level: level,
                                    exp: exp,
                                    hightScore: hightScore,
                                    chapter: 1,
                                    diamond: diamond),
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(
                            bottom: MediaQuery.of(context).size.height / 7),
                        child: const ChapterImage(
                          path: 'assets/images/Chapter1.png',
                        ),
                      ),
                    ),
                    ItemChappter(
                      chapter: chapter,
                      level: level,
                      exp: exp,
                      hightScore: hightScore,
                      diamond: diamond,
                      numberChappter: 2,
                      path: 'assets/images/Chapter2.png',
                    ),
                    ItemChappter(
                      chapter: chapter,
                      level: level,
                      exp: exp,
                      hightScore: hightScore,
                      diamond: diamond,
                      numberChappter: 3,
                      path: 'assets/images/Chapter3.png',
                    ),
                    ItemChappter(
                      chapter: chapter,
                      level: level,
                      exp: exp,
                      hightScore: hightScore,
                      diamond: diamond,
                      numberChappter: 4,
                      path: 'assets/images/Chapter4.png',
                    ),
                    ItemChappter(
                      chapter: chapter,
                      level: level,
                      exp: exp,
                      hightScore: hightScore,
                      diamond: diamond,
                      numberChappter: 5,
                      path: 'assets/images/Chapter5.png',
                    ),
                    ItemChappter(
                      chapter: chapter,
                      level: level,
                      exp: exp,
                      hightScore: hightScore,
                      diamond: diamond,
                      numberChappter: 6,
                      path: 'assets/images/Chapter6.png',
                    ),
                    ItemChappter(
                      chapter: chapter,
                      level: level,
                      exp: exp,
                      hightScore: hightScore,
                      diamond: diamond,
                      numberChappter: 7,
                      path: 'assets/images/Chapter7.png',
                    ),
                    ItemChappter(
                      chapter: chapter,
                      level: level,
                      exp: exp,
                      hightScore: hightScore,
                      diamond: diamond,
                      numberChappter: 8,
                      path: 'assets/images/Chapter8.png',
                    ),
                    ItemChappter(
                      chapter: chapter,
                      level: level,
                      exp: exp,
                      hightScore: hightScore,
                      diamond: diamond,
                      numberChappter: 9,
                      path: 'assets/images/Chapter9.png',
                    ),
                    ItemChappter(
                      chapter: chapter,
                      level: level,
                      exp: exp,
                      hightScore: hightScore,
                      diamond: diamond,
                      numberChappter: 10,
                      path: 'assets/images/Chapter10.png',
                    ),
                    Container(
                      alignment: Alignment.topRight,
                      padding: EdgeInsets.only(
                          top: MediaQuery.of(context).size.width / 2),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/tubecontinue.gif'),
                          fit: BoxFit.fill,
                        ),
                      ),
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      child: WidgetAnimator(
                        incomingEffect:
                            WidgetTransitionEffects.incomingSlideInFromLeft(),
                        atRestEffect: WidgetRestingEffects.wave(),
                        child: const Text(
                          'To be continue...',
                          style: TextStyle(
                              fontFamily: 'Horizon',
                              fontSize: 25,
                              fontWeight: FontWeight.bold,
                              color: Colors.cyan),
                        ),
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
