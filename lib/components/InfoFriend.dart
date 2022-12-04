import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dc_marvel_app/components/AppBarProfile.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'InfoProfile.dart';

class InfoFriend extends StatefulWidget {
  String url;
  InfoFriend({super.key, required this.url});

  @override
  State<InfoFriend> createState() => _InfoFriendState();
}

class _InfoFriendState extends State<InfoFriend> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.black.withOpacity(.6),
        // title: const Text('Basic dialog title'),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              flex: 4,
              child: Container(
                  margin: const EdgeInsets.all(15),
                  decoration: const BoxDecoration(
                      image: DecorationImage(
                    image: AssetImage('assets/images/profile_background.png'),
                    fit: BoxFit.fill,
                  )),
                  child: Column(
                    children: [
                      Expanded(
                          child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          const Spacer(
                            flex: 5,
                          ),
                          Expanded(
                            flex: 3,
                            child: WidgetAnimator(
                              incomingEffect: WidgetTransitionEffects
                                  .incomingSlideInFromRight(),
                              child: const Text(
                                'Friend',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Horizon',
                                ),
                              ),
                            ),
                          ),
                          const Spacer()
                        ],
                      )),
                      Expanded(
                        flex: 13,
                        child: Column(
                          children: [
                            Expanded(
                              flex: 2,
                              child: WidgetAnimator(
                                incomingEffect: WidgetTransitionEffects
                                    .incomingSlideInFromTop(),
                                child: Stack(
                                  alignment: Alignment.center,
                                  fit: StackFit.loose,
                                  children: [
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /
                                          4.8,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              4.8,
                                      child: Image.asset(widget.url),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width /
                                          3.2,
                                      height:
                                          MediaQuery.of(context).size.width /
                                              3.2,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/BoderAvatar2.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Container(
                                      margin: EdgeInsets.only(
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              4),
                                      child: const Text(
                                        '2',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 11,
                                          fontFamily: 'Horizon',
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                            Expanded(
                              child: WidgetAnimator(
                                incomingEffect: WidgetTransitionEffects
                                    .incomingSlideInFromTop(),
                                child: AnimatedTextKit(
                                  totalRepeatCount: 100,
                                  animatedTexts: [
                                    ColorizeAnimatedText(
                                      'JIDUY',
                                      textStyle: colorizeTextStyle,
                                      colors: colorizeColors,
                                    ),
                                  ],
                                  isRepeatingAnimation: true,
                                ),
                              ),
                            ),
                            Expanded(
                                flex: 2,
                                child: WidgetAnimator(
                                  incomingEffect: WidgetTransitionEffects
                                      .incomingSlideInFromRight(),
                                  child: Column(
                                    children: [
                                      const Expanded(
                                        child: Text(
                                          'ID : sadfaaalllwe',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontFamily: 'Horizon',
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                          flex: 2,
                                          child: Row(
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    const Expanded(
                                                        child: Text(
                                                      '300',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Horizon',
                                                          fontSize: 20),
                                                    )),
                                                    const Expanded(
                                                        child: Text(
                                                      'Total',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Horizon',
                                                          fontSize: 20),
                                                    )),
                                                  ],
                                                ),
                                              ),
                                              Expanded(
                                                child: Column(
                                                  children: [
                                                    const Expanded(
                                                        child: Text(
                                                      '10',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Horizon',
                                                          fontSize: 20),
                                                    )),
                                                    const Expanded(
                                                        child: Text(
                                                      'Gate',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Horizon',
                                                          fontSize: 20),
                                                    )),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ))
                                    ],
                                  ),
                                )),
                            Expanded(
                                flex: 2,
                                child: WidgetAnimator(
                                  incomingEffect: WidgetTransitionEffects
                                      .incomingSlideInFromLeft(),
                                  child: Row(
                                    children: [
                                      infoProfle(
                                        Url: 'assets/images/cup.png',
                                        x: 1,
                                      ),
                                      infoProfle(
                                          Url: 'assets/images/RankKC.png',
                                          x: 5),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: SizedBox(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                child: Image.asset(
                                                    'assets/images/iconAddfriend.png'),
                                              ),
                                            ),
                                            Expanded(
                                              child: Container(
                                                margin: const EdgeInsets.only(top: 5),
                                                child: const Text(
                                                  'Add',
                                                  style: TextStyle(
                                                    color: Colors.white,
                                                    fontSize: 25,
                                                    fontFamily: 'Horizon',
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      const Spacer()
                                    ],
                                  ),
                                )),
                            Expanded(
                                child: WidgetAnimator(
                              incomingEffect: WidgetTransitionEffects
                                  .incomingSlideInFromLeft(),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: [
                                  InkWell(
                                    onTap: (() {
                                      Navigator.pop(context);
                                    }),
                                    child: Container(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 5,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/backhome.png"),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ],
                  )),
            ),
            const Spacer()
          ],
        ));
  }
}
