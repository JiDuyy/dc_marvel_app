import 'package:flutter/material.dart';
import 'IconHelper.dart';
import 'score.dart';

class Score_game extends StatefulWidget {
  Score_game(
      {super.key,
      required this.isWin,
      required this.Lever,
      required this.Score,
      required this.diamond,
      required this.hightscore,
      required this.quantiHammer,
      required this.quantiSpider,
      required this.quantiBat,
      required this.quantiShield});
  bool isWin;
  int Lever;
  int Score;
  int hightscore;
  int diamond;
  int quantiSpider;
  int quantiBat;
  int quantiHammer;
  int quantiShield;

  @override
  State<Score_game> createState() => _Score_gameState();
}

class _Score_gameState extends State<Score_game> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(.6),
      body: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
        const Spacer(),
        Expanded(
          flex: 3,
          child: Container(
            width: double.infinity,
            height: double.infinity,
            margin: const EdgeInsets.all(15),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: widget.isWin
                    ? const AssetImage('assets/images/FrameScore.png')
                    : const AssetImage('assets/images/FrameScore_Lose.png'),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(children: [
              Expanded(
                flex: 2,
                child: Center(
                  child: Text(
                    widget.isWin ? 'You Win' : 'You Lose',
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 30,
                      fontFamily: 'Horizon',
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(top: 5),
                  child: Text(
                    'Level ${widget.Lever.toString()}',
                    style: const TextStyle(
                      color: Color.fromARGB(255, 246, 250, 45),
                      fontSize: 20,
                      fontFamily: 'Horizon',
                    ),
                  ),
                ),
              ),
              const Spacer(),
              Expanded(
                flex: 3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                        flex: 4,
                        child: score(
                          nameScore: 'Hight Score',
                          point: widget.hightscore,
                          fontsiPoint: 15,
                          fontsi: 15,
                          isWin: widget.isWin,
                        )),
                    Expanded(
                        flex: 6,
                        child: score(
                          nameScore: 'Score',
                          point: widget.Score,
                          fontsiPoint: 45,
                          fontsi: 35,
                          isWin: widget.isWin,
                        )),
                  ],
                ),
              ),
              const Spacer(),
              const Expanded(
                child: Text(
                  'Help',
                  style: TextStyle(
                    color: Color.fromARGB(255, 169, 221, 255),
                    fontSize: 20,
                    fontFamily: 'Horizon',
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: SizedBox(
                  width: MediaQuery.of(context).size.width / 1.6,
                  child: Row(
                    children: [
                      iconHelper(
                        url: 'assets/images/icons_thor.png',
                        quantity: widget.quantiHammer,
                      ),
                      iconHelper(
                        url: 'assets/images/icon_nhen.png',
                        quantity: widget.quantiSpider,
                      ),
                      iconHelper(
                        url: 'assets/images/icons_doi.png',
                        quantity: widget.quantiBat,
                      ),
                      iconHelper(
                        url: 'assets/images/icons_khien.png',
                        quantity: widget.quantiShield,
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      '+${widget.diamond.toString()}',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontFamily: 'Horizon',
                      ),
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Image(
                        width: MediaQuery.of(context).size.width / 10,
                        image:
                            const AssetImage('assets/images/IconDiamond.png'))
                  ],
                ),
              ),
              Expanded(
                flex: 3,
                child: Container(
                  margin: EdgeInsets.only(
                    top: MediaQuery.of(context).size.width / 18,
                  ),
                  width: MediaQuery.of(context).size.width / 1.5,
                  child: Row(
                    children: [
                      const Spacer(),
                      Expanded(
                        flex: 4,
                        child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            margin: const EdgeInsets.fromLTRB(10, 8, 0, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const InkWell()),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 6,
                        child: Container(
                          width: double.infinity,
                          height: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Container(
                              margin: const EdgeInsets.only(top: 5, left: 3),
                              child: const Center(
                                child: Text(
                                  'OK',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 30,
                                    fontFamily: 'Horizon',
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 15,
                      ),
                      Expanded(
                        flex: 4,
                        child: Container(
                            width: double.infinity,
                            height: double.infinity,
                            margin: const EdgeInsets.fromLTRB(5, 8, 5, 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(18),
                            ),
                            child: const InkWell()),
                      ),
                      const Spacer()
                    ],
                  ),
                ),
              ),
            ]),
          ),
        ),
        const Spacer()
      ]),
    );
  }
}
