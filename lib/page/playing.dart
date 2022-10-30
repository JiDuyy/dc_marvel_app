import 'package:dc_marvel_app/components/Information_player.dart';
import 'package:flutter/material.dart';

class Playing_game extends StatefulWidget {
  Playing_game({super.key});

  @override
  State<Playing_game> createState() => _Playing_gameState();
}

class _Playing_gameState extends State<Playing_game> {
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
              children: [
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Info_Player(),
                      Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.fromLTRB(0, 10, 0, 20),
                          child: const Text(
                            'Question',
                            style: TextStyle(
                                fontSize: 35,
                                color: Colors.white,
                                decoration: TextDecoration.none),
                          )),
                      Container(
                          height: MediaQuery.of(context).size.width / 2,
                          width: MediaQuery.of(context).size.width,
                          padding: const EdgeInsets.all(20),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              border:
                                  Border.all(width: 1, color: Colors.white)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Bà đó bả chết bả bay lên trời. Hỏi bà chết năm bao nhiêu tuổi và tại sao?',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.end,
                                children: const [
                                  Text(
                                    '30',
                                    style: TextStyle(color: Colors.white),
                                  ),
                                  Icon(
                                    Icons.alarm,
                                    color: Colors.green,
                                  )
                                ],
                              )
                            ],
                          )),
                      Container_custom(title: 'Bò đá - 73 tuổi'),
                      Container_custom(title: 'Trâu đá - 73 tuổi'),
                      Container_custom(title: 'Hỏi trực tiếp'),
                      Container_custom(title: 'Không biết'),
                    ],
                  ),
                ),
                Container(
                  height: MediaQuery.of(context).size.width / 5,
                  width: MediaQuery.of(context).size.width,
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: Colors.white.withOpacity(0.5)),
                  child: Center(
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Icon_helper(
                              url: 'assets/images/icon_hammer.png', items: 5),
                          Icon_helper(
                              url: 'assets/images/icon_spider.png', items: 5),
                          Icon_helper(
                              url: 'assets/images/icon_bat.png', items: 5),
                          Icon_helper(
                              url: 'assets/images/icon_khien.png', items: 5),
                        ]),
                  ),
                )
              ],
            )),
      ),
    );
  }
}

class Container_custom extends StatefulWidget {
  Container_custom({super.key, required this.title});

  String title;
  @override
  State<Container_custom> createState() => _Container_customState();
}

class _Container_customState extends State<Container_custom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(10),
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.width / 10,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.5)),
      child: Center(
        child: Text(
          widget.title,
          style: const TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
    );
  }
}

class Icon_helper extends StatefulWidget {
  Icon_helper({super.key, required this.url, required this.items});

  String url;
  int items;
  @override
  State<Icon_helper> createState() => _Icon_helperState();
}

class _Icon_helperState extends State<Icon_helper> {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image(
          image: AssetImage(widget.url),
          width: MediaQuery.of(context).size.width / 7,
          height: MediaQuery.of(context).size.width / 7,
        ),
        Text(
          widget.items.toString(),
          style: const TextStyle(
              color: Colors.green, fontWeight: FontWeight.w700, fontSize: 15),
        ),
      ],
    );
  }
}
