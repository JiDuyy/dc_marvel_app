// ignore_for_file: avoid_print, use_build_context_synchronously, non_constant_identifier_names

import 'dart:math';

import 'package:dc_marvel_app/components/ChangeRoom.dart';
import 'package:dc_marvel_app/components/ShowDialogCreateRoom.dart';
import 'package:dc_marvel_app/components/showChapterAll.dart';
import 'package:dc_marvel_app/view/play/find_battle.dart';
import 'package:dc_marvel_app/view/play/playing_now.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import '../../components/AppBarProfile.dart';
import '../../components/ButtonBattleCustom.dart';
import '../../components/ChapterImage.dart';
import '../notify/notify.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({super.key});

  @override
  State<PlayGame> createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
  final _auth = FirebaseAuth.instance;
  final _db = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(20),
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/galaxy.gif"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          const Expanded(
            flex: 1,
            child: AppBarProfile(),
          ),
          Expanded(
            flex: 5,
            child: Stack(
              alignment: Alignment.center,
              children: [
                WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromTop(),
                  atRestEffect: WidgetRestingEffects.wave(),
                  child: InkWell(
                    onTap: (() => Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) =>
                                const ShowChapterAll(),
                          ),
                        )),
                    child: const ChapterImage(
                      path: 'assets/images/Chapter1.png',
                    ),
                  ),
                ),
                WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromRight(),
                  child: Container(
                    alignment: Alignment.topRight,
                    margin: const EdgeInsets.only(top: 5, right: 5),
                    child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              const Notify(),
                        ));
                      },
                      child: Image(
                        width: MediaQuery.of(context).size.width / 7,
                        height: MediaQuery.of(context).size.width / 7,
                        image: const AssetImage('assets/images/Icon_bell.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              padding: const EdgeInsets.all(8.0),
              margin: const EdgeInsets.only(top: 50),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Expanded(
                    flex: 1,
                    child: WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromLeft(),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                  const Find_battle(),
                            ),
                          );
                        },
                        child: const ButtonBattleCustom(
                          title: 'BATTLE',
                          url: "assets/images/ButtonPlayBattle.png",
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromBottom(),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                  PlayingGame(),
                            ),
                          );
                        },
                        child: const ButtonBattleCustom(
                          title: 'PLAY NOW',
                          url: "assets/images/ButtonPlaynow.png",
                          fontSize: 25,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromRight(),
                      child: InkWell(
                        onTap: () {
                          Navigator.of(context).push(
                            PageRouteBuilder(
                              opaque: false,
                              pageBuilder: (BuildContext context, _, __) =>
                                  const ChangeRoom(),
                            ),
                          );
                        },
                        child: const ButtonBattleCustom(
                          title: 'ROOM',
                          url: "assets/images/ButtonPlayRoom.png",
                          fontSize: 18,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}