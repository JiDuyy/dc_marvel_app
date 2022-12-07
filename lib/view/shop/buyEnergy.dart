import 'package:flutter/material.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

import '../../components/BorderStore.dart';

class BuyEnergy extends StatefulWidget {
  const BuyEnergy({super.key});

  @override
  State<BuyEnergy> createState() => _BuyEnergyState();
}

class _BuyEnergyState extends State<BuyEnergy> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage("assets/images/galaxy.gif"),
          fit: BoxFit.fill,
        ),
      ),
      child: Column(
        children: [
          Expanded(
            flex: 2,
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromTop(),
              child: Container(
                margin: const EdgeInsets.only(top: 10),
                decoration: const BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage('assets/images/FrameTitle.png'),
                      fit: BoxFit.fill),
                ),
                child: const Align(
                  alignment: Alignment.center,
                  child: Text(
                    'BUY ENERGY',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: WidgetAnimator(
              incomingEffect: WidgetTransitionEffects.incomingSlideInFromLeft(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: BorderShop(
                      quantity: '+5 Energy',
                      path: 'assets/images/IconSet.png',
                      price: '50',
                      text: '',
                      pathPrice: 'assets/images/IconDiamond.png',
                    ),
                  ),
                  Expanded(
                    child: BorderShop(
                      quantity: '+10 Energy',
                      path: 'assets/images/IconEnergyOne.png',
                      price: '100',
                      text: '',
                      pathPrice: 'assets/images/IconDiamond.png',
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: WidgetAnimator(
              incomingEffect:
                  WidgetTransitionEffects.incomingSlideInFromRight(),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Expanded(
                    child: BorderShop(
                        quantity: '+15 Energy',
                        path: 'assets/images/IconEnergyTwo.png',
                        price: '150',
                        text: '',
                        pathPrice: 'assets/images/IconDiamond.png'),
                  ),
                  Expanded(
                    child: BorderShop(
                        quantity: '+20 Energys',
                        path: 'assets/images/IconEnergyThree.png',
                        price: '200',
                        text: '',
                        pathPrice: 'assets/images/IconDiamond.png'),
                  ),
                ],
              ),
            ),
          ),
          const Spacer(
            flex: 1,
          ),
        ],
      ),
    );
  }
}
