import 'package:flutter/material.dart';

import '../constants/AppIcons.dart';
import '../pages/MainPage.dart';
import '../styles/AppColors.dart';
import 'MyBottomNavigationItem.dart';

class MyBottomBar extends StatelessWidget {
  final Function callBackFunction;
  final Menus currentMenu;

  const MyBottomBar(
      {super.key, required this.callBackFunction, required this.currentMenu});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60,
      decoration: const BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(16),
          topRight: Radius.circular(16),
        ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          MyBottomBarItem(
            urlSvg: AppIcons.homeTabBar,
            onPressed: callBackFunction,
            currentMenu: currentMenu,
            mineIndex: Menus.home,
          ),
          MyBottomBarItem(
            urlSvg: AppIcons.favTabBar,
            onPressed: callBackFunction,
            currentMenu: currentMenu,
            mineIndex: Menus.favorite,
          ),
          MyBottomBarItem(
            urlSvg: AppIcons.historyTabBar,
            onPressed: callBackFunction,
            currentMenu: currentMenu,
            mineIndex: Menus.history,
          ),
          MyBottomBarItem(
            urlSvg: AppIcons.receptionTabBar,
            onPressed: callBackFunction,
            currentMenu: currentMenu,
            mineIndex: Menus.reception,
          ),
        ],
      ),
    );
  }
}
