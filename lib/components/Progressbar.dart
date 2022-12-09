import 'package:flutter/material.dart';
import 'package:quiver/async.dart';
import 'ShowDialogSettingPlayGame.dart';

class ProgressBar extends StatefulWidget {
  const ProgressBar({
    Key? key,
    required this.size,
  }) : super(key: key);

  final Size size;

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {
  int _start = 60;
  int _current = 60;

  @override
  void initState() {
    setState(() {
      startTimer();
    });
  }

  void startTimer() {
    CountdownTimer countDownTimer = CountdownTimer(
      Duration(seconds: _start),
      const Duration(seconds: 1),
    );

    var sub = countDownTimer.listen(null);
    sub.onData((duration) {
      setState(() {
        _current = _start - duration.elapsed.inSeconds;
      });
    });

    sub.onDone(() {
      print("Done");
      sub.cancel();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
            flex: 5,
            child: Container(
              width: double.infinity,
              height: MediaQuery.of(context).size.width / 14,
              decoration: BoxDecoration(
                border: Border.all(
                    color: const Color.fromARGB(255, 19, 19, 19), width: 3),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Stack(children: [
                LayoutBuilder(
                  builder: (context, constraints) => Container(
                    width: constraints.maxWidth * (_current / 60),
                    decoration: BoxDecoration(
                        gradient: const LinearGradient(
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight,
                            // ignore: prefer_const_literals_to_create_immutables
                            colors: [
                              Color.fromARGB(255, 183, 0, 255),
                              Color.fromARGB(255, 21, 228, 255)
                            ]),
                        borderRadius: BorderRadius.circular(40)),
                  ),
                ),
                Positioned.fill(
                    child: Row(
                  children: [
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      "$_current sec",
                      style: const TextStyle(
                        fontWeight: FontWeight.w700,
                        color: Colors.white,
                      ),
                    )
                  ],
                ))
              ]),
            )),
        Expanded(
          child: InkWell(
            onTap: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  opaque: false,
                  pageBuilder: (BuildContext context, _, __) =>
                      const ShowDialogSettingPlayGame(),
                ),
              );
            },
            child: Container(
              width: widget.size.width / 10,
              height: widget.size.width / 10,
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("assets/images/icon_setting.png"),
                  // fit: BoxFit.cover,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
