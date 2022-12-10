// ignore_for_file: prefer_const_constructors

import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:dc_marvel_app/components/AppBarProfile.dart';
import 'package:dc_marvel_app/view/history.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';
import 'InfoProfile.dart';

class ShowDiaLogProfile extends StatefulWidget {
  const ShowDiaLogProfile({super.key});

  @override
  State<ShowDiaLogProfile> createState() => _ShowDiaLogProfileState();
}

class _ShowDiaLogProfileState extends State<ShowDiaLogProfile> {
  final auth = FirebaseAuth.instance;
  final _database = FirebaseDatabase.instance.ref();
  bool _isvisible = false;
  TextEditingController txtname = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.6),
      // title: const Text('Basic dialog title'),
      body: Center(
        child: SingleChildScrollView(
          child: SizedBox(
            height: MediaQuery.of(context).size.height / 1.3,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Expanded(
                  flex: 4,
                  child: Container(
                    width: double.infinity,
                    margin: EdgeInsets.all(15),
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image:
                            AssetImage('assets/images/profile_background.png'),
                        fit: BoxFit.fill,
                      ),
                    ),
                    child: StreamBuilder(
                        stream: _database
                            .child('members/${auth.currentUser!.uid}')
                            .onValue,
                        builder: ((context, snapshot) {
                          if (snapshot.hasData && snapshot.data != null) {
                            final data = Map<String, dynamic>.from(
                              Map<String, dynamic>.from(
                                  (snapshot.data as DatabaseEvent)
                                      .snapshot
                                      .value as Map<dynamic, dynamic>),
                            );
                            return Column(
                              children: [
                                Expanded(
                                    child: Row(
                                  mainAxisAlignment: MainAxisAlignment.end,
                                  children: const [
                                    Spacer(
                                      flex: 5,
                                    ),
                                    Expanded(
                                      flex: 3,
                                      child: Text(
                                        'Profile',
                                        style: TextStyle(
                                          color: Colors.white,
                                          fontSize: 30,
                                          fontFamily: 'Horizon',
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
                                        child: Stack(
                                          alignment: Alignment.center,
                                          fit: StackFit.loose,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.8,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  4.8,
                                              child: Image.asset(
                                                  'assets/images/AvatarChibi${data['image']}.jpg'),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.2,
                                              height: MediaQuery.of(context)
                                                      .size
                                                      .width /
                                                  3.2,
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
                                                  top: MediaQuery.of(context)
                                                          .size
                                                          .width /
                                                      4),
                                              child: Text(
                                                data['level'].toString(),
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
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            SizedBox(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width -
                                                  150,
                                              child: TextField(
                                                  textAlign: TextAlign.center,
                                                  controller: txtname,
                                                  readOnly: _isvisible == false
                                                      ? true
                                                      : false,
                                                  style: TextStyle(
                                                      color: Colors.white),
                                                  decoration: InputDecoration(
                                                    border: InputBorder.none,
                                                    label: _isvisible == false
                                                        ? Padding(
                                                            padding: EdgeInsets.only(
                                                                left: MediaQuery.of(
                                                                            context)
                                                                        .size
                                                                        .width /
                                                                    5.5),
                                                            child: Align(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              child: Text(
                                                                data[
                                                                    'userName'],
                                                                style:
                                                                    TextStyle(
                                                                  fontSize: 39,
                                                                  fontFamily:
                                                                      'Horizon',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                              ),
                                                            ),
                                                          )
                                                        : Text(''),
                                                  ),
                                                  onChanged: (value) {
                                                    setState(() {
                                                      txtname.text = value;
                                                    });
                                                  }),
                                            ),
                                            IconButton(
                                              onPressed: () {
                                                setState(() {
                                                  _isvisible == false
                                                      ? _isvisible = true
                                                      : _isvisible = false;
                                                });
                                                if (_isvisible == false) {
                                                  _database
                                                      .child(
                                                          'members/${auth.currentUser!.uid}/userName')
                                                      .set(txtname.text);
                                                  txtname.clear();
                                                }
                                              },
                                              icon: Icon(
                                                _isvisible == false
                                                    ? Icons.edit
                                                    : Icons.check,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Expanded(
                                        flex: 2,
                                        child: Column(
                                          children: [
                                            Expanded(
                                              child: Text(
                                                'ID: ${data['userID']}',
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15,
                                                  fontFamily: 'Horizon',
                                                ),
                                              ),
                                            ),
                                            Expanded(
                                              flex: 2,
                                              child: Row(
                                                children: [
                                                  Expanded(
                                                    child: Column(
                                                      children: [
                                                        Expanded(
                                                          child: Text(
                                                            data['highScore']
                                                                .toString(),
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Horizon',
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            'Points',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Horizon',
                                                                fontSize: 20),
                                                          ),
                                                        ),
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
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Horizon',
                                                                fontSize: 20),
                                                          ),
                                                        ),
                                                        Expanded(
                                                          child: Text(
                                                            'Gate',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontFamily:
                                                                    'Horizon',
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
                                      Expanded(
                                        flex: 2,
                                        child: Row(
                                          children: [
                                            infoProfle(
                                              Url: 'assets/images/cup.png',
                                              x: 1,
                                            ),
                                            infoProfle(
                                                Url: 'assets/images/RankKC.png',
                                                x: 5),
                                            Expanded(
                                              flex: 2,
                                              child: Column(
                                                children: [
                                                  Expanded(
                                                    child: SizedBox(
                                                      width:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      height:
                                                          MediaQuery.of(context)
                                                                  .size
                                                                  .width /
                                                              5,
                                                      child: InkWell(
                                                        onTap: () {
                                                          Navigator.of(context)
                                                              .push(
                                                            PageRouteBuilder(
                                                              opaque: false,
                                                              pageBuilder: (BuildContext
                                                                          context,
                                                                      _,
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
                                      Expanded(
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.start,
                                          children: [
                                            InkWell(
                                              onTap: (() {
                                                Navigator.pop(context);
                                              }),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
                                                height: MediaQuery.of(context)
                                                        .size
                                                        .width /
                                                    5,
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
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            );
                          }
                          return CircularProgressIndicator();
                        })),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
