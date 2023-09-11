// ignore_for_file: prefer_const_constructors
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ui_hotel_book/class/hotel.dart';
import 'package:ui_hotel_book/components/CardButton.dart';
import 'package:ui_hotel_book/components/MyAppBar.dart';
import 'package:ui_hotel_book/components/MyBottomBar.dart';
import 'package:ui_hotel_book/components/pagesComponents/FiltersMotels.dart';
import 'package:ui_hotel_book/components/pagesComponents/SelectFilters.dart';
import 'package:ui_hotel_book/components/pagesComponents/SelectLocation.dart';
import 'package:ui_hotel_book/styles/AppColors.dart';

enum Menus {
  home,
  favorite,
  history,
  reception,
}

class MainPage extends StatefulWidget {
  const MainPage({super.key});

  @override
  State<MainPage> createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> with TickerProviderStateMixin {
  Menus currentMenu = Menus.home;
  String? currentLocation;
  String currentFilter = "All";

  List _hotels = [];

  void handleClickOnTab(Menus pressed) {
    setState(() {
      currentMenu = pressed;
    });
  }

  void handleChangeLocation(String location) {
    setState(() {
      currentLocation = location;
    });
  }

  Future<void> readJson(String url) async {
    final String response = await rootBundle.loadString(url);
    final data = await jsonDecode(response);
    List arrayHotel = data["hotels"];
    setState(() {
      _hotels = arrayHotel.map((json) => Hotel.fromJson(json)).toList();
      print(_hotels);
    });
  }

  @override
  void initState() {
    super.initState();
    readJson("assets/data-hotel.json");
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(),
      bottomNavigationBar: MyBottomBar(
        callBackFunction: handleClickOnTab,
        currentMenu: currentMenu,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 16),
        child: ListView(
          children: [
            SizedBox(
              height: 24,
            ),
            SelectLocation(
              currentLocation: currentLocation,
              handleChangeLocation: handleChangeLocation,
            ),
            SizedBox(
              height: 24,
            ),
            FiltersMotels(),
          ],
        ),
      ),
    );
  }
}
