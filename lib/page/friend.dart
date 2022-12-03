import 'package:dc_marvel_app/components/FrameFriend.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../components/FrameRank.dart';

class Friend extends StatefulWidget {
  const Friend({super.key});

  @override
  State<Friend> createState() => _FriendState();
}

class _FriendState extends State<Friend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/galaxy.gif"),
          fit: BoxFit.cover,
        ),
      ),
      // color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(),
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/FrameTitle.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'BẠN BÈ',
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
          ),
          Expanded(
            flex: 12,
            child: SingleChildScrollView(
              child: WidgetAnimator(
                incomingEffect:
                    WidgetTransitionEffects.incomingSlideInFromLeft(),
                child: Column(
                  children: const [
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "Duyyy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "Duyyyy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "Duyyyyy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "Duyyyyyy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "Duyyyyyyy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "Duyyyyyyyy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "kdy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "kdy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "Duyyyyyyyy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "Duyyyyyyyy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "kdy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "kdy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "kdy",
                    ),
                    FrameFriend(
                      frameRank: 'assets/images/FrameNormal.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      userName: "kdy",
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
