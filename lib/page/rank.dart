import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import '../components/FrameRank.dart';

class Rank extends StatefulWidget {
  const Rank({super.key});

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  final FirebaseAuth _auth = FirebaseAuth.instance;
  final Stream<QuerySnapshot> _usersStream = FirebaseFirestore.instance
      .collection('user')
      .orderBy('highCore', descending: true)
      .snapshots(includeMetadataChanges: true);
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/galaxy.gif"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Container(
              margin: const EdgeInsets.only(top: 10, bottom: 10),
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/FrameTitle.png'),
                  fit: BoxFit.fill,
                ),
              ),
              child: const Align(
                alignment: Alignment.center,
                child: Text(
                  'XẾP HẠNG',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 10,
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(),
              child: StreamBuilder<QuerySnapshot>(
                stream: _usersStream,
                builder: (BuildContext context,
                    AsyncSnapshot<QuerySnapshot> snapshot) {
                  if (snapshot.hasError) {
                    return const Text('Something went wrong');
                  }

                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Text("Loading");
                  }

                  return ListView(
                    children:
                        snapshot.data!.docs.map((DocumentSnapshot document) {
                      Map<String, dynamic> data =
                          document.data()! as Map<String, dynamic>;
                      return FrameRank(
                        frameRank: 'assets/images/FrameGold.png',
                        pathAvatar: 'assets/images/IconLevel.png',
                        rank: '1',
                        userName: data['userName'],
                        pointRank: data['highCore'].toString(),
                      );
                    }).toList(),
                  );
                },
              ),
            ),
          ),
          Expanded(
            flex: 2,
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingScaleDown(),
              child: Container(
                margin: const EdgeInsets.only(top: 15, bottom: 5),
                child: const FrameRank(
                  frameRank: 'assets/images/FrameGold.png',
                  pathAvatar: 'assets/images/IconLevel.png',
                  rank: '1',
                  userName: "JiDuy",
                  pointRank: '9999',
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
