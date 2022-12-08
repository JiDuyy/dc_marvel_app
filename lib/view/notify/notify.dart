import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dc_marvel_app/components/AppBarProfile.dart';
import 'package:dc_marvel_app/components/FrameNotify.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../components/FrameFriend.dart';
import '../../components/InfoProfile.dart';

class Notify extends StatefulWidget {
  const Notify({super.key});

  @override
  State<Notify> createState() => _NotifyState();
}

class _NotifyState extends State<Notify> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(.6),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.all(15),
                decoration: BoxDecoration(
                    image: DecorationImage(
                  image: AssetImage('assets/images/profile_background.png'),
                  fit: BoxFit.fill,
                )),
                child: Column(
                  children: [
                    Expanded(
                      child: WidgetAnimator(
                        incomingEffect:
                            WidgetTransitionEffects.incomingSlideInFromRight(),
                        child: Container(
                          margin: EdgeInsets.only(
                              left: MediaQuery.of(context).size.width / 2.8,
                              top: MediaQuery.of(context).size.width / 50),
                          child: Text(
                            'Notify',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Horizon',
                            ),
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 7,
                      child: SingleChildScrollView(
                        child: WidgetAnimator(
                          incomingEffect:
                              WidgetTransitionEffects.incomingSlideInFromLeft(),
                          child: Column(
                            children: const [
                              FrameNotify(
                                frameRank: 'assets/images/notify.png',
                                pathAvatar: 'assets/images/IconLevel.png',
                                userName: "kdy",
                                Time: '10:00',
                                Notication: 'kdy is ready to be battle!',
                              ),
                              FrameNotify(
                                frameRank: 'assets/images/notify.png',
                                pathAvatar: 'assets/images/IconLevel.png',
                                userName: "kdy",
                                Time: '10:00',
                                Notication: 'kdy is ready to be battle!',
                              ),
                              FrameNotify(
                                frameRank: 'assets/images/notify.png',
                                pathAvatar: 'assets/images/IconLevel.png',
                                userName: "kdy",
                                Time: '10:00',
                                Notication: 'kdy is ready to be battle!',
                              ),
                              FrameNotify(
                                frameRank: 'assets/images/notify.png',
                                pathAvatar: 'assets/images/IconLevel.png',
                                userName: "kdy",
                                Time: '10:00',
                                Notication: 'kdy is ready to be battle!',
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                        child: WidgetAnimator(
                      incomingEffect:
                          WidgetTransitionEffects.incomingSlideInFromLeft(),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          InkWell(
                            onTap: (() {
                              Navigator.pop(context);
                            }),
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: MediaQuery.of(context).size.width / 5,
                              decoration: const BoxDecoration(
                                image: DecorationImage(
                                  image:
                                      AssetImage("assets/images/backhome.png"),
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )),
                  ],
                ),
              ),
            ),
            const Spacer()
          ],
        ));
  }
}
