import 'package:flutter/material.dart';

import '../components/FrameEven.dart';

class Even extends StatefulWidget {
  const Even({super.key});

  @override
  State<Even> createState() => _EvenState();
}

class _EvenState extends State<Even> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Edit_Background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: SingleChildScrollView(
        child: Column(
          children: const [
            FrameEven(
              pathFrame: "assets/images/FrameEvenTwo.png",
              pathItemOne: 'assets/images/IconDiamond.png',
              pathItemTwo: 'assets/images/IconSet.png',
            ),
            FrameEven(
              pathFrame: "assets/images/FrameEven.png",
              pathItemOne: 'assets/images/icon_nhen.png',
              pathItemTwo: 'assets/images/icons_khien.png',
            ),
            FrameEven(
              pathFrame: "assets/images/FrameEvenThree.png",
              pathItemOne: 'assets/images/icons_doi.png',
              pathItemTwo: 'assets/images/icons_thor.png',
            ),
          ],
        ),
      ),
    );
  }
}
