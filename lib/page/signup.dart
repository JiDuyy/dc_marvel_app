import 'package:dc_marvel_app/components/AdvancedSwitch.dart';
import 'package:dc_marvel_app/components/ElvatedButtonCustom.dart';
import 'package:dc_marvel_app/components/TextButtonCustom.dart';
import 'package:dc_marvel_app/components/TextCustom.dart';
import 'package:dc_marvel_app/components/TextFieldCustom.dart';
import 'package:dc_marvel_app/page/login.dart';
import 'package:dc_marvel_app/page/select_login.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _controller = ValueNotifier<bool>(false);

  bool status = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: double.infinity,
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage("assets/images/BackgroundLogo.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 160),
            child: Column(
              children: [
                TextCustom(
                  title: "Login to your account",
                ),
                const SizedBox(
                  height: 20,
                ),
                const TextFieldCustom(
                  label: 'Username',
                  icon: Icons.person,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFieldCustom(
                  label: 'Email Address',
                  icon: Icons.email,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFieldCustom(
                  label: 'Password',
                  icon: Icons.key,
                ),
                const SizedBox(
                  height: 10,
                ),
                const TextFieldCustom(
                  label: 'Confirm password',
                  icon: Icons.key,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  'By registering, you are agreeing to our Terms of use and Privacy Policy.',
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 50,
                ),
                const ElvatedButtonCustom(
                  caption: 'REGISTER',
                  colorBorder: Colors.white,
                  colorBackground: Colors.black,
                  colorTitle: Colors.white,
                  opacity: 1.0,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom(title: 'Already have an account?'),
                    TextButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const Login(),
                          ),
                        ),
                      },
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
