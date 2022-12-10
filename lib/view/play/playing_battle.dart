// ignore_for_file: prefer_const_constructors

import 'package:dc_marvel_app/components/AnswerBattle.dart';
import 'package:flutter/material.dart';
import '../../components/Answer.dart';

class PlayingBattle extends StatefulWidget {
  const PlayingBattle({super.key});

  @override
  State<PlayingBattle> createState() => _PlayingBattleState();
}

class _PlayingBattleState extends State<PlayingBattle> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background_Play.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/FrameTitle.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                // padding: const EdgeInsets.only(bottom: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/Avatar.jpg',
                                  height: 66,
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  'assets/images/khungkimcuong.png',
                                  height: 100,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '2000',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Container(
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/vsbattle.png"),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Stack(
                            alignment: Alignment.center,
                            children: [
                              Center(
                                child: Image.asset(
                                  'assets/images/Avatar.jpg',
                                  height: 66,
                                ),
                              ),
                              Center(
                                child: Image.asset(
                                  'assets/images/BoderAvatar2.png',
                                  height: 100,
                                ),
                              ),
                            ],
                          ),
                          Text(
                            '2000',
                            style: TextStyle(color: Colors.white),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/FrameTitle.png"),
                    fit: BoxFit.fill,
                  ),
                ),
                child: Column(
                  children: [
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.all(size.width / 15),
                        child: const Align(
                          alignment: Alignment.topLeft,
                          child: Text(
                            'Mình tự đánh mình, mình cảm thấy đâu là mình mạnh hay mình yếu?',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: const EdgeInsets.only(right: 12),
                        child: Align(
                          alignment: Alignment.centerRight,
                          child: Text(
                            '30',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Chương 1: Vũ trụ',
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
                    child: InkWell(
                      onTap: () {
                        print('object');
                      },
                      child: AnswerBattle(
                        frameAnswer: "assets/images/FrameTitle.png",
                        title: 'A',
                        caption: 'Lú cái đầu',
                      ),
                    ),
                  ),
                  Expanded(
                    child: AnswerBattle(
                      frameAnswer: "assets/images/FrameTitle.png",
                      title: 'B',
                      caption: 'Lú cái đầu',
                    ),
                  ),
                  Expanded(
                    child: AnswerBattle(
                      frameAnswer: "assets/images/FrameTitle.png",
                      title: 'C',
                      caption: 'Lú cái đầu',
                    ),
                  ),
                  Expanded(
                    child: AnswerBattle(
                      frameAnswer: "assets/images/FrameTitle.png",
                      title: 'D',
                      caption: 'Lú cái đầu',
                    ),
                  ),
                ],
              ),
            ),
            // Expanded(
            //   flex: 2,
            //   child: Container(
            //     margin: const EdgeInsets.only(top: 10),
            //     decoration: const BoxDecoration(
            //       image: DecorationImage(
            //         image: AssetImage("assets/images/FramePlayer.png"),
            //         fit: BoxFit.fill,
            //       ),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            //       children: [
            //         Icon_helper(url: 'assets/images/icon_hammer.png', items: 5),
            //         Icon_helper(url: 'assets/images/icon_spider.png', items: 5),
            //         Icon_helper(url: 'assets/images/icon_bat.png', items: 5),
            //         Icon_helper(url: 'assets/images/icons_khien.png', items: 5),
            //       ],
            //     ),
            //   ),
            // ),
            const Spacer(
              flex: 1,
            ),
          ],
        ),
      ),
    );
  }
}
