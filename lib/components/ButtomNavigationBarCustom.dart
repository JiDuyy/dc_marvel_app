import 'package:flutter/material.dart';

class BottomNavigationBarCustom extends StatefulWidget {
  const BottomNavigationBarCustom({super.key});

  @override
  State<BottomNavigationBarCustom> createState() =>
      _BottomNavigationBarCustomState();
}

BottomNavigationBarItem _createBottomNavigationBarItem(String urlImg) {
  return BottomNavigationBarItem(
    icon: SizedBox(
      width: 40,
      height: 40,
      child: Image.asset(
        urlImg,
        fit: BoxFit.cover,
      ),
    ),
    label: 'null',
  );
}

class _BottomNavigationBarCustomState extends State<BottomNavigationBarCustom> {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      backgroundColor: Colors.blueAccent[400],
      selectedFontSize: 10,
      unselectedFontSize: 10,
      selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      unselectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
      showSelectedLabels: false,
      showUnselectedLabels: false,
      items: [
        _createBottomNavigationBarItem('assets/images/icon_crown.png'),
        _createBottomNavigationBarItem('assets/images/icon_shop.png'),
        _createBottomNavigationBarItem('assets/images/icon_battle.png'),
        _createBottomNavigationBarItem('assets/images/icon_tickets.png'),
        _createBottomNavigationBarItem('assets/images/icon_setting.png'),
      ],
    );
  }
}
