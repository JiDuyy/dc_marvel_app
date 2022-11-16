import 'dart:ffi';

import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../components/FrameRank.dart';

class Rank extends StatefulWidget {
  const Rank({super.key});

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Edit_Background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      // color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              color: Colors.red,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'XẾP HẠNG',
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
            flex: 10,
            child: SingleChildScrollView(
              child: WidgetAnimator(
                incomingEffect:
                    WidgetTransitionEffects.incomingSlideInFromLeft(),
                child: Column(
                  children: const [
                    FrameRank(
                      frameRank: 'assets/images/FrameGold.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      rank: '1',
                      userName: "JiDuy",
                      pointRank: '9999',
                    ),
                    FrameRank(
                      frameRank: 'assets/images/FrameSiver.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      rank: '2',
                      userName: "HKDuy",
                      pointRank: '8888',
                    ),
                    FrameRank(
                      frameRank: 'assets/images/FrameCopper.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      rank: '3',
                      userName: "JD02",
                      pointRank: '7777',
                    ),
                    FrameRank(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      rank: '5',
                      userName: "Duyyy",
                      pointRank: '6666',
                    ),
                    FrameRank(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      rank: '5',
                      userName: "Duyyyy",
                      pointRank: '5555',
                    ),
                    FrameRank(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      rank: '6',
                      userName: "Duyyyyy",
                      pointRank: '4444',
                    ),
                    FrameRank(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      rank: '7',
                      userName: "Duyyyyyy",
                      pointRank: '3333',
                    ),
                    FrameRank(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      rank: '8',
                      userName: "Duyyyyyyy",
                      pointRank: '2222',
                    ),
                    FrameRank(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      rank: '9',
                      userName: "Duyyyyyyyy",
                      pointRank: '1111',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingScaleDown(),
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 25),
                child: const FrameRank(
                  frameRank: 'assets/images/FrameGold.png',
                  pathAvatar: 'assets/images/IconLevel.png',
                  rank: '1',
                  userName: "JiDuy",
                  pointRank: '9999',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
