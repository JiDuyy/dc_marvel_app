import 'package:dc_marvel_app/components/TabAppCustom.dart';
import 'package:flutter/material.dart';

import '../page/login.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.black,
      child: SafeArea(
        child: Center(
          child: TabBar(
            indicatorColor: Colors.transparent,
            tabs: [
              Stack(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Container(
                      width: 72,
                      height: 15,
                      color: Colors.white,
                      child: Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Container(
                              width: 30,
                              color: Colors.green,
                            ),
                          ),
                          const Align(
                            alignment: Alignment.center,
                            child: Text(
                              'Lv. 2',
                              style: TextStyle(color: Colors.black),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: Stack(
                      alignment: Alignment.center,
                      children: [
                        SizedBox(
                          width: 28,
                          height: 28,
                          child: Image.network(
                              'https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/290530994_1474685339654007_6340689977015220634_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=8yVwH3Ni9D4AX-OSBWA&_nc_ht=scontent.fsgn2-1.fna&oh=00_AfCXGE8Gix35SecG943SVnadDD-7hykVMf78sJEgfhSTNA&oe=635FDB90'),
                        ),
                        Container(
                          width: 40,
                          height: 40,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image:
                                  AssetImage("assets/images/BorderAvatar.png"),
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              TabAppBarCustom(
                title: '8/20',
                urlOne: "assets/images/IconSet.png",
                urlTwo: 'assets/images/IconAdd.png',
                color: Colors.green,
                pageController: widget.pageController,
              ),
              TabAppBarCustom(
                title: '2022',
                urlOne: "assets/images/IconDiamond.png",
                urlTwo: 'assets/images/IconAdd.png',
                color: Colors.white,
                pageController: widget.pageController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
