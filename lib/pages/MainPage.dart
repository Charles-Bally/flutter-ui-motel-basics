// ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:ui_hotel_book/components/MyAppBar.dart';
import 'package:ui_hotel_book/components/MyBottomBar.dart';
import 'package:ui_hotel_book/components/pagesComponents/FiltersMotels.dart';
import 'package:ui_hotel_book/components/pagesComponents/Recommended.dart';
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

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: MyAppBar(),
      extendBody: true,
      bottomNavigationBar: MyBottomBar(
        callBackFunction: handleClickOnTab,
        currentMenu: currentMenu,
      ),
      body: ListView(
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
          SizedBox(
            height: 16,
          ),
          Recommended(),
        ],
      ),
    );
  }
}
