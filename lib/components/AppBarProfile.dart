import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dc_marvel_app/components/ShowDialogPlayProfile.dart';
import 'package:dc_marvel_app/components/ShowDialogSetting.dart';
import 'package:dc_marvel_app/page/setting.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class AppBarProfile extends StatefulWidget {
  const AppBarProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarProfile> createState() => _AppBarProfileState();
}

const colorizeColors = [
  Colors.white,
  Colors.blue,
  Colors.yellow,
  Colors.red,
];

const colorizeTextStyle = TextStyle(
  fontSize: 28.0,
  fontFamily: 'Horizon',
  color: Colors.white,
);

class _AppBarProfileState extends State<AppBarProfile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(),
            child: Container(
              margin: const EdgeInsets.only(right: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/BgProfileLeft.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: Container(
                alignment: Alignment.topLeft,
                margin: const EdgeInsets.only(left: 10, top: 10),
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        opaque: false,
                        pageBuilder: (BuildContext context, _, __) =>
                            const ShowDiaLogProfile(),
                      ),
                    );
                  },
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width / 15,
                        height: MediaQuery.of(context).size.width / 15,
                        child: Image.asset('assets/images/Avatar.jpg'),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width / 9,
                        height: MediaQuery.of(context).size.width / 9,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/BorderAvatar.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(),
            child: Container(
              alignment: Alignment.center,
              margin: const EdgeInsets.only(bottom: 20),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/BgProfileBetween.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: AnimatedTextKit(
                totalRepeatCount: 100,
                animatedTexts: [
                  ColorizeAnimatedText(
                    'JIDUY',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    'DC MARVEL',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                  ColorizeAnimatedText(
                    'KHANH DUY',
                    textStyle: colorizeTextStyle,
                    colors: colorizeColors,
                  ),
                ],
                isRepeatingAnimation: true,
              ),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: WidgetAnimator(
            incomingEffect: WidgetTransitionEffects.incomingSlideInFromRight(),
            child: Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.only(left: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/BgProfileRight.png"),
                  fit: BoxFit.fill,
                ),
              ),
              child: InkWell(
                onTap: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      opaque: false,
                      pageBuilder: (BuildContext context, _, __) =>
                          const ShowDialogSetting(),
                    ),
                  );
                },
                child: Container(
                  alignment: Alignment.topRight,
                  margin: const EdgeInsets.only(right: 10, top: 10),
                  width: MediaQuery.of(context).size.width / 8,
                  height: MediaQuery.of(context).size.width / 8,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/icon_setting.png"),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
