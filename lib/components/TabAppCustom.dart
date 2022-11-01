// ignore_for_file: file_names

import 'package:flutter/material.dart';

class TabAppBarCustom extends StatefulWidget {
  const TabAppBarCustom(
      {super.key,
      required this.title,
      required this.urlOne,
      required this.urlTwo,
      required this.color,
      required this.pageController,
      required this.jumpToPage});
  final String title;
  final String urlOne;
  final String urlTwo;
  final Color color;
  final PageController pageController;
  final int jumpToPage;

  @override
  State<TabAppBarCustom> createState() => _TabAppBarCustomState();
}

class _TabAppBarCustomState extends State<TabAppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Align(
          alignment: Alignment.center,
          child: Container(
            width: 75,
            height: 15,
            color: Colors.white,
            child: Stack(
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 30,
                    color: widget.color,
                  ),
                ),
                Align(
                  alignment: Alignment.center,
                  child: Text(
                    widget.title,
                    style: const TextStyle(color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.urlOne),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        Align(
          alignment: Alignment.centerRight,
          child: Container(
            width: 30,
            height: 30,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(widget.urlTwo),
                fit: BoxFit.cover,
              ),
            ),
            child: InkWell(
              onTap: () {
                widget.pageController.jumpToPage(widget.jumpToPage);
              },
            ),
          ),
        ),
      ],
    );
  }
}
