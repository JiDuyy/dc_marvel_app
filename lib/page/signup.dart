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
                    image: NetworkImage(
                        "https://scontent.fsgn2-1.fna.fbcdn.net/v/t1.15752-9/307136166_5711498448930000_8801265812646520856_n.png?_nc_cat=105&ccb=1-7&_nc_sid=ae9488&_nc_ohc=8yD_JmhO9AoAX-Tc9_G&tn=2WdwbRTrk16c5GyD&_nc_ht=scontent.fsgn2-1.fna&oh=03_AdRkGX_zf4Lw-czPPBND-0HdM_t6dAuQcJaOVEfQINuxLw&oe=63859F95"),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              TextCustom(
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
    );
  }
}
