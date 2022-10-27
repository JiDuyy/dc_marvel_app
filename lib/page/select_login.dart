import 'package:dc_marvel_app/components/ElvatedButtonCustom.dart';
import 'package:dc_marvel_app/components/TextCustom.dart';
import 'package:flutter/material.dart';

class SelectLogin extends StatefulWidget {
  const SelectLogin({super.key});

  @override
  State<SelectLogin> createState() => _SelectLoginState();
}

class _SelectLoginState extends State<SelectLogin> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/Edit_Background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.only(top: 50),
              width: 300,
              height: 300,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: NetworkImage(
                      "https://scontent.fsgn2-8.fna.fbcdn.net/v/t1.15752-9/311318560_1562539884178477_1893922937251951808_n.png?_nc_cat=102&ccb=1-7&_nc_sid=ae9488&_nc_ohc=vQTQL5AkDDUAX9m33tQ&_nc_ht=scontent.fsgn2-8.fna&oh=03_AdSJANSdstLeianJJlKGR9vGOpI6QVl2Bd5prxu9BzQ79g&oe=637ED391"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            TextCustom(
              title: 'I want to find a talent with superior understanding?',
            ),
            TextCustom(
              title: 'Let us help you change that.',
            ),
            const SizedBox(
              height: 100,
            ),
            const ElvatedButtonCustom(
              caption: 'LOGIN',
              colorBorder: Colors.white,
              colorBackground: Colors.black,
              colorTitle: Colors.white,
              opacity: 1.0,
            ),
            const SizedBox(
              height: 30,
            ),
            const ElvatedButtonCustom(
              caption: 'SIGN UP',
              colorBorder: Colors.white,
              colorBackground: Colors.black,
              colorTitle: Colors.white,
              opacity: 0.0,
            ),
          ],
        ),
      ),
    );
  }
}
