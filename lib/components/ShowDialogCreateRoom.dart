// ignore_for_file: prefer_const_constructors

import 'package:dc_marvel_app/components/ChooseGameMode.dart';
import 'package:dc_marvel_app/components/DropDownChooseGameMode.dart';
import 'package:dc_marvel_app/components/DropDownSelectDiamond.dart';
import 'package:dc_marvel_app/page/play/playing_now.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import 'ButtonBack.dart';
import 'PlayerRoom.dart';

class ShowDialogCreateRoom extends StatefulWidget {
  const ShowDialogCreateRoom({super.key});

  @override
  State<ShowDialogCreateRoom> createState() => _ShowDialogCreateRoomState();
}

class _ShowDialogCreateRoomState extends State<ShowDialogCreateRoom> {
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return WidgetAnimator(
      incomingEffect: WidgetTransitionEffects.outgoingScaleDown(),
      child: Scaffold(
        backgroundColor: Colors.black.withOpacity(.9),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  width: size.width / 1.5,
                  alignment: Alignment.center,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/BgProfileBetween.png"),
                    ),
                  ),
                  child: const Text(
                    'CREATE ROOM',
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 24,
                        letterSpacing: 2.0,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    PlayerRoom(
                      size: size,
                      path: 'assets/images/Avatar.jpg',
                    ),
                    Container(
                      width: 60,
                      height: 60,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/icon_battle.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    PlayerRoom(
                      size: size,
                      path: 'assets/images/Avatar.jpg',
                    ),
                  ],
                ),
              ),
              Expanded(
                flex: 1,
                child: SizedBox(
                  width: size.width,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: const [
                      DropDownSelectDiamond(),
                      DropDownChooseGameMode(),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: InkWell(
                  onTap: () {
                    Navigator.pop(context);
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => PlayingGame()));
                  },
                  child: Container(
                    width: MediaQuery.of(context).size.width / 1.5,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/ButonSetting.png'),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        'PLAY NOW',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Colors.white,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: ButtonBack(
                  size: size,
                  marginTop: 200,
                  marginLeft: 50,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
