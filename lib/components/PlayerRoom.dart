import 'package:flutter/material.dart';

class PlayerRoom extends StatefulWidget {
  const PlayerRoom({
    Key? key,
    required this.size,
    required this.path,
  }) : super(key: key);

  final Size size;
  final String path;

  @override
  State<PlayerRoom> createState() => _PlayerRoomState();
}

class _PlayerRoomState extends State<PlayerRoom> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: widget.size.width / 4,
      height: widget.size.width / 4,
      child: Stack(
        children: [
          Align(
            alignment: Alignment.center,
            child: Image(
              image:  AssetImage(widget.path),
              width: widget.size.width / 6,
              height: widget.size.width / 6,
            ),
          ),
          Container(
            width: double.infinity,
            height: double.infinity,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/BorderAvatar.png"),
                fit: BoxFit.cover,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
