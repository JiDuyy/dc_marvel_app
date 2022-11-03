import 'package:flutter/material.dart';

class card_player extends StatefulWidget {
  card_player({super.key, required this.url, required this.point});

  String url;
  late int point;
  @override
  State<card_player> createState() => _card_playerState();
}

class _card_playerState extends State<card_player> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width / 10,
            backgroundImage: AssetImage(widget.url),
          ),
        ),
        Text(
          widget.point.toString(),
          style: const TextStyle(
              color: Colors.yellow,
              fontSize: 20,
              fontFamily: 'Horizon',
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}

class Card_player_wFind extends StatefulWidget {
  Card_player_wFind({super.key, required this.url, required this.Name});

  String url;
  String Name;
  @override
  State<Card_player_wFind> createState() => _Card_player_wFindState();
}

class _Card_player_wFindState extends State<Card_player_wFind> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: CircleAvatar(
            radius: MediaQuery.of(context).size.width / 10,
            backgroundImage: AssetImage(widget.url),
          ),
        ),
        Text(
          widget.Name,
          style: const TextStyle(
              color: Colors.yellow,
              fontSize: 20,
              fontFamily: 'Horizon',
              fontWeight: FontWeight.w700),
        )
      ],
    );
  }
}
