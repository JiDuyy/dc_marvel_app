import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dc_marvel_app/components/AppBarProfile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_launcher_icons/xml_templates.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class ShowDiaLogProfile extends StatefulWidget {
  const ShowDiaLogProfile({super.key});

  @override
  State<ShowDiaLogProfile> createState() => _ShowDiaLogProfileState();
}

class _ShowDiaLogProfileState extends State<ShowDiaLogProfile> {
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
                  margin: EdgeInsets.all(15),
                  decoration: BoxDecoration(
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
                          Spacer(
                            flex: 5,
                          ),
                          Expanded(
                            flex: 3,
                            child: WidgetAnimator(
                              incomingEffect: WidgetTransitionEffects
                                  .incomingSlideInFromRight(),
                              child: Text(
                                'Profile',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontFamily: 'Horizon',
                                ),
                              ),
                            ),
                          ),
                          Spacer()
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
                                  alignment: Alignment(-0.05, 0.25),
                                  fit: StackFit.loose,
                                  children: [
                                    SizedBox(
                                      width:
                                          MediaQuery.of(context).size.width / 5,
                                      height:
                                          MediaQuery.of(context).size.width / 5,
                                      child: Image.asset(
                                          'assets/images/Avatar.jpg'),
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
                                      child: Text(
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
                                      Expanded(
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
                                                    Expanded(
                                                        child: Text(
                                                      '300',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Horizon',
                                                          fontSize: 20),
                                                    )),
                                                    Expanded(
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
                                                    Expanded(
                                                        child: Text(
                                                      '10',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontFamily: 'Horizon',
                                                          fontSize: 20),
                                                    )),
                                                    Expanded(
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
                                                    'assets/images/buttonshareProfile.png'),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Share',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 20,
                                                  fontFamily: 'Horizon',
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Spacer()
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

class infoProfle extends StatelessWidget {
  String Url;
  int x;
  infoProfle({Key? key, required this.Url, required this.x}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 2,
      child: Column(
        children: [
          Expanded(
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 5,
              height: MediaQuery.of(context).size.width / 5,
              child: Image.asset(this.Url),
            ),
          ),
          Expanded(
            child: Text(
              this.x.toString(),
              style: TextStyle(
                color: Colors.white,
                fontSize: 30,
                fontFamily: 'Horizon',
              ),
            ),
          ),
        ],
      ),
    );
  }
}
