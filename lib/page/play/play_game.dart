import 'package:dc_marvel_app/components/PlayBattleRoom.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import '../../components/Animation.dart';
import '../../components/AppBarProfile.dart';
import '../../components/ButtonBattleCustom.dart';
import '../../components/PlayBattle.dart';
import '../../components/PlayBattlePlayNow.dart';

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
          image: AssetImage("assets/images/Edit_Background.jpg"),
          fit: BoxFit.cover,
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
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(20, 40, 20, 0),
                    child: WidgetAnimator(
                      incomingEffect: WidgetTransitionEffects.incomingScaleUp(),
                      child: const LogoAnimation(),
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
                        showDialog: showDialogPlayBattle(),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromBottom(),
                      child: const ButtonBattleCustom(
                        title: 'PLAY NOW',
                        url: "assets/images/ButtonPlaynow.png",
                        fontSize: 25,
                        showDialog: showDialogPlayBattleNow(),
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
                        showDialog: showDialogPlayBattleRoom(),
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