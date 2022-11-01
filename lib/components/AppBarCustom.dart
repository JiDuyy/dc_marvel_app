// ignore_for_file: file_names

import 'package:dc_marvel_app/components/TabAppCustom.dart';
import 'package:flutter/material.dart';

import '../page/select_login.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  @override
  Widget build(BuildContext context) => Container(
        color: Colors.black,
        child: SafeArea(
          child: Center(
            child: TabBar(
              indicatorColor: Colors.transparent,
              tabs: [
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: ((context) => const SelectLogin()),
                    ),
                  ),
                  child: Stack(
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
                              child: Image.asset('assets/images/IconLevel.png'),
                            ),
                            Container(
                              width: 40,
                              height: 40,
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
                    ],
                  ),
                ),
                TabAppBarCustom(
                  title: '8/20',
                  urlOne: "assets/images/IconSet.png",
                  urlTwo: 'assets/images/IconAdd.png',
                  color: Colors.green,
                  pageController: widget.pageController,
                  jumpToPage: 6,
                ),
                TabAppBarCustom(
                  title: '2022',
                  urlOne: "assets/images/IconDiamond.png",
                  urlTwo: 'assets/images/IconAdd.png',
                  color: Colors.white,
                  pageController: widget.pageController,
                  jumpToPage: 5,
                ),
              ],
            ),
          ),
        ),
      );
}
