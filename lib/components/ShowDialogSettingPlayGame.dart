import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../view/page_main.dart';

class ShowDialogSettingPlayGame extends StatefulWidget {
  const ShowDialogSettingPlayGame({super.key});

  @override
  State<ShowDialogSettingPlayGame> createState() =>
      _ShowDialogSettingPlayGameState();
}

class _ShowDialogSettingPlayGameState extends State<ShowDialogSettingPlayGame> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.8),
      body: Column(
        // mainAxisAlignment: MainAxisAlignment.start,
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height / 30,
          ),
          const Align(
            alignment: Alignment.topCenter,
            child: Text(
              'CÀI ĐẶT',
              style: TextStyle(
                color: Colors.white,
                fontSize: 28,
                fontWeight: FontWeight.w500,
                letterSpacing: 2.5,
              ),
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height / 10,
          ),
          Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/ButonSetting.png'),
                          fit: BoxFit.fill
                          // fit: BoxFit.cover,
                          ),
                    ),
                    child: Image.asset(
                      'assets/images/IconMusic.png',
                      height: 30,
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(10),
                    padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                          image: AssetImage('assets/images/ButonSetting.png'),
                          fit: BoxFit.fill
                          // fit: BoxFit.cover,
                          ),
                    ),
                    child: Image.asset(
                      'assets/images/IconVolume.png',
                      height: 30,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/ButonSetting.png'),
                            fit: BoxFit.fill
                            // fit: BoxFit.cover,
                            ),
                      ),
                      child: Image.asset(
                        'assets/images/start.png',
                        height: 30,
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const PageMain(),
                        ),
                      );
                    },
                    child: Container(
                      margin: const EdgeInsets.all(10),
                      padding: const EdgeInsets.fromLTRB(60, 10, 60, 10),
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                            image: AssetImage('assets/images/ButonSetting.png'),
                            fit: BoxFit.fill
                            // fit: BoxFit.cover,
                            ),
                      ),
                      child: Image.asset(
                        'assets/images/home.png',
                        height: 30,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
