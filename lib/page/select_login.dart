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
            image: AssetImage("assets/images/BackgroundLogoText.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: Container(
          margin: const EdgeInsets.only(top: 300),
          child: Column(
            children: [
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
      ),
    );
  }
}
