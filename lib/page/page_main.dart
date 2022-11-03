import 'package:dc_marvel_app/components/AppBarCustom.dart';
import 'package:dc_marvel_app/page/even.dart';
import 'package:dc_marvel_app/page/rank.dart';
import 'package:dc_marvel_app/page/setting.dart';
import 'package:flutter/material.dart';
import '../components/ButtomNavigationBarCustom.dart';
import 'play/play_game.dart';
import 'shop/buyEnergy.dart';
import 'shop/diamond_recharge.dart';
import 'shop/store.dart';

class PageMain extends StatefulWidget {
  const PageMain({super.key});

  @override
  State<PageMain> createState() => _PageMainState();
}

class _PageMainState extends State<PageMain> {
  PageController pageController = PageController(initialPage: 2);
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
      // initialIndex: 2,
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
