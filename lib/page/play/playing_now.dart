import 'package:flutter/material.dart';

import '../../components/ShowDialogSetting.dart';

class PlayingGame extends StatefulWidget {
  PlayingGame({super.key});

  @override
  State<PlayingGame> createState() => _PlayingGameState();
}

class _PlayingGameState extends State<PlayingGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background_Play.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: Column(
          children: [
            Expanded(
              child: Align(
                alignment: Alignment.centerRight,
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
            // Expanded(
            //   child: Padding(
            //     padding: const EdgeInsets.only(bottom: 10.0),
            //     child: Row(
            //       children: [
            //         Expanded(
            //           child: Container(
            //             margin: const EdgeInsets.only(right: 5),
            //             decoration: const BoxDecoration(
            //               image: DecorationImage(
            //                 image: AssetImage("assets/images/FramePlayer.png"),
            //                 fit: BoxFit.fill,
            //               ),
            //             ),
            //           ),
            //         ),
            //         Expanded(
            //           child: Container(
            //             margin: const EdgeInsets.only(left: 5),
            //             decoration: const BoxDecoration(
            //               image: DecorationImage(
            //                 image: AssetImage("assets/images/FramePlayer.png"),
            //                 fit: BoxFit.fill,
            //               ),
            //             ),
            //           ),
            //         ),
            //       ],
            //     ),
            //   ),
            // ),
            Expanded(
              flex: 4,
              child: Container(
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/FrameQuestion.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/FrameAnwer.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/FrameAnwer.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/FrameAnwer.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      margin: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/FrameAnwer.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 2,
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/FramePlayer.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            const Flexible(flex: 1, child: Text('')),
          ],
        ),
      ),
    );
  }
}
