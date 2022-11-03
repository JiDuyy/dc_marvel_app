import 'package:dc_marvel_app/components/card_player.dart';
import 'package:dc_marvel_app/components/widget_question.dart';
import 'package:flutter/material.dart';
import '../../components/Icon_helper.dart';
import '../../components/widget_answer.dart';

class Playing_battle extends StatefulWidget {
  Playing_battle({super.key});

  @override
  State<Playing_battle> createState() => _Playing_battleState();
}

class _Playing_battleState extends State<Playing_battle> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          padding: const EdgeInsets.all(15),
          width: double.infinity,
          height: double.infinity,
          decoration: const BoxDecoration(
              image: DecorationImage(
            image: AssetImage("assets/images/Edit_Background.jpg"),
            fit: BoxFit.cover,
          )),
          child: Column(children: [
            Expanded(
                flex: 6,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Expanded(
                          flex: 1,
                          child: Text(
                            'Battle',
                            style: TextStyle(
                                fontFamily: 'Horizon',
                                fontSize: 35,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          )),
                      // ignore: prefer_const_literals_to_create_immutables
                      Expanded(
                          flex: 2,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                card_player(
                                    url: 'assets/images/avatar_batman.png',
                                    point: 200)
                              ])),
                      Expanded(
                          flex: 4,
                          child: widget_Question(
                            title: 'Con Gì đập thì sống, không đập thì chết?',
                          )),
                      Expanded(child: widget_Answer(title: 'Con muỗi')),
                      Expanded(child: widget_Answer(title: 'Con lợn')),
                      Expanded(child: widget_Answer(title: 'Con tim')),
                      Expanded(child: widget_Answer(title: 'Con ruồi')),
                    ])),
            Expanded(
                flex: 1,
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      card_player(
                          url: 'assets/images/avatar_batman.png', point: 10000)
                    ])),
            Expanded(
                child: Container(
                    height: MediaQuery.of(context).size.width / 5,
                    width: MediaQuery.of(context).size.width,
                    margin: const EdgeInsets.only(top: 10),
                    padding: const EdgeInsets.all(2),
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.white.withOpacity(0.5)),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon_helper(
                              url: 'assets/images/icon_hammer.png', items: 5),
                          Icon_helper(
                              url: 'assets/images/icon_spider.png', items: 5),
                          Icon_helper(
                              url: 'assets/images/icon_bat.png', items: 5),
                          Icon_helper(
                              url: 'assets/images/icon_khien.png', items: 5),
                        ])))
          ])),
    );
  }
}
