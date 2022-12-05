// ignore_for_file: prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dc_marvel_app/components/TextCustom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:pinput/pinput.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import 'login_phone.dart';

class Verify extends StatefulWidget {
  const Verify({super.key});
  static String verify = "";

  @override
  State<Verify> createState() => _VerifyState();
}

class _VerifyState extends State<Verify> {
  final FirebaseAuth auth = FirebaseAuth.instance;
  final FirebaseFirestore _fireStore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    final defaultPinTheme = PinTheme(
      width: 56,
      height: 56,
      textStyle: TextStyle(
          fontSize: 20, color: Colors.white, fontWeight: FontWeight.w600),
      decoration: BoxDecoration(
        border: Border.all(color: Color.fromRGBO(234, 239, 243, 1), width: 2),
        borderRadius: BorderRadius.circular(9),
      ),
    );

    final focusedPinTheme = defaultPinTheme.copyDecorationWith(
      border: Border.all(color: Colors.green),
      borderRadius: BorderRadius.circular(8),
    );

    final submittedPinTheme = defaultPinTheme.copyWith(
      decoration: defaultPinTheme.decoration?.copyWith(
          // color: Colors.grey,
          ),
    );
    // final errorPinTheme = defaultPinTheme.copyWith(
    //   decoration: defaultPinTheme.decoration?.copyWith(
    //     color: Colors.red,
    //   ),
    // );
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
              WidgetAnimator(
                incomingEffect: WidgetTransitionEffects.incomingScaleDown(),
                child: Container(
                  width: size.width,
                  height: size.width - 150,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/LogoText3D.png"),
                      // fit: BoxFit.cover,
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: size.height / 30,
              ),
              WidgetAnimator(
                incomingEffect: WidgetTransitionEffects.incomingScaleUp(),
                child: Column(
                  children: const [
                    TextCustom(
                      title:
                          'I want to find a talent with superior understanding?',
                    ),
                    TextCustom(
                      title: 'Let us help you change that.',
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: size.height / 16,
              ),
              WidgetAnimator(
                incomingEffect:
                    WidgetTransitionEffects.incomingSlideInFromLeft(),
                child: Pinput(
                  // androidSmsAutofillMethod:  AndroidSmsAutofillMethod.smsUserConsentApi,
                  length: 6,
                  defaultPinTheme: defaultPinTheme,
                  focusedPinTheme: focusedPinTheme,
                  submittedPinTheme: submittedPinTheme,
                  // errorPinTheme: errorPinTheme,
                  showCursor: true,
                  onCompleted: (pin) async {
                    try {
                      PhoneAuthCredential credential =
                          PhoneAuthProvider.credential(
                              verificationId: LoginPhone.verify, smsCode: pin);
                      // Sign the user in (or link) with the credential

                      await auth.signInWithCredential(credential);
                      FirebaseFirestore.instance
                          .collection('user')
                          .doc(auth.currentUser!.uid)
                          .get()
                          .then((DocumentSnapshot documentSnapshot) {
                        if (!documentSnapshot.exists) {
                          _fireStore
                              .collection('user')
                              .doc(auth.currentUser!.uid)
                              .set({
                            'userID': auth.currentUser!.uid,
                            'userName': "user name",
                            'level': 1,
                            'chapter': 1,
                            'highCore': 1000,
                            'rank': 1,
                            'diamond': 0,
                          });
                        }
                      });

                      Navigator.pushNamedAndRemoveUntil(
                          context, "home", (route) => false);
                    } catch (e) {
                      return print("wrong otp");
                    }
                  },
                ),
              ),
              SizedBox(
                height: 20,
              ),
              const Text(
                'Didn\'t receive code?',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 15,
                  letterSpacing: 1.2,
                ),
              ),
              InkWell(
                onTap: () => Navigator.pop(context),
                child: const Text(
                  'Resend',
                  style: TextStyle(
                    color: Colors.blue,
                    fontSize: 15,
                    letterSpacing: 1.2,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
