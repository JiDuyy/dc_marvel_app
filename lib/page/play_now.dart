// ignore_for_file: constant_identifier_names

import 'package:dc_marvel_app/components/ButtonBattleCustom.dart';
import 'package:dc_marvel_app/components/Information_player.dart';
import 'package:dc_marvel_app/page/playing.dart';
import 'package:flutter/material.dart';

class Play_Now extends StatefulWidget {
  const Play_Now({super.key});

  @override
  State<Play_Now> createState() => _Play_NowState();
}

// ignore: camel_case_types
enum theme { Nature, Funny, Geography, History, Human, Quiz_tips, Random }

class _Play_NowState extends State<Play_Now> {
  theme? themee = theme.Random;
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.all(20),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("assets/images/Edit_Background.jpg"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Info_Player(),
              Container(
                  alignment: Alignment.center,
                  padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                  child: const Text(
                    "Play Now",
                    style: TextStyle(
                        fontSize: 35,
                        color: Colors.white,
                        decoration: TextDecoration.none),
                  )),
              const Text(
                'Choose theme:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w700,
                ),
              ),
              RadioListTile<theme>(
                activeColor: Colors.white,
                title: const Text(
                  'Nature',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: theme.Nature,
                groupValue: themee,
                onChanged: (theme? value) {
                  setState(() {
                    themee = value;
                  });
                },
              ),
              RadioListTile<theme>(
                activeColor: Colors.white,
                title: const Text(
                  'Funny',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: theme.Funny,
                groupValue: themee,
                onChanged: (theme? value) {
                  setState(() {
                    themee = value;
                  });
                },
              ),
              RadioListTile<theme>(
                activeColor: Colors.white,
                title: const Text(
                  'Geography',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: theme.Geography,
                groupValue: themee,
                onChanged: (theme? value) {
                  setState(() {
                    themee = value;
                  });
                },
              ),
              RadioListTile<theme>(
                activeColor: Colors.white,
                title: const Text(
                  'History',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: theme.History,
                groupValue: themee,
                onChanged: (theme? value) {
                  setState(() {
                    themee = value;
                  });
                },
              ),
              RadioListTile<theme>(
                activeColor: Colors.white,
                title: const Text(
                  'Human',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: theme.Human,
                groupValue: themee,
                onChanged: (theme? value) {
                  setState(() {
                    themee = value;
                  });
                },
              ),
              RadioListTile<theme>(
                activeColor: Colors.white,
                title: const Text(
                  'Quiz tips',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: theme.Quiz_tips,
                groupValue: themee,
                onChanged: (theme? value) {
                  setState(() {
                    themee = value;
                  });
                },
              ),
              RadioListTile<theme>(
                activeColor: Colors.white,
                title: const Text(
                  'Random',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
                value: theme.Random,
                groupValue: themee,
                onChanged: (theme? value) {
                  setState(() {
                    themee = value;
                  });
                },
              ),
              const Text(
                'Select mode:',
                style: TextStyle(
                  fontSize: 20,
                  color: Colors.white,
                  decoration: TextDecoration.underline,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Row(
                children: [
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black),
                                onPressed: (() {}),
                                child: const Text('Easy'))),
                        SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black),
                                onPressed: (() {}),
                                child: const Text('Normal'))),
                      ],
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.fromLTRB(0, 10, 0, 5),
                    width: MediaQuery.of(context).size.width / 2 - 20,
                    child: Column(
                      children: [
                        Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black),
                                onPressed: (() {}),
                                child: const Text('Hard'))),
                        SizedBox(
                            width: 150,
                            height: 50,
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.white,
                                    onPrimary: Colors.black),
                                onPressed: (() {}),
                                child: const Text('Super'))),
                      ],
                    ),
                  ),
                ],
              ),
              Center(
                child: SizedBox(
                  width: 128,
                  height: 128,
                  child: ButtonBattleCustom(
                    flex: 3,
                    fontSize: 30,
                    title: "",
                    url: 'assets/images/iconplay.png',
                    pageRoute: MaterialPageRoute(
                      builder: (context) => Playing_game(),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
