import 'package:flutter/material.dart';

import 'BonusFrameItem.dart';

class FrameEven extends StatefulWidget {
  const FrameEven({
    Key? key,
    required this.pathItemOne,
    required this.pathItemTwo,
    required this.pathFrame,
  }) : super(key: key);

  final String pathFrame;
  final String pathItemOne;
  final String pathItemTwo;

  @override
  State<FrameEven> createState() => _FrameEvenState();
}

class _FrameEvenState extends State<FrameEven> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width - 50,
      height: MediaQuery.of(context).size.width + 50,
      margin: const EdgeInsets.only(top: 15, bottom: 15),
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.pathFrame),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        // mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Expanded(
            flex: 10,
            child: Text(''),
          ),
          Expanded(
            flex: 1,
            child: SizedBox(
              width: MediaQuery.of(context).size.width / 1.5,
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text(
                  'Giải thưởng',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.white,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              width: MediaQuery.of(context).size.width / 1.5,
              decoration: BoxDecoration(
                color: Colors.black.withOpacity(.5),
                borderRadius: const BorderRadius.all(
                  Radius.circular(5),
                ),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  BonusFrameItem(path: widget.pathItemOne),
                  BonusFrameItem(path: widget.pathItemTwo),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              width: MediaQuery.of(context).size.width / 2,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/ButonSetting.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: const Center(
                child: Text(
                  'PLAY',
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                    fontFamily: 'Horizon',
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(top: 10),
              width: MediaQuery.of(context).size.width / 1.5,
              child: const Text(
                "Thử thách vô tận, bứt phá giới hạn của bạn.",
                style: TextStyle(color: Colors.white, fontSize: 12),
                textAlign: TextAlign.center,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
