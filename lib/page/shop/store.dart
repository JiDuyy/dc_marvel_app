import 'package:flutter/material.dart';
import 'package:dc_marvel_app/components/BorderStore.dart';
import 'package:widget_and_text_animator/widget_and_text_animator.dart';

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
                    'CỬA HÀNG',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                      letterSpacing: 2.0,
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
                        quantity: 'Đang có: 2',
                        path: 'assets/images/icons_thor.png',
                        price: '50',
                        text: 'Búa Thor',
                        pathPrice: 'assets/images/IconDiamond.png'),
                  ),
                  Expanded(
                    child: BorderShop(
                        quantity: 'Đang có: 2',
                        path: 'assets/images/icon_nhen.png',
                        price: '100',
                        text: 'Nhện bắn tơ',
                        pathPrice: 'assets/images/IconDiamond.png'),
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
          ),
          const Spacer(flex: 1),
        ],
      ),
    );
  }
}
