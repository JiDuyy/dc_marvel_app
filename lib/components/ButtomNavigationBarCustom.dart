import 'package:flutter/material.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

BottomNavigationBarItem _createBottomNavigationBarItem(
    String urlImg, String label) {
  return BottomNavigationBarItem(
    icon: SizedBox(
      width: 40,
      height: 40,
      child: Image.asset(
        urlImg,
        fit: BoxFit.cover,
      ),
    ),
    label: label,
  );
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  void onItemTap(selectItems) {
    widget.pageController.jumpToPage(selectItems);
  }

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: 2,
      onTap: onItemTap,
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blueAccent[400],
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _createBottomNavigationBarItem(
          'assets/images/icon_crown.png',
          'Rank',
        ),
        _createBottomNavigationBarItem(
          'assets/images/icon_shop.png',
          'Store',
        ),
        _createBottomNavigationBarItem(
          'assets/images/icon_battle.png',
          'PlayGame',
        ),
        _createBottomNavigationBarItem(
          'assets/images/icon_tickets.png',
          'Even',
        ),
        _createBottomNavigationBarItem(
          'assets/images/icon_setting.png',
          'Setting',
        ),
      ],
    );
  }
}
