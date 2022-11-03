import 'package:dc_marvel_app/components/widget_question.dart';
import 'package:flutter/material.dart';
import '../../components/Icon_helper.dart';
import '../../components/widget_answer.dart';

class Playing_game extends StatefulWidget {
  Playing_game({super.key});

  @override
  State<Playing_game> createState() => _Playing_gameState();
}

class _Playing_gameState extends State<Playing_game> {
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
                            'Question',
                            style: TextStyle(
                                fontFamily: 'Horizon',
                                fontSize: 35,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          )),
                      Expanded(
                          flex: 4,
                          child: widget_Question(
                            title:
                                'Có bà đó bả bay lên lên trời. Hỏi bà đó chết năm bao nhiêu tuổi vì sao?',
                          )),
                      Expanded(child: widget_Answer(title: 'Bò đá - 73 tuổi')),
                      Expanded(
                          child: widget_Answer(title: 'Trâu đá - 73 tuổi')),
                      Expanded(child: widget_Answer(title: 'Hỏi trực tiếp')),
                      Expanded(child: widget_Answer(title: 'Không biết')),
                      const Spacer()
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
