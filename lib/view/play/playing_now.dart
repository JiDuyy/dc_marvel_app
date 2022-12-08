// ignore_for_file: prefer_const_constructors

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import '../../components/Answer.dart';
import '../../components/Icon_helper.dart';
import '../../components/ShowDialogSettingPlayGame.dart';

class PlayingGame extends StatefulWidget {
  PlayingGame({super.key});

  @override
  State<PlayingGame> createState() => _PlayingGameState();
}

class _PlayingGameState extends State<PlayingGame> {
  final auth = FirebaseAuth.instance;
  final _database = FirebaseDatabase.instance.ref();
  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(10),
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Background_Play.jpg"),
            fit: BoxFit.fill,
          ),
        ),
        child: StreamBuilder(
          stream: _database.child('questions/1').onValue,
          builder: ((context, snapshot) {
            if (snapshot.hasData && snapshot.data != null) {
              final data = Map<String, dynamic>.from(
                Map<String, dynamic>.from((snapshot.data as DatabaseEvent)
                    .snapshot
                    .value as Map<dynamic, dynamic>),
              );
              return Column(
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
                                  const ShowDialogSettingPlayGame(),
                            ),
                          );
                        },
                        child: Container(
                          width: size.width / 10,
                          height: size.width / 10,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/icon_setting.png"),
                              // fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Container(
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/FrameQuestion.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                      child: Column(
                        children: [
                          Expanded(
                            flex: 6,
                            child: Padding(
                              padding: EdgeInsets.all(size.width / 15),
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  data['title'].toString(),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsets.only(right: 12),
                              child: Align(
                                alignment: Alignment.centerRight,
                                child: Text(
                                  '30',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Text(
                              data['chapter'].toString(),
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 4,
                    child: Column(
                      children: [
                        Expanded(
                          child: Answer(
                            title: 'A',
                            caption: data['1'].toString(),
                          ),
                        ),
                        Expanded(
                          child: Answer(
                            title: 'B',
                            caption: data['2'].toString(),
                          ),
                        ),
                        Expanded(
                          child: Answer(
                            title: 'C',
                            caption: data['3'].toString(),
                          ),
                        ),
                        Expanded(
                          child: Answer(
                            title: 'D',
                            caption: data['4'].toString(),
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
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Icon_helper(
                              url: 'assets/images/icon_hammer.png', items: 5),
                          Icon_helper(
                              url: 'assets/images/icon_spider.png', items: 5),
                          Icon_helper(
                              url: 'assets/images/icon_bat.png', items: 5),
                          Icon_helper(
                              url: 'assets/images/icons_khien.png', items: 5),
                        ],
                      ),
                    ),
                  ),
                  const Spacer(
                    flex: 1,
                  ),
                ],
              );
            }
            return CircularProgressIndicator();
          }),
        ),
      ),
    );
  }
}
