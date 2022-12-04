import 'package:dc_marvel_app/components/PlayBattleRoom.dart';
import 'package:dc_marvel_app/components/ShowDialogCreateRoom.dart';
import 'package:dc_marvel_app/page/play/find_battle.dart';
import 'package:dc_marvel_app/page/play/playing_now.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import '../../components/Animation.dart';
import '../../components/AppBarProfile.dart';
import '../../components/ButtonBattleCustom.dart';
import '../../components/ChapterImage.dart';
import '../../components/PlayBattle.dart';
import '../notify/notify.dart';

class PlayGame extends StatefulWidget {
  const PlayGame({super.key});

  @override
  State<PlayGame> createState() => _PlayGameState();
}

class _PlayGameState extends State<PlayGame> {
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
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: WidgetAnimator(
                    incomingEffect:
                        WidgetTransitionEffects.incomingSlideInFromTop(),
                    atRestEffect: WidgetRestingEffects.wave(),
                    child: Row(
                      children: const [
                        ChapterImage(
                          path: 'assets/images/Chapter1.png',
                        ),
                        ChapterImage(
                          path: 'assets/images/Chapter2.png',
                        ),
                        ChapterImage(
                          path: 'assets/images/Chapter3.png',
                        ),
                        ChapterImage(
                          path: 'assets/images/Chapter4.png',
                        ),
                        ChapterImage(
                          path: 'assets/images/Chapter5.png',
                        ),
                        ChapterImage(
                          path: 'assets/images/Chapter6.png',
                        ),
                        ChapterImage(
                          path: 'assets/images/Chapter7.png',
                        ),
                        ChapterImage(
                          path: 'assets/images/Chapter8.png',
                        ),
                      ],
                    ),
                  ),
                ),
                WidgetAnimator(
                  incomingEffect:
                      WidgetTransitionEffects.incomingSlideInFromRight(),
                  child: Container(
                    alignment: Alignment.topRight,
                    margin: EdgeInsets.only(top: 5, right: 5),
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
                        image: AssetImage('assets/images/Icon_bell.png'),
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
                      child: const ButtonBattleCustom(
                        title: 'BATTLE',
                        url: "assets/images/ButtonPlayBattle.png",
                        fontSize: 18,
                        showDialog: Find_battle(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromBottom(),
                      child: ButtonBattleCustom(
                        title: 'PLAY NOW',
                        url: "assets/images/ButtonPlaynow.png",
                        fontSize: 25,
                        showDialog: PlayingGame(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 1,
                    child: WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromRight(),
                      child: const ButtonBattleCustom(
                        title: 'ROOM',
                        url: "assets/images/ButtonPlayRoom.png",
                        fontSize: 18,
                        showDialog: ShowDialogCreateRoom(),
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
