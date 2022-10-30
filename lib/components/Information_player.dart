import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';

class Info_Player extends StatefulWidget {
  const Info_Player({super.key});

  @override
  State<Info_Player> createState() => _Info_PlayerState();
}

class _Info_PlayerState extends State<Info_Player> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Stack(
              alignment: Alignment.center,
              children: [
                SizedBox(
                  width: 34,
                  height: 34,
                  child: Image.network(
                      'https://scontent.fsgn2-1.fna.fbcdn.net/v/t39.30808-6/290530994_1474685339654007_6340689977015220634_n.jpg?_nc_cat=107&ccb=1-7&_nc_sid=09cbfe&_nc_ohc=8yVwH3Ni9D4AX-OSBWA&_nc_ht=scontent.fsgn2-1.fna&oh=00_AfCXGE8Gix35SecG943SVnadDD-7hykVMf78sJEgfhSTNA&oe=635FDB90'),
                ),
                Container(
                  width: 50,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/BorderAvatar.png"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(
              width: 10,
            ),
            Stack(
              children: [
                Container(
                  height: 15,
                  width: 90,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.white,
                  ),
                ),
                Container(
                  height: 15,
                  width: 30,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(4),
                    color: Colors.blue,
                  ),
                ),
              ],
            ),
          ],
        ),
        Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color.fromARGB(129, 255, 255, 255),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                '9.99',
                style: TextStyle(
                    color: Colors.yellow,
                    fontSize: 16,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                width: 10,
              ),
              Image.asset(
                'assets/images/icon_diamond_add.png',
                width: 35,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
