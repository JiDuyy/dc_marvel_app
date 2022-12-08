// ignore_for_file: prefer_const_constructors, non_constant_identifier_names, use_build_context_synchronously

import 'dart:async';
import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';

import 'ShowDialogCreateRoom.dart';

class ChangeRoom extends StatefulWidget {
  const ChangeRoom({super.key});

  @override
  State<ChangeRoom> createState() => _ChangeRoomState();
}

class _ChangeRoomState extends State<ChangeRoom> {
  TextEditingController roomId = TextEditingController();
  TextEditingController user = TextEditingController();
  final _db = FirebaseDatabase.instance.ref();
  final _auth = FirebaseAuth.instance;
  late StreamSubscription _subscription;
  @override
  void initState() {
    super.initState();
    _activateListeners();
  }

  void _activateListeners() {
    _subscription = _db
        .child('members/${_auth.currentUser!.uid}/userName')
        .onValue
        .listen((event) {
      final String username = event.snapshot.value.toString();
      setState(() {
        user.text = username;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.9),
      body: Center(
        child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.width / 2,
          padding: const EdgeInsets.fromLTRB(20, 10, 20, 10),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            image: DecorationImage(
              image: AssetImage("assets/images/FrameTitle.png"),
              fit: BoxFit.cover,
            ),
          ),
          child: Column(
            children: [
              Expanded(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      onPressed: () => Navigator.pop(context),
                      icon: Icon(Icons.logout),
                      color: Colors.white,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      onPressed: () async {
                        DatabaseReference ref = FirebaseDatabase.instance
                            .ref("members/${_auth.currentUser!.uid}");
                        DatabaseEvent event =
                            await ref.child('userName').once();
                        var RoomKey = Random().nextInt(9999);

                        final nextMember = <String, dynamic>{
                          'key': RoomKey,
                          'playerOne': {
                            'userName': event.snapshot.value,
                            'highScore': 0,
                          },
                          'playerTwo': {
                            'userName': "",
                            'highScore': 0,
                          },
                          'status': false,
                          'time': DateTime.now().millisecondsSinceEpoch,
                        };
                        _db.child('rooms/$RoomKey').set(nextMember);
                        Navigator.pop(context);
                        Navigator.of(context).push(
                          PageRouteBuilder(
                            opaque: false,
                            pageBuilder: (BuildContext context, _, __) =>
                                ShowDialogCreateRoom(
                              roomId: RoomKey.toString(),
                            ),
                          ),
                        );
                      },
                      child: Text("Create Room"),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  height: 55,
                  decoration: BoxDecoration(
                      border: Border.all(width: 1, color: Colors.white),
                      borderRadius: BorderRadius.circular(10)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                      ),
                      SizedBox(
                          width: 25,
                          child: Text(
                            'ID',
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          )),
                      Text(
                        "|",
                        style: TextStyle(fontSize: 33, color: Colors.grey),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextField(
                          style: TextStyle(color: Colors.white),
                          onChanged: (value) => roomId.text = value,
                          keyboardType: TextInputType.phone,
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "change id room",
                            hintStyle: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                    onPressed: () async {
                      _db
                          .child('rooms/${roomId.text}/playerTwo/userName')
                          .set(user.text);
                      print(roomId.text);
                      Navigator.pop(context);
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          opaque: false,
                          pageBuilder: (BuildContext context, _, __) =>
                              ShowDialogCreateRoom(
                            roomId: roomId.text.toString(),
                          ),
                        ),
                      );
                    },
                    child: Text("Let's go"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void deactivate() {
    _subscription.cancel();
    super.deactivate();
  }
}
