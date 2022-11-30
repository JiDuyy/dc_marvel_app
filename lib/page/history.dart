import 'package:dc_marvel_app/components/FrameHistory.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

class History extends StatefulWidget {
  const History({super.key});

  @override
  State<History> createState() => _HistoryState();
}

class _HistoryState extends State<History> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.8),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            flex: 3,
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
                  'History',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 18,
            child: SingleChildScrollView(
              child: WidgetAnimator(
                incomingEffect:
                    WidgetTransitionEffects.incomingSlideInFromLeft(),
                child: Column(
                  children: const [
                    FrameHistory(
                      framehistory: 'assets/images/FrameSiver.png',
                      avatar: 'assets/images/IconLevel.png',
                      item: 'assets/images/iconwin.png',
                      time: '12 hours',
                      point: '300',
                      point2: '200',
                    ),
                    FrameHistory(
                      framehistory: 'assets/images/FrameSiver.png',
                      avatar: 'assets/images/IconLevel.png',
                      item: 'assets/images/iconlose.png',
                      time: '1 day',
                      point: '300',
                      point2: '200',
                    ),
                    FrameHistory(
                      framehistory: 'assets/images/FrameSiver.png',
                      avatar: 'assets/images/IconLevel.png',
                      item: 'assets/images/iconwin.png',
                      time: '1 day',
                      point: '300',
                      point2: '200',
                    ),
                    FrameHistory(
                      framehistory: 'assets/images/FrameSiver.png',
                      avatar: 'assets/images/IconLevel.png',
                      item: 'assets/images/iconwin.png',
                      time: '2 day',
                      point: '300',
                      point2: '200',
                    ),
                    FrameHistory(
                      framehistory: 'assets/images/FrameSiver.png',
                      avatar: 'assets/images/IconLevel.png',
                      item: 'assets/images/iconwin.png',
                      time: '2 day',
                      point: '300',
                      point2: '200',
                    ),
                    FrameHistory(
                      framehistory: 'assets/images/FrameSiver.png',
                      avatar: 'assets/images/IconLevel.png',
                      item: 'assets/images/iconwin.png',
                      time: '2 day',
                      point: '300',
                      point2: '200',
                    ),
                    FrameHistory(
                      framehistory: 'assets/images/FrameSiver.png',
                      avatar: 'assets/images/IconLevel.png',
                      item: 'assets/images/iconwin.png',
                      time: '2 day',
                      point: '300',
                      point2: '200',
                    ),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  InkWell(
                    onTap: (() {
                      Navigator.pop(context);
                    }),
                    child: Container(
                      width: MediaQuery.of(context).size.width / 5,
                      height: MediaQuery.of(context).size.width / 5,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/backhome.png"),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
