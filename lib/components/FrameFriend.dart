import 'package:flutter/material.dart';

class FrameFriend extends StatefulWidget {
  const FrameFriend({
    Key? key,
    required this.frameRank,
    required this.pathAvatar,
    required this.userName,
  }) : super(key: key);

  final String frameRank;
  final String pathAvatar;
  final String userName;

  @override
  State<FrameFriend> createState() => _FrameFriendState();
}

class _FrameFriendState extends State<FrameFriend> {
  @override
  Widget build(BuildContext context) {
    return Container(
      // padding: const EdgeInsets.all(10),
      margin: const EdgeInsets.only(left: 20, right: 20, top: 10),
      width: double.infinity,
      height: 60,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(widget.frameRank),
          fit: BoxFit.fill,
        ),
      ),
      child: Row(
        children: [
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.only(left: 10),
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 28,
                        height: 28,
                        child: Image.asset(widget.pathAvatar),
                      ),
                      Container(
                        width: 40,
                        height: 40,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/BorderAvatar.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Container(
                    margin: const EdgeInsets.only(left: 20),
                    child: Text(
                      widget.userName,
                      style: const TextStyle(
                          fontSize: 20, fontWeight: FontWeight.w700),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(left: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.width / 10,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Icon_sms.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: () {},
                    child: Container(
                      width: MediaQuery.of(context).size.width / 10,
                      height: MediaQuery.of(context).size.width / 10,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage('assets/images/Icon_Gift.png'),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
