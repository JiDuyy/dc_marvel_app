import 'package:flutter/material.dart';

class ButtonBattleCustom extends StatefulWidget {
  const ButtonBattleCustom(
      {super.key,
      required this.title,
      required this.url,
      required this.flex,
      required this.fontSize,
      required this.pageRoute});
  final String title;
  final String url;
  final int flex;
  final double fontSize;
  final MaterialPageRoute pageRoute;
  @override
  State<ButtonBattleCustom> createState() => _ButtonBattleCustomState();
}

class _ButtonBattleCustomState extends State<ButtonBattleCustom> {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: widget.flex,
      child: Container(
        height: 100,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage(widget.url),
            fit: BoxFit.fill,
          ),
        ),
        child: TextButton(
          onPressed: () => {
            Navigator.push(
              context,
              widget.pageRoute,
            ),
          },
          child: Center(
            child: Text(
              widget.title,
              style: TextStyle(
                fontSize: widget.fontSize,
                fontWeight: FontWeight.w900,
                color: Colors.black,
                fontFamily: 'Horizon',
              ),
            ),
          ),
        ),
      ),
    );
  }
}
