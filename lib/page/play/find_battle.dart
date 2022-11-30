import 'package:dc_marvel_app/components/card_player.dart';
import 'package:flutter/material.dart';
import '../../components/ButtonBattleCustom.dart';
import '../../components/ElvatedButtonCustom.dart';
import '../../components/PlayBattle.dart';
import 'playing_battle.dart';

class Find_battle extends StatefulWidget {
  const Find_battle({super.key});

  @override
  State<Find_battle> createState() => _Find_battleState();
}

class _Find_battleState extends State<Find_battle> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.9),
      body: Container(
        // padding: const EdgeInsets.all(15),
        width: double.infinity,
        height: double.infinity,
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                alignment: Alignment.center,
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/FrameTitle.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: const Text(
                  "Play Battle",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 35,
                    fontFamily: 'Horizon',
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Column(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Card_player_wFind(
                        url: 'assets/images/Avatar.jpg',
                        Name: 'JiDuy',
                      ),
                    ),
                  ),
                  // ignore: prefer_const_literals_to_create_immutables
                  Expanded(
                    child: Column(
                      children: const [
                        Expanded(
                          child: Image(
                            image: AssetImage('assets/images/vsbattle.png'),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Align(
                      alignment: Alignment.centerRight,
                      child: Card_player_wFind(
                        url: 'assets/images/Avatar.jpg',
                        Name: 'KDY',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              child: Center(
                child: Container(
                  margin: const EdgeInsets.only(top: 20),
                  width: size.width / 8,
                  height: size.width / 8,
                  child: const ButtonBattleCustom(
                    title: '',
                    url: "assets/images/icon_cacel.png",
                    fontSize: 18,
                    showDialog: showDialogPlayBattle(),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 2,
              child: Center(
                child: Container(
                  height: 80,
                  width: 200,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ButtonPlaynow.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: TextButton(
                    onPressed: () => {
                      Navigator.pop(context),
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PlayingBattle(),
                        ),
                      ),
                    },
                    child: const Center(
                      child: Text(
                        'PLAY',
                        style: TextStyle(
                          fontSize: 25,
                          fontWeight: FontWeight.w900,
                          color: Colors.black,
                          fontFamily: 'Horizon',
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            const Spacer(
              flex: 1,
            )
          ],
        ),
      ),
    );
  }
}
