import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_hotel_book/class/hotel.dart';
import 'package:ui_hotel_book/components/CardButton.dart';
import 'package:ui_hotel_book/components/pagesComponents/SelectFilters.dart';

class FiltersMotels extends StatefulWidget {
  const FiltersMotels({super.key});

  @override
  State<FiltersMotels> createState() => _FiltersMotelsState();
}

class _FiltersMotelsState extends State<FiltersMotels>
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
        SelectFilters(
          setFilter: handleChangeFilter,
          currentFilter: currentFilter,
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
            child: Row(children: allHotels()),
          ),
        )
      ],
    );
  }

  List<Widget> allHotels() {
    final hotelWidgets = _hotels
        .expand(
          (hotel) => [
            const SizedBox(width: 16),
            SizedBox(
              height: 350,
              child: CardButton(
                myHotel: hotel,
                codification: "FiltersMotels",
              ),
            ),
          ],
        )
        .toList();

    if (hotelWidgets.isNotEmpty) {
      hotelWidgets.add(const SizedBox(width: 16));
    }

    return hotelWidgets;
  }
}
