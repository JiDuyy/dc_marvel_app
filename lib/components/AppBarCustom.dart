// ignore_for_file: file_names

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dc_marvel_app/components/TabAppCustom.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AppBarCustom extends StatefulWidget {
  const AppBarCustom({super.key, required this.pageController});
  final PageController pageController;

  @override
  State<AppBarCustom> createState() => _AppBarCustomState();
}

class _AppBarCustomState extends State<AppBarCustom> {
  CollectionReference user = FirebaseFirestore.instance.collection('user');
  final Stream<DocumentSnapshot<Map<String, dynamic>>> _usersStream =
      FirebaseFirestore.instance
          .collection('user')
          .doc(FirebaseAuth.instance.currentUser!.uid)
          .snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) => Container(
        decoration: BoxDecoration(
          color: const Color.fromARGB(255, 91, 54, 255),
          border: Border.all(
            color: Colors.yellow,
            width: 1,
          ),
        ),
        child: SafeArea(
          child: Center(
            child: FutureBuilder<DocumentSnapshot>(
              future: user.doc(FirebaseAuth.instance.currentUser!.uid).get(),
              builder: (BuildContext context,
                  AsyncSnapshot<DocumentSnapshot> snapshot) {
                if (snapshot.hasError) {
                  return const Text("Something went wrong");
                }

                if (snapshot.hasData && !snapshot.data!.exists) {
                  return const Text("Document does not exist");
                }

                if (snapshot.connectionState == ConnectionState.done) {
                  Map<String, dynamic> data =
                      snapshot.data!.data() as Map<String, dynamic>;
                  return TabBar(
                    indicatorColor: Colors.transparent,
                    tabs: [
                      Stack(
                        children: [
                          Align(
                            alignment: Alignment.centerRight,
                            child: Container(
                              width: MediaQuery.of(context).size.width / 5,
                              height: 15,
                              color: Colors.black,
                              child: Align(
                                alignment: Alignment.centerLeft,
                                child: Container(
                                  width: 30,
                                  color: Colors.green,
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: Alignment.centerLeft,
                            child: Stack(
                              alignment: Alignment.center,
                              children: [
                                SizedBox(
                                  width: 38,
                                  height: 38,
                                  child: Image.asset(
                                      'assets/images/IconLevel.png'),
                                ),
                                Text(
                                  data['level'].toString(),
                                  style: const TextStyle(
                                    fontSize: 12,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      TabAppBarCustom(
                        title: '8/20',
                        urlOne: "assets/images/IconSet.png",
                        urlTwo: 'assets/images/IconAdd.png',
                        color: Colors.green,
                        pageController: widget.pageController,
                        jumpToPage: 6,
                      ),
                      TabAppBarCustom(
                        title: data['diamond'].toString(),
                        urlOne: "assets/images/IconDiamond.png",
                        urlTwo: 'assets/images/IconAdd.png',
                        color: Colors.black,
                        pageController: widget.pageController,
                        jumpToPage: 5,
                      ),
                    ],
                  );
                }
                return const Text(
                  "loading...",
                );
              },
            ),
          ),
        ),
      );
}
