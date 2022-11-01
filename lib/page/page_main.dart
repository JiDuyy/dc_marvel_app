import 'package:dc_marvel_app/components/AppBarCustom.dart';
import 'package:dc_marvel_app/page/buyEnergy.dart';
import 'package:dc_marvel_app/page/diamond_recharge.dart';
import 'package:dc_marvel_app/page/even.dart';
import 'package:dc_marvel_app/page/play_game.dart';
import 'package:dc_marvel_app/page/rank.dart';
import 'package:dc_marvel_app/page/setting.dart';
import 'package:dc_marvel_app/page/store.dart';
import 'package:flutter/material.dart';
import '../components/ButtomNavigationBarCustom.dart';

class PageMain extends StatefulWidget {
  const PageMain({super.key});

  @override
  State<PageMain> createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  PageController pageController = PageController();
  List<Widget> pages = [
    const Rank(),
    const Store(),
    const PlayGame(),
    const Even(),
    const Setting(),
    const DiamondRecharge(),
    const BuyEnergy(),
  ];

  // int selectIndex = 0;
  // void onPageChanged(int index) {
  //   setState(() {
  //     selectIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(45),
          child: AppBarCustom(
            pageController: pageController,
          ),
        ),
        body: PageView(
          controller: pageController,
          children: pages,
          // onPageChanged: onPageChanged,
        ),
        bottomNavigationBar:
            BottomNavigationBarCustom(pageController: pageController),
      ),
    );
  }
}
