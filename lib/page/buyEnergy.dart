import 'package:flutter/material.dart';

import '../components/BorderStore.dart';

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
          image: AssetImage("assets/images/Edit_Background.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Column(
        children: [
          const Expanded(
            flex: 2,
            child: Align(
              alignment: Alignment.center,
              child: Text(
                'BUY ENERGY',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: BorderShop(
                      quantity: '',
                      path: 'assets/images/IconSet.png',
                      price: '50',
                      text: '5 Energy',
                      pathPrice: 'assets/images/IconDiamond.png'),
                ),
                Expanded(
                  child: BorderShop(
                      quantity: '',
                      path: 'assets/images/IconEnergyOne.png',
                      price: '100',
                      text: '10 Energy',
                      pathPrice: 'assets/images/IconDiamond.png'),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 5,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: const [
                Expanded(
                  child: BorderShop(
                      quantity: '',
                      path: 'assets/images/IconEnergyTwo.png',
                      price: '150',
                      text: '15 Energy',
                      pathPrice: 'assets/images/IconDiamond.png'),
                ),
                Expanded(
                  child: BorderShop(
                      quantity: '',
                      path: 'assets/images/IconEnergyThree.png',
                      price: '200',
                      text: '20 Energy',
                      pathPrice: 'assets/images/IconDiamond.png'),
                ),
              ],
            ),
          ),
          const SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
