import 'package:flutter/material.dart';

import '../view/play/playing_now.dart';

class ChapterImage extends StatefulWidget {
  const ChapterImage({
    Key? key,
    required this.path,
  }) : super(key: key);
  final String path;

  @override
  State<ChapterImage> createState() => _ChapterImageState();
}

class _ChapterImageState extends State<ChapterImage> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        left: MediaQuery.of(context).size.width / 20,
        top: MediaQuery.of(context).size.height / 40,
      ),
      width: MediaQuery.of(context).size.width / 1.1,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.path),
        ),
      ),
    );
  }
}

class ItemChappter extends StatelessWidget {
  const ItemChappter(
      {Key? key,
      required this.chapter,
      required this.level,
      required this.exp,
      required this.hightScore,
      required this.diamond,
      required this.numberChappter,
      required this.path})
      : super(key: key);

  final int chapter;
  final int level;
  final int exp;
  final int hightScore;
  final int diamond;
  final int numberChappter;
  final String path;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: chapter < numberChappter
          ? null
          : () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) => PlayingGame(
                      level: level,
                      exp: exp,
                      hightScore: hightScore,
                      chapter: chapter >= numberChappter ? numberChappter : 1,
                      diamond: diamond),
                ),
              );
            },
      child: Stack(
        children: [
          Container(
            margin: EdgeInsets.only(
              left: MediaQuery.of(context).size.width / 20,
              top: MediaQuery.of(context).size.height / 40,
            ),
            width: MediaQuery.of(context).size.width / 1.1,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(path),
              ),
            ),
          ),
          Container(
            width: MediaQuery.of(context).size.width,
            height: MediaQuery.of(context).size.height,
            color: chapter < numberChappter
                ? Colors.black.withOpacity(.6)
                : Colors.black.withOpacity(.0),
            child: chapter < numberChappter
                ? Image(
                    image: AssetImage('assets/images/iconLockinChapter.png'),
                  )
                : Container(),
          )
        ],
      ),
    );
  }
}
