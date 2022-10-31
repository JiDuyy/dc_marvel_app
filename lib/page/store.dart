import 'package:flutter/material.dart';
import 'package:dc_marvel_app/components/BorderStore.dart';

class Store extends StatefulWidget {
  const Store({super.key});

  @override
  State<Store> createState() => _StoreState();
}

class _StoreState extends State<Store> {
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
                'Cửa hàng',
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
                    quantity: 'Đang có: 2',
                    path: 'assets/images/icons_thor.png',
                    price: '50',
                    text: 'Búa Thor'
                    ,pathPrice: 'assets/images/IconDiamond.png'
                  ),
                ),
                Expanded(
                  child: BorderShop(
                    quantity: 'Đang có: 2',
                    path: 'assets/images/icon_nhen.png',
                    price: '100',
                    text: 'Nhện bắn tơ'
                    ,pathPrice: 'assets/images/IconDiamond.png'
                  ),
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
                      quantity: 'Đang có: 0',
                      path: 'assets/images/icons_doi.png',
                      price: '150',
                      text: 'Dơi bóng đêm',
                      pathPrice: 'assets/images/IconDiamond.png'),
                ),
                Expanded(
                  child: BorderShop(
                      quantity: 'Đang có: 1',
                      path: 'assets/images/icons_khien.png',
                      price: '100',
                      text: 'Lá chắn',
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
