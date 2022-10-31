import 'package:dc_marvel_app/components/PlayBattleRoom.dart';
import 'package:flutter/material.dart';

import '../components/ButtonBattleCustom.dart';
import 'login.dart';

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
                  child: Container(
                    margin: const EdgeInsets.only(top: 80),
                    width: 350,
                    height: 350,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(
                            "https://scontent.fsgn2-4.fna.fbcdn.net/v/t1.15752-9/312198057_534032641922777_1109094207653280685_n.png?_nc_cat=101&ccb=1-7&_nc_sid=ae9488&_nc_ohc=eXn2VO_ieIEAX8SbhvL&_nc_oc=AQmISBYpLepxnQV_U0DFgbS_inUrISjIGYzk1w8DljzCEQ2I7wpwOExbmxX6xTOT-M4KrlidlR23bmoQsGN5pEG9&tn=2WdwbRTrk16c5GyD&_nc_ht=scontent.fsgn2-4.fna&oh=03_AdQDPCa0amiKBQI12GztiazJ84HXgrYdd23hzrovhfbUqw&oe=637E49D5"),
                        fit: BoxFit.cover,
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
                children: const [
                  ButtonBattleCustom(
                    title: 'BATTLE',
                    url: "assets/images/ButtonPlayBattle.png",
                    flex: 1,
                    fontSize: 18,
                    showDialog: showDialogPlayBattleRoom(),
                  ),
                  ButtonBattleCustom(
                    title: 'PLAY NOW',
                    url: "assets/images/ButtonPlaynow.png",
                    flex: 2,
                    fontSize: 25,
                    showDialog: showDialogPlayBattleRoom(),
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
