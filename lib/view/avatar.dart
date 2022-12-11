import 'package:flutter/material.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_auth/firebase_auth.dart';

class Avatar extends StatefulWidget {
  const Avatar({super.key});

  @override
  State<Avatar> createState() => _AvatarState();
}

class _AvatarState extends State<Avatar> {
  final _database = FirebaseDatabase.instance.ref();
  final auth = FirebaseAuth.instance;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0),
      body: InkWell(
        onTap: () => Navigator.pop(context),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 200,
                width: 200,
                color: Colors.white.withOpacity(0.9),
                child: ListView(
                  children: [
                    InkWell(
                      onTap: () {
                        _database
                            .child('members/${auth.currentUser!.uid}/image')
                            .set(1);
                      },
                      child: Image.asset('assets/images/AvatarChibi1.jpg'),
                    ),
                    Image.asset('assets/images/AvatarChibi2.jpg'),
                  ],
                ), 
              ),
            ],
          ),
        ),
      ),
    );
  }
}
