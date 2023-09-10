import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:ui_hotel_book/pages/MainPage.dart';
import 'package:ui_hotel_book/styles/AppColors.dart';

class MyBottomBarItem extends StatelessWidget {
  final String urlSvg;
  final Function onPressed;
  final Menus currentMenu;
  final Menus mineIndex;
  const MyBottomBarItem({
    required this.urlSvg,
    required this.onPressed,
    required this.currentMenu,
    required this.mineIndex,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: IconButton(
        splashColor: Colors.transparent,
        onPressed: () => onPressed(mineIndex),
        icon: SvgPicture.asset(
          urlSvg,
          colorFilter: ColorFilter.mode(
            currentMenu == mineIndex ? AppColors.primary : AppColors.secondary,
            BlendMode.srcIn,
          ),
        ),
      ),
    );
  }
}
