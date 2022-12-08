import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import '../components/FrameRank.dart';

class Rank extends StatefulWidget {
  const Rank({super.key});

  @override
  State<Rank> createState() => _RankState();
}

class _RankState extends State<Rank> {
  final _db = FirebaseDatabase.instance.ref().child('members');
  final _auth = FirebaseAuth.instance;

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
                  'RANK',
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
              child: FirebaseAnimatedList(
                  query: _db,
                  itemBuilder: (context, snapshot, animation, index) {
                    return FrameRank(
                      frameRank: 'assets/images/FrameGold.png',
                      pathAvatar: 'assets/images/IconLevel.png',
                      rank: '1',
                      userName: snapshot.child('userName').value.toString(),
                      pointRank: snapshot.child('highScore').value.toString(),
                    );
                  }),
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
                  userName: 'JiDuy',
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
