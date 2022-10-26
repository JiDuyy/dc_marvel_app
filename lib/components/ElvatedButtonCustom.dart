import 'package:dc_marvel_app/page/login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ElvatedButtonCustom extends StatefulWidget {
  const ElvatedButtonCustom(
      {super.key,
      required this.caption,
      required this.colorBorder,
      required this.colorBackground,
      required this.colorTitle,
      required this.opacity});
  final String caption;
  final Color colorBorder;
  final Color colorBackground;
  final Color colorTitle;
  final double opacity;

  @override
  State<ElvatedButtonCustom> createState() => _ElvatedButtonCustomState();
}

class _ElvatedButtonCustomState extends State<ElvatedButtonCustom> {
  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () => {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const Login(),
          ),
        ),
      },
      style: ButtonStyle(
        backgroundColor: MaterialStatePropertyAll<Color>(
          widget.colorBackground.withOpacity(widget.opacity),
        ),
        shape: MaterialStateProperty.all(
          RoundedRectangleBorder(
            side: BorderSide(color: widget.colorBorder, width: 2.0),
            borderRadius: BorderRadius.circular(
              (10.0),
            ),
          ),
        ),
      ),
      child: SizedBox(
        width: double.infinity,
        height: 60,
        child: Center(
          child: Text(
            widget.caption,
            style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.w900,
                letterSpacing: 2.0,
                color: widget.colorTitle),
          ),
        ),
      ),
    );
  }
}
