import 'package:dc_marvel_app/components/ElvatedButtonCustom.dart';
import 'package:dc_marvel_app/components/TextCustom.dart';
import 'package:dc_marvel_app/components/TextFieldCustom.dart';
import 'package:dc_marvel_app/page/login.dart';
import 'package:flutter/material.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
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
                title: "Change Password",
              ),
              const SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.person,
                    size: 50,
                    color: Colors.white,
                  ),
                  SizedBox(
                    width: 20,
                  ),
                  Text(
                    'JiDuy',
                    style: TextStyle(
                      fontSize: 26,
                      color: Colors.white,
                      letterSpacing: 3.0,
                      fontWeight: FontWeight.w700,
                    ),
                  )
                ],
              ),
              const TextFieldCustom(
                label: 'Email Address',
                icon: Icons.email,
              ),
              const SizedBox(
                height: 10,
              ),
              const TextFieldCustom(
                label: 'New Password',
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
                'Change your password, will help your account be more secure and limit the risk.',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 50,
              ),
              ElvatedButtonCustom(
                caption: 'SUBMIT',
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
