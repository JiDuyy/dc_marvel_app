import 'package:dc_marvel_app/components/InfoFriend.dart';
import 'package:dc_marvel_app/page/notify/notify.dart';
import 'package:flutter/material.dart';

import 'score_game.dart';
import 'ShowDialogPlayProfile.dart';

class FrameNotify extends StatefulWidget {
  const FrameNotify(
      {Key? key,
      required this.frameRank,
      required this.pathAvatar,
      required this.userName,
      required this.Notication,
      required this.Time})
      : super(key: key);

  final String frameRank;
  final String pathAvatar;
  final String userName;
  final String Time;
  final String Notication;

  @override
  State<FrameNotify> createState() => _FrameNotifyState();
}

class _FrameNotifyState extends State<FrameNotify> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.frameRank),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            child: Container(
              margin: const EdgeInsets.only(left: 25),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 28,
                        height: 28,
                        child: Image.asset(widget.pathAvatar),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/BorderAvatar.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          Expanded(
              flex: 4,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          margin: const EdgeInsets.only(left: 5, top: 7),
                          child: Text(
                            widget.userName,
                            style: const TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                        Container(
                          margin: const EdgeInsets.only(right: 10, top: 7),
                          child: Text(
                            widget.Time,
                            style: const TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w700,
                                color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(left: 5, top: 1, right: 10),
                      child: Text(
                        widget.Notication,
                        style: const TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.w700,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ))
        ],
      ),
    );
  }
}
