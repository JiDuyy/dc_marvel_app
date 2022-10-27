import 'package:dc_marvel_app/components/AdvancedSwitch.dart';
import 'package:dc_marvel_app/components/ElvatedButtonCustom.dart';
import 'package:dc_marvel_app/components/TextCustom.dart';
import 'package:dc_marvel_app/components/TextFieldCustom.dart';
import 'package:dc_marvel_app/page/forgot_password.dart';
import 'package:dc_marvel_app/page/signup.dart';
import 'package:flutter/material.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
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
            image: AssetImage("assets/images/Edit_Background.jpg"),
            fit: BoxFit.cover,
          ),
        ),
        child: SingleChildScrollView(
          child: Container(
            margin: const EdgeInsets.only(top: 20),
            child: Column(
              children: [
                Container(
                  padding: const EdgeInsets.all(20),
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
                  label: 'Username',
                  icon: Icons.key,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const AdvancedSwitchCustom(),
                    TextButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const ForgotPassword(),
                          ),
                        ),
                      },
                      child: const Text(
                        'Forgot Password?',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextCustom(title: 'Don\'t have an account? '),
                    TextButton(
                      onPressed: () => {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SignUp(),
                          ),
                        ),
                      },
                      child: const Text(
                        'Sign Up',
                        style: TextStyle(
                          color: Colors.white,
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w700,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
