import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/AppIcons.dart';
import '../../constants/AppShadow.dart';
import '../../styles/AppColors.dart';

// ignore: must_be_immutable
class SelectLocation extends StatelessWidget {
  String? currentLocation;
  Function handleChangeLocation;

  SelectLocation({
    super.key,
    required this.currentLocation,
    required this.handleChangeLocation,
  });

  final List<String> locationList = [
    'Bali, Indonesia',
    'Abidjan, Adjamé',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [AppShadow.primaryShadowMedium],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Select location",
            style: GoogleFonts.inter(
              color: AppColors.text,
              letterSpacing: -0.24,
              fontSize: 12,
              fontWeight: FontWeight.w400,
            ),
          ),
          DropdownButtonHideUnderline(
            child: DropdownButton2<String>(
              isExpanded: true,
              value: currentLocation,
              onChanged: (String? value) {
                handleChangeLocation(value);
              },
              customButton: Padding(
                padding: const EdgeInsets.symmetric(vertical: 3),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Expanded(
                      child: Text(
                        currentLocation ?? "Select location",
                        style: GoogleFonts.inter(
                          color: AppColors.text,
                          fontWeight: FontWeight.w600,
                          letterSpacing: -0.24,
                        ),
                      ),
                    ),
                    SvgPicture.asset(
                      AppIcons.arrowDown,
                      width: 24,
                      height: 24,
                    ),
                  ],
                ),
              ),
              dropdownStyleData: DropdownStyleData(
                maxHeight: 200,
                width: 200,
                offset: const Offset(-8, -10),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: AppColors.white,
                ),
              ),
              menuItemStyleData: const MenuItemStyleData(
                padding: EdgeInsets.only(left: 8),
              ),
              items: locationList
                  .map((String item) => DropdownMenuItem<String>(
                        value: item,
                        child: Text(
                          item,
                          style: GoogleFonts.inter(
                            color: AppColors.text,
                            fontWeight: FontWeight.w700,
                            letterSpacing: -0.24,
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}
