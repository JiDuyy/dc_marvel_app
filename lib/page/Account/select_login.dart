import 'package:dc_marvel_app/components/ElvatedButtonCustom.dart';
import 'package:dc_marvel_app/components/TextCustom.dart';
import 'package:flutter/material.dart';

import 'login.dart';
import 'signup.dart';

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
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.width - 150,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/Logo_Text_DCMarvel.png"),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
            const TextCustom(
              title: 'I want to find a talent with superior understanding?',
            ),
            const TextCustom(
              title: 'Let us help you change that.',
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 5,
            ),
            ElvatedButtonCustom(
              caption: 'LOGIN',
              colorBorder: Colors.white,
              colorBackground: Colors.black,
              colorTitle: Colors.white,
              opacity: 1.0,
              routePage: MaterialPageRoute(
                builder: (context) => const Login(),
              ),
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height / 60,
            ),
            ElvatedButtonCustom(
              caption: 'SIGN UP',
              colorBorder: Colors.white,
              colorBackground: Colors.black,
              colorTitle: Colors.white,
              opacity: 0.0,
              routePage: MaterialPageRoute(
                builder: (context) => const SignUp(),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
