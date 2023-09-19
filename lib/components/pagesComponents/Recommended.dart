import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_hotel_book/class/hotel.dart';
import 'package:ui_hotel_book/components/CardButton.dart';
import 'package:ui_hotel_book/components/pagesComponents/SelectFilters.dart';
import 'package:ui_hotel_book/constants/AppIcons.dart';
import 'package:ui_hotel_book/styles/AppColors.dart';

class Recommended extends StatefulWidget {
  const Recommended({super.key});

  @override
  State<Recommended> createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended>
    with TickerProviderStateMixin {
  String currentFilter = "All";
  List _hotels = [];

  void handleChangeFilter(String filter) {
    setState(() {
      currentFilter = filter;
    });
  }

  Future<void> readJson(String url) async {
    final String response = await rootBundle.loadString(url);
    final data = await jsonDecode(response);
    List arrayHotel = data["hotels"];
    setState(() {
      _hotels = arrayHotel.map((json) => Hotel.fromJson(json)).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    readJson("assets/data-hotel.json");
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Recommended",
                style: GoogleFonts.inter(
                  color: AppColors.text,
                  fontSize: 18,
                  fontWeight: FontWeight.w100,
                ),
              ),
              InkWell(
                  onTap: () {},
                  child: Row(
                    children: [
                      Text(
                        "See All",
                        style: GoogleFonts.inter(
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                          color: AppColors.price,
                        ),
                      ),
                      Transform.rotate(
                        angle: -90 * (3.14159265359 / 180),
                        child: SvgPicture.asset(
                          AppIcons.arrowDown,
                          colorFilter: const ColorFilter.mode(
                            AppColors.price,
                            BlendMode.srcIn,
                          ),
                        ),
                      )
                    ],
                  ))
            ],
          ),
        ),
        const SizedBox(
          height: 24,
        ),
        NotificationListener<OverscrollIndicatorNotification>(
          onNotification: (overscroll) {
            overscroll
                .disallowIndicator(); // Désactive l'effet de rétroaction bleu
            return true;
          },
          child: SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const ClampingScrollPhysics(),
            child: Row(children: recommendedHotels()),
          ),
        )
      ],
    );
  }

  List<Widget> recommendedHotels() {
    final recommendedHotelWidgets = _hotels
        .where((hotel) => (hotel as Hotel).recommended == true)
        .expand(
          (hotel) => [
            const SizedBox(width: 16),
            SizedBox(
              height: 350,
              child: CardButton(
                myHotel: hotel,
                codification: "Recommanded",
              ),
            ),
          ],
        )
        .toList();

    if (recommendedHotelWidgets.isNotEmpty) {
      recommendedHotelWidgets.add(const SizedBox(width: 16));
    }

    return recommendedHotelWidgets;
  }
}
