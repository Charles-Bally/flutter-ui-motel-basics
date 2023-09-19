import 'dart:ffi';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lottie/lottie.dart';
import 'package:ui_hotel_book/class/hotel.dart';
import 'package:ui_hotel_book/constants/AppIcons.dart';
import 'package:ui_hotel_book/constants/AppLottiesSrc.dart';
import 'package:ui_hotel_book/constants/AppShadow.dart';
import 'package:ui_hotel_book/pages/DetailsPage.dart';
import 'package:ui_hotel_book/styles/AppColors.dart';

class CardButton extends StatefulWidget {
  final Hotel myHotel;
  final String codification;
  const CardButton(
      {super.key, required this.myHotel, required this.codification});

  @override
  State<CardButton> createState() => _CardButtonState();
}

class _CardButtonState extends State<CardButton> with TickerProviderStateMixin {
  late final AnimationController _controller;
  bool bookmarked = false;
  late final String heroCode =
      widget.codification + widget.myHotel.id.toString();
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 1),
      vsync: this,
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        ElevatedButton(
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailsPage(
                  myHotel: widget.myHotel,
                  goodTag: heroCode,
                ),
              ),
            );
          },
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.all(0),
            elevation: 16,
            shadowColor: const Color.fromARGB(60, 138, 106, 255),
            shape: BeveledRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
          ),
          child: Container(
            width: 199,
            height: 313,
            decoration: BoxDecoration(
              boxShadow: [
                // AppShadow.cardShadow,
              ],
              borderRadius: BorderRadius.circular(16),
              color: AppColors.white,
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Hero(
                  tag: heroCode,
                  child: ClipRRect(
                    borderRadius: const BorderRadius.only(
                      topLeft: Radius.circular(16),
                      topRight: Radius.circular(16),
                    ),
                    child: Image.asset(
                      widget.myHotel.img,
                      width: double.maxFinite,
                      fit: BoxFit.cover,
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
                          widget.myHotel.name,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w600,
                            fontSize: 16,
                            color: AppColors.text,
                          ),
                        ),
                        const SizedBox(
                          height: 2,
                        ),
                        Text(
                          widget.myHotel.location,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 1,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: AppColors.secondary,
                          ),
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Text(
                          widget.myHotel.secondDescription,
                          overflow: TextOverflow.ellipsis,
                          maxLines: 3,
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: AppColors.secondaryText,
                          ),
                        ),
                        const SizedBox(
                          height: 16,
                        ),
                        Text(
                          "Start From",
                          style: GoogleFonts.inter(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                            color: AppColors.secondary,
                          ),
                        ),
                        const SizedBox(
                          height: 4,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.end,
                              children: [
                                Text(
                                  '\$${widget.myHotel.price.toString()}',
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w600,
                                    fontSize: 18,
                                    color: AppColors.price,
                                  ),
                                ),
                                const SizedBox(
                                  width: 3,
                                ),
                                Text(
                                  "/ Night",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 10,
                                    color: AppColors.secondary,
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              children: [
                                Text(
                                  "4.5",
                                  style: GoogleFonts.inter(
                                    fontWeight: FontWeight.w400,
                                    fontSize: 12,
                                    color: AppColors.primary,
                                  ),
                                ),
                                const SizedBox(
                                  width: 4,
                                ),
                                SvgPicture.asset(
                                  AppIcons.star,
                                  width: 14,
                                  height: 14,
                                ),
                              ],
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        Positioned(
          right: 15,
          top: 15,
          child: InkWell(
            onTap: () {
              setState(() {
                bookmarked = !bookmarked;
                if (bookmarked) {
                  _controller.forward();
                } else {
                  _controller.reset();
                }
              });
            },
            child: Container(
              decoration: BoxDecoration(
                color: AppColors.miniCard,
                borderRadius: BorderRadius.circular(6),
              ),
              child: LottieBuilder.asset(
                AppLottiesSrc.bookmarked,
                controller: _controller,
                fit: BoxFit.fill,
                width: 24,
                height: 24,
              ),
            ),
          ),
        ),
        Positioned(
          top: 138,
          left: 8,
          child: IgnorePointer(
            child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: 16,
                vertical: 4,
              ),
              decoration: BoxDecoration(
                color: AppColors.miniCard,
                borderRadius: BorderRadius.circular(6),
              ),
              child: Text(
                widget.myHotel.type,
                style: GoogleFonts.inter(
                  fontWeight: FontWeight.w500,
                  color: AppColors.primary,
                  fontSize: 10,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
