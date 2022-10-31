import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../components/BorderStore.dart';

class DiamondRecharge extends StatefulWidget {
  const DiamondRecharge({super.key});

  @override
  State<DiamondRecharge> createState() => _DiamondRechargeState();
}

class _DiamondRechargeState extends State<DiamondRecharge> {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
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
                'BUY DIAMOND',
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
                      path: 'assets/images/IconDiamond.png',
                      price: '1',
                      text: '15 Diamonds',
                      pathPrice: 'assets/images/IconDollar.png'),
                ),
                Expanded(
                  child: BorderShop(
                      quantity: '',
                      path: 'assets/images/IconDiamond.png',
                      price: '10',
                      text: '150 Diamonds',
                      pathPrice: 'assets/images/IconDollar.png'),
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
                      path: 'assets/images/IconDiamond.png',
                      price: '100',
                      text: '1500 Diamonds',
                      pathPrice: 'assets/images/IconDollar.png'),
                ),
                Expanded(
                  child: BorderShop(
                      quantity: '',
                      path: 'assets/images/IconDiamond.png',
                      price: '1000',
                      text: '15000 Diamonds',
                      pathPrice: 'assets/images/IconDollar.png'),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 50,
          )
        ],
      ),
    );
  }
}
