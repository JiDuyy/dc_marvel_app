import 'package:dc_marvel_app/components/ElvatedButtonCustom.dart';
import 'package:dc_marvel_app/components/TextCustom.dart';
import 'package:dc_marvel_app/components/TextFieldCustom.dart';
import 'package:dc_marvel_app/page/login.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
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
          child: Column(
            children: [
              Container(
                padding: const EdgeInsets.all(20),
                width: 350,
                height: 220,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/LogoTextDCMarvel.png"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              const TextCustom(
                title: "Create your account",
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
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 50,
              ),
              ElvatedButtonCustom(
                caption: 'REGISTER',
                colorBorder: Colors.white,
                colorBackground: Colors.black,
                colorTitle: Colors.white,
                opacity: 1.0,
                routePage: MaterialPageRoute(
                  builder: (context) => const Login(),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const TextCustom(title: 'Already have an account?'),
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
    );
  }
}
