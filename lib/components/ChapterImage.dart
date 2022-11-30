import 'package:flutter/material.dart';

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
