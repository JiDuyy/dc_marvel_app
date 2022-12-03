// ignore_for_file: prefer_typing_uninitialized_variables

import 'package:flutter/material.dart';

class FrameHistory extends StatefulWidget {
  const FrameHistory(
      {super.key,
      required this.framehistory,
      required this.avatar,
      required this.item,
      required this.time,
      required this.point,
      required this.point2});
  final framehistory;
  final avatar;
  final item;
  final time;
  final String point;
  final String point2;
  @override
  State<FrameHistory> createState() => _FrameHistoryState();
}

class _FrameHistoryState extends State<FrameHistory> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.framehistory),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                margin: const EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: Image.asset(widget.avatar),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/BorderAvatar.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.point,
                      // ignore: prefer_const_constructors
                      style: TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                width: 5,
              ),
              Container(
                child: const Image(
                  image: AssetImage('assets/images/vsbattle.png'),
                ),
              ),
              Container(
                margin: const EdgeInsets.only(left: 10, top: 5),
                child: Column(
                  children: [
                    Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: Image.asset(widget.avatar),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/BorderAvatar.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Text(
                      widget.point2,
                      style: const TextStyle(
                          fontSize: 10,
                          color: Colors.black,
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 6,
                height: MediaQuery.of(context).size.width / 12,
                margin: const EdgeInsets.only(right: 10),
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(widget.item),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
              Text(
                widget.time,
                style: const TextStyle(fontSize: 10, color: Colors.black),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
