import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../styles/AppColors.dart';

class SelectFilters extends StatelessWidget {
  final Function setFilter;
  String? currentFilter;
  final List<String> selectFilterValue = [
    "All",
    "Guest house",
    "B&B",
    "Motel",
    "Hotel",
    "Flash",
    "Elo",
    "Silver",
  ];
  SelectFilters(
      {super.key, required this.setFilter, required this.currentFilter});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, index) => const SizedBox(
          width: 24,
        ),
        itemCount: selectFilterValue.length,
        itemBuilder: (context, index) {
          return InkWell(
            splashColor: Colors.transparent,
            highlightColor: Colors.transparent,
            onTap: () {
              setFilter(selectFilterValue[index]);
            },
            child: Text(
              selectFilterValue[index],
              style: GoogleFonts.inter(
                fontSize: 16,
                color: currentFilter == selectFilterValue[index]
                    ? AppColors.primary
                    : AppColors.secondary,
                fontWeight: FontWeight.w400,
              ),
            ),
          );
        },
      ),
    );
  }
}
