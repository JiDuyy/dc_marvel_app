import 'package:flutter/material.dart';
import 'package:flutter_advanced_switch/flutter_advanced_switch.dart';
import 'Account/select_login.dart';

class Setting extends StatefulWidget {
  const Setting({super.key});

  @override
  State<Setting> createState() => _SettingState();
}

class _SettingState extends State<Setting> {
  final _controller = ValueNotifier<bool>(true);
  final _controllerTwo = ValueNotifier<bool>(true);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.black,
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/Edit_Background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // color: Colors.green,
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'CÀI ĐẶT',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 28,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 2.5,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 8,
            child: Column(
              // mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 25, bottom: 25),
                  height: 60,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ButonSetting.png'),
                      // fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/IconMusic.png',
                        height: 50,
                      ),
                      AdvancedSwitch(
                        activeColor: Colors.blue,
                        inactiveColor: Colors.orange,
                        width: 80,
                        height: 40,
                        controller: _controller,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      )
                    ],
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(
                      left: 20, right: 20, top: 25, bottom: 25),
                  height: 60,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/images/ButonSetting.png'),
                      // fit: BoxFit.cover,
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Image.asset(
                        'assets/images/IconVolume.png',
                        height: 50,
                      ),
                      AdvancedSwitch(
                        activeColor: Colors.blue,
                        inactiveColor: Colors.orange,
                        width: 80,
                        height: 40,
                        controller: _controllerTwo,
                        borderRadius: const BorderRadius.all(
                          Radius.circular(8),
                        ),
                      )
                    ],
                  ),
                ),
                InkWell(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => const SelectLogin(),
                    ),
                  ),
                  child: Container(
                    margin: const EdgeInsets.only(
                        left: 20, right: 20, top: 25, bottom: 25),
                    height: 60,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage('assets/images/ButonSetting.png'),
                        // fit: BoxFit.cover,
                      ),
                    ),
                    child: const Align(
                      alignment: Alignment.center,
                      child: Text(
                        'Đăng xuất',
                        style: TextStyle(
                          fontSize: 23,
                          fontWeight: FontWeight.w700,
                          color: Colors.red,
                          letterSpacing: 2.0,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
