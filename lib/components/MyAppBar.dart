import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:ui_hotel_book/styles/AppColors.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  const MyAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.transparent,
      leading: IconButton(
        splashRadius: 22,
        icon: SvgPicture.asset(
          "assets/images/icons/search.svg",
          width: 18,
          height: 18,
        ),
        onPressed: () {},
      ),
      title: Text(
        "Explore",
        style: GoogleFonts.inter(
            color: AppColors.text, fontWeight: FontWeight.w700),
      ),
      centerTitle: true,
      elevation: 0,
      actions: [
        const CircleAvatar(
          radius: 20,
          backgroundColor: Colors.transparent,
          backgroundImage: AssetImage(
            "assets/images/temps/profile-img.png",
          ),
        ),
        IconButton(
          splashRadius: 24,
          iconSize: 24,
          onPressed: () {},
          icon: SizedBox(
            width: 24,
            child: SvgPicture.asset(
              "assets/images/icons/menu.svg",
            ),
          ),
        ),
      ],
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
