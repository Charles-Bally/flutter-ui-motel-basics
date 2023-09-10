// ignore_for_file: prefer_const_constructors

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_hotel_book/components/MyAppBar.dart';
import 'package:ui_hotel_book/components/MyBottomBar.dart';
import 'package:ui_hotel_book/components/pagesComponents/SelectFilters.dart';
import 'package:ui_hotel_book/components/pagesComponents/SelectLocation.dart';
import 'package:ui_hotel_book/constants/AppShadow.dart';
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

class _MainPageState extends State<MainPage> {
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

  void handleChangeFilter(String filter) {
    setState(() {
      currentFilter = filter;
    });
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
            SelectFilters(
              setFilter: handleChangeFilter,
              currentFilter: currentFilter,
            ),
            SizedBox(
              height: 24,
            ),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(children: [
                SizedBox(
                  height: 350,
                  child: Stack(
                    clipBehavior: Clip.none,
                    children: [
                      Container(
                        width: 199,
                        height: 313,
                        decoration: BoxDecoration(
                          boxShadow: [
                            AppShadow.cardShadow,
                          ],
                          borderRadius: BorderRadius.circular(16),
                          color: AppColors.white,
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Hero(
                              tag: 1,
                              child: ClipRRect(
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(16),
                                  topRight: Radius.circular(16),
                                ),
                                child: Image.asset(
                                  "assets/images/temps/img1.jpg",
                                  width: double.maxFinite,
                                  height: 148,
                                ),
                              ),
                            ),
                            Expanded(
                                child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 16),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Blue Yoga Motel, Bali",
                                    style: GoogleFonts.inter(
                                      fontWeight: FontWeight.w600,
                                      fontSize: 16,
                                      color: AppColors.text,
                                    ),
                                  )
                                ],
                              ),
                            ))
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 24,
                ),
                Stack(
                  children: [
                    Container(
                      width: 199,
                      height: 313,
                      decoration: BoxDecoration(
                        boxShadow: [
                          AppShadow.cardShadow,
                        ],
                        color: const Color.fromARGB(255, 0, 0, 0),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 24,
                ),
              ]),
            )
          ],
        ),
      ),
    );
  }
}
