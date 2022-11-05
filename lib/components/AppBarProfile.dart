import 'package:flutter/material.dart';


class AppBarProfile extends StatefulWidget {
  const AppBarProfile({
    Key? key,
  }) : super(key: key);

  @override
  State<AppBarProfile> createState() => _AppBarProfileState();
}

class _AppBarProfileState extends State<AppBarProfile> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            margin: const EdgeInsets.only(right: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/BgProfileLeft.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              alignment: Alignment.topLeft,
              margin: const EdgeInsets.only(left: 10, top: 10),
              child: Stack(
                alignment: Alignment.center,
                children: [
                  SizedBox(
                    width: MediaQuery.of(context).size.width / 15,
                    height: MediaQuery.of(context).size.width / 15,
                    child: Image.asset('assets/images/Avatar.jpg'),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width / 9,
                    height: MediaQuery.of(context).size.width / 9,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(
                            "assets/images/BorderAvatar.png"),
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        Expanded(
          flex: 2,
          child: Container(
            alignment: Alignment.center,
            margin: const EdgeInsets.only(bottom: 20),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/BgProfileBetween.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: const Text(
              'Chương 2',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: Colors.white,
                  letterSpacing: 2),
            ),
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.topRight,
            margin: const EdgeInsets.only(left: 10),
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/BgProfileRight.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Container(
              alignment: Alignment.topRight,
              margin: const EdgeInsets.only(right: 10, top: 10),
              width: MediaQuery.of(context).size.width / 8,
              height: MediaQuery.of(context).size.width / 8,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/icon_setting.png"),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
