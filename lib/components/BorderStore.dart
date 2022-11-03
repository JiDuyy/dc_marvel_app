// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BorderShop extends StatefulWidget {
  const BorderShop(
      {super.key,
      required this.quantity,
      required this.path,
      required this.price,
      required this.text,
      required this.pathPrice});
  final String quantity;
  final String path;
  final String price;
  final String text;
  final String pathPrice;
  @override
  State<BorderShop> createState() => _BorderShopState();
}

class _BorderShopState extends State<BorderShop> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.black.withOpacity(0.6),
        ),
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(right: 4),
                child: Align(
                  alignment: Alignment.centerRight,
                  child: Text(
                    widget.quantity,
                    style: const TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 15),
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 8,
              child: Image.asset(
                widget.path,
              ),
            ),
            Expanded(
              flex: 2,
              child: Text(
                widget.text,
                style: const TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                color: Colors.green,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(right: 8.0),
                      child: Image.asset(
                        widget.pathPrice,
                        width: 30,
                      ),
                    ),
                    Text(
                      widget.price,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
