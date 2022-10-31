import 'package:dc_marvel_app/components/PlayBattleRoom.dart';
import 'package:flutter/material.dart';

import '../components/ButtonBattleCustom.dart';
import '../components/PlayBattle.dart';
import '../components/PlayBattlePlayNow.dart';

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
          Expanded(
            flex: 7,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Expanded(
                //   flex: 1,
                //   child: Container(
                //     width: 60,
                //     height: 60,
                //     margin: const EdgeInsets.fromLTRB(10, 30, 10, 0),
                //     decoration: const BoxDecoration(
                //       image: DecorationImage(
                //         image: AssetImage(
                //           "assets/images/icon_setting.png",
                //         ),
                //         fit: BoxFit.cover,
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(
                  flex: 4,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 40),
                    child: Image.asset(
                      "assets/images/DCMarvelSmall.png",
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
                children: const [
                  ButtonBattleCustom(
                    title: 'BATTLE',
                    url: "assets/images/ButtonPlayBattle.png",
                    flex: 1,
                    fontSize: 18,
                    showDialog: showDialogPlayBattle(),
                  ),
                  ButtonBattleCustom(
                    title: 'PLAY NOW',
                    url: "assets/images/ButtonPlaynow.png",
                    flex: 2,
                    fontSize: 25,
                    showDialog: showDialogPlayBattleNow(),
                  ),
                  ButtonBattleCustom(
                    title: 'ROOM',
                    url: "assets/images/ButtonPlayRoom.png",
                    flex: 1,
                    fontSize: 18,
                    showDialog: showDialogPlayBattleRoom(),
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
