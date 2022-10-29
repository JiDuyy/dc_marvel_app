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
      child: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      Stack(
                        alignment: Alignment.center,
                        children: [
                          SizedBox(
                            width: 34,
                            height: 34,
                            child: Image.network(
                                'https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/290530994_1474685339654007_6340689977015220634_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=8yVwH3Ni9D4AX-OSBWA&_nc_ht=scontent.fsgn2-1.fna&oh=00_AfCXGE8Gix35SecG943SVnadDD-7hykVMf78sJEgfhSTNA&oe=635FDB90'),
                          ),
                          Container(
                            width: 50,
                            height: 50,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage(
                                    "assets/images/BorderAvatar.png"),
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 15,
                            width: 90,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.white,
                            ),
                          ),
                          Container(
                            height: 15,
                            width: 30,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(4),
                              color: Colors.blue,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                  Container(
                    height: 40,
                    width: 120,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: const Color.fromARGB(129, 255, 255, 255),
                    ),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          '9.99',
                          style: TextStyle(
                              color: Colors.yellow,
                              fontSize: 16,
                              fontWeight: FontWeight.w500),
                        ),
                        const SizedBox(
                          width: 10,
                        ),
                        Image.asset(
                          'assets/images/icon_diamond_add.png',
                          width: 35,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 7,
              child: Container(
                margin: const EdgeInsets.only(top: 150),
                width: 300,
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                        "https://scontent.fsgn2-4.fna.fbcdn.net/v/t1.15752-9/312198057_534032641922777_1109094207653280685_n.png?_nc_cat=101&ccb=1-7&_nc_sid=ae9488&_nc_ohc=eXn2VO_ieIEAX8SbhvL&_nc_oc=AQmISBYpLepxnQV_U0DFgbS_inUrISjIGYzk1w8DljzCEQ2I7wpwOExbmxX6xTOT-M4KrlidlR23bmoQsGN5pEG9&tn=2WdwbRTrk16c5GyD&_nc_ht=scontent.fsgn2-4.fna&oh=03_AdQDPCa0amiKBQI12GztiazJ84HXgrYdd23hzrovhfbUqw&oe=637E49D5"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: const EdgeInsets.all(8.0),
                margin: const EdgeInsets.only(top: 80),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ButtonBattleCustom(
                      title: 'BATTLE',
                      url: "assets/images/ButtonPlayBattle.png",
                      flex: 1,
                      fontSize: 18,
                      pageRoute: MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    ),
                    ButtonBattleCustom(
                      title: 'PLAY NOW',
                      url: "assets/images/ButtonPlaynow.png",
                      flex: 2,
                      fontSize: 25,
                      pageRoute: MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    ),
                    ButtonBattleCustom(
                      title: 'ROOM',
                      url: "assets/images/ButtonPlayRoom.png",
                      flex: 1,
                      fontSize: 18,
                      pageRoute: MaterialPageRoute(
                        builder: (context) => const Login(),
                      ),
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
