import 'package:flutter/material.dart';

import 'ChapterImage.dart';

class ShowChapterAll extends StatefulWidget {
  const ShowChapterAll({super.key});

  @override
  State<ShowChapterAll> createState() => _ShowChapterAllState();
}

class _ShowChapterAllState extends State<ShowChapterAll> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.9),
      body: InkWell(
        onTap: () => Navigator.pop(context),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                margin: const EdgeInsets.only(top: 10, bottom: 10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/FrameTitle.png'),
                    fit: BoxFit.fill,
                  ),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'ALL CHAPTER',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1.5,
                    ),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 6,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: const [
                    ChapterImage(
                      path: 'assets/images/Chapter1.png',
                    ),
                    ChapterImage(
                      path: 'assets/images/Chapter2.png',
                    ),
                    ChapterImage(
                      path: 'assets/images/Chapter3.png',
                    ),
                    ChapterImage(
                      path: 'assets/images/Chapter4.png',
                    ),
                    ChapterImage(
                      path: 'assets/images/Chapter5.png',
                    ),
                    ChapterImage(
                      path: 'assets/images/Chapter6.png',
                    ),
                    ChapterImage(
                      path: 'assets/images/Chapter7.png',
                    ),
                    ChapterImage(
                      path: 'assets/images/Chapter8.png',
                    ),
                    ChapterImage(
                      path: 'assets/images/Chapter10.png',
                    ),
                  ],
                ),
              ),
            ),
            const Spacer()
          ],
        ),
      ),
    );
  }
}
