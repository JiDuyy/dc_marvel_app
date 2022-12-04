// ignore_for_file: prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dc_marvel_app/components/AppBarProfile.dart';
import 'package:dc_marvel_app/page/history.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'InfoProfile.dart';

class ShowDiaLogProfile extends StatefulWidget {
  const ShowDiaLogProfile({super.key});

  @override
  State<ShowDiaLogProfile> createState() => _ShowDiaLogProfileState();
}

class _ShowDiaLogProfileState extends State<ShowDiaLogProfile> {
  CollectionReference user = FirebaseFirestore.instance.collection('user');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.6),
      // title: const Text('Basic dialog title'),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Spacer(),
          Expanded(
            flex: 4,
            child: Container(
              margin: EdgeInsets.all(15),
              decoration: BoxDecoration(
                  image: DecorationImage(
                image: AssetImage('assets/images/profile_background.png'),
                fit: BoxFit.fill,
              )),
              child: Column(
                children: [
                  Expanded(
                      child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Spacer(
                        flex: 5,
                      ),
                      Expanded(
                        flex: 3,
                        child: WidgetAnimator(
                          incomingEffect: WidgetTransitionEffects
                              .incomingSlideInFromRight(),
                          child: Text(
                            'Profile',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 30,
                              fontFamily: 'Horizon',
                            ),
                          ),
                        ),
                      ),
                      Spacer()
                    ],
                  )),
                  Expanded(
                    flex: 13,
                    child: Column(
                      children: [
                        Expanded(
                          flex: 2,
                          child: WidgetAnimator(
                            incomingEffect: WidgetTransitionEffects
                                .incomingSlideInFromTop(),
                            child: Stack(
                              alignment: Alignment.center,
                              fit: StackFit.loose,
                              children: [
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width / 4.8,
                                  height:
                                      MediaQuery.of(context).size.width / 4.8,
                                  child:
                                      Image.asset('assets/images/Avatar.jpg'),
                                ),
                                Container(
                                  width:
                                      MediaQuery.of(context).size.width / 3.2,
                                  height:
                                      MediaQuery.of(context).size.width / 3.2,
                                  decoration: const BoxDecoration(
                                    image: DecorationImage(
                                      image: AssetImage(
                                          "assets/images/BoderAvatar2.png"),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Container(
                                  margin: EdgeInsets.only(
                                      top: MediaQuery.of(context).size.width /
                                          4),
                                  child: Text(
                                    '2',
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 11,
                                      fontFamily: 'Horizon',
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: WidgetAnimator(
                            incomingEffect: WidgetTransitionEffects
                                .incomingSlideInFromTop(),
                            child: FutureBuilder<DocumentSnapshot>(
                              future: user
                                  .doc(FirebaseAuth.instance.currentUser!.uid)
                                  .get(),
                              builder: (BuildContext context,
                                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                                if (snapshot.hasError) {
                                  return Text("Something went wrong");
                                }

                                if (snapshot.hasData &&
                                    !snapshot.data!.exists) {
                                  return Text("Document does not exist");
                                }

                                if (snapshot.connectionState ==
                                    ConnectionState.done) {
                                  Map<String, dynamic> data = snapshot.data!
                                      .data() as Map<String, dynamic>;
                                  return AnimatedTextKit(
                                    totalRepeatCount: 100,
                                    animatedTexts: [
                                      ColorizeAnimatedText(
                                        '${data['userName']}',
                                        textStyle: colorizeTextStyle,
                                        colors: colorizeColors,
                                      ),
                                    ],
                                    isRepeatingAnimation: true,
                                  );
                                }

                                return Text("loading");
                              },
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: WidgetAnimator(
                            incomingEffect: WidgetTransitionEffects
                                .incomingSlideInFromRight(),
                            child: Column(
                              children: [
                                Expanded(
                                  child: FutureBuilder<DocumentSnapshot>(
                                    future: user
                                        .doc(FirebaseAuth
                                            .instance.currentUser!.uid)
                                        .get(),
                                    builder: (BuildContext context,
                                        AsyncSnapshot<DocumentSnapshot>
                                            snapshot) {
                                      if (snapshot.hasError) {
                                        return Text("Something went wrong");
                                      }

                                      if (snapshot.hasData &&
                                          !snapshot.data!.exists) {
                                        return Text("Document does not exist");
                                      }

                                      if (snapshot.connectionState ==
                                          ConnectionState.done) {
                                        Map<String, dynamic> data =
                                            snapshot.data!.data()
                                                as Map<String, dynamic>;
                                        return Text(
                                          'ID: ${data['userID']}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 15,
                                            fontFamily: 'Horizon',
                                          ),
                                        );
                                      }

                                      return Text("loading");
                                    },
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Row(
                                    children: [
                                      Expanded(
                                        child: Column(
                                          children: const [
                                            Expanded(
                                                child: Text(
                                              '300',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Horizon',
                                                  fontSize: 20),
                                            )),
                                            Expanded(
                                                child: Text(
                                              'Points',
                                              style: TextStyle(
                                                  color: Colors.white,
                                                  fontFamily: 'Horizon',
                                                  fontSize: 20),
                                            )),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        child: Column(
                                          children: const [
                                            Expanded(
                                              child: Text(
                                                '10',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Horizon',
                                                    fontSize: 20),
                                              ),
                                            ),
                                            Expanded(
                                              child: Text(
                                                'Gate',
                                                style: TextStyle(
                                                    color: Colors.white,
                                                    fontFamily: 'Horizon',
                                                    fontSize: 20),
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          flex: 2,
                          child: WidgetAnimator(
                            incomingEffect: WidgetTransitionEffects
                                .incomingSlideInFromLeft(),
                            child: Row(
                              children: [
                                infoProfle(
                                  Url: 'assets/images/cup.png',
                                  x: 1,
                                ),
                                infoProfle(
                                    Url: 'assets/images/RankKC.png', x: 5),
                                Expanded(
                                  flex: 2,
                                  child: Column(
                                    children: [
                                      Expanded(
                                        child: SizedBox(
                                          width: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          height: MediaQuery.of(context)
                                                  .size
                                                  .width /
                                              5,
                                          child: InkWell(
                                            onTap: () {
                                              Navigator.of(context).push(
                                                PageRouteBuilder(
                                                  opaque: false,
                                                  pageBuilder:
                                                      (BuildContext context, _,
                                                              __) =>
                                                          const History(),
                                                ),
                                              );
                                            },
                                            child: Image.asset(
                                                'assets/images/history.ico'),
                                          ),
                                        ),
                                      ),
                                      Expanded(
                                        child: Text(
                                          'History',
                                          style: TextStyle(
                                            color: Colors.white,
                                            fontSize: 20,
                                            fontFamily: 'Horizon',
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Spacer()
                              ],
                            ),
                          ),
                        ),
                        Expanded(
                          child: WidgetAnimator(
                            incomingEffect: WidgetTransitionEffects
                                .incomingSlideInFromLeft(),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                InkWell(
                                  onTap: (() {
                                    Navigator.pop(context);
                                  }),
                                  child: Container(
                                    width:
                                        MediaQuery.of(context).size.width / 5,
                                    height:
                                        MediaQuery.of(context).size.width / 5,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/backhome.png"),
                                        fit: BoxFit.cover,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Spacer()
        ],
      ),
    );
  }
}
