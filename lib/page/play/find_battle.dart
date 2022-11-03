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
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Scaffold(
            body: SafeArea(
          child: Container(
            padding: const EdgeInsets.all(15),
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
                image: DecorationImage(
              image: AssetImage("assets/images/Edit_Background.jpg"),
              fit: BoxFit.cover,
            )),
            child: Column(
              children: [
                Expanded(
                    child: Container(
                        alignment: Alignment.center,
                        padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                        child: const Text("Play Battle",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 35,
                              fontFamily: 'Horizon',
                            )))),
                Expanded(
                    flex: 2,
                    child: Row(
                      children: [
                        Expanded(
                            child: Card_player_wFind(
                                url: 'assets/images/avatar_batman.png',
                                Name: 'JiDuy')),
                        // ignore: prefer_const_literals_to_create_immutables
                        Expanded(
                            child: Column(
                          children: const [
                            Expanded(
                              child: Image(
                                image: AssetImage(
                                    'assets/images/icon_battle2.png'),
                              ),
                            ),
                            Expanded(
                                child: Text(
                              '00:00',
                              style: TextStyle(
                                fontFamily: 'Horizon',
                                color: Colors.white,
                                fontWeight: FontWeight.bold,
                                fontSize: 20,
                              ),
                            ))
                          ],
                        )),
                        Expanded(
                            child: Card_player_wFind(
                          url: 'assets/images/avatar_batman.png',
                          Name: 'KDY',
                        )),
                      ],
                    )),
                Expanded(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width / 4,
                      height: MediaQuery.of(context).size.width / 10,
                      child: ElvatedButtonCustom(
                        caption: 'Play',
                        colorBorder: Colors.black,
                        colorBackground: Colors.green,
                        opacity: 1,
                        colorTitle: Colors.black,
                        routePage: MaterialPageRoute(
                          builder: (context) => Playing_battle(),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: Center(
                    child: Container(
                      margin: const EdgeInsets.only(top: 20),
                      width: MediaQuery.of(context).size.width / 8,
                      height: MediaQuery.of(context).size.width / 8,
                      child: const ButtonBattleCustom(
                        title: '',
                        url: "assets/images/icon_cacel.png",
                        flex: 1,
                        fontSize: 18,
                        showDialog: showDialogPlayBattle(),
                      ),
                    ),
                  ),
                ),
                const Spacer(
                  flex: 3,
                )
              ],
            ),
          ),
        )));
  }
}
