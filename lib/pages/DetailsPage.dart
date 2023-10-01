import 'package:flutter/material.dart';

import '../class/hotel.dart';

class DetailsPage extends StatefulWidget {
  final Hotel myHotel;
  final String goodTag;
  DetailsPage({super.key, required this.myHotel, required this.goodTag});

  @override
  State<DetailsPage> createState() => _DetailsPageState();
}

class _DetailsPageState extends State<DetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Stack(
              children: [
                Hero(
                  tag: widget.goodTag,
                  child: Image.asset(
                    widget.myHotel.img,
                    width: double.infinity,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  top: 11,
                  left: 13,
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
