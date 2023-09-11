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
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: allFilters(),
      ),
    );
  }

  List<Widget> allFilters() {
    List<Widget> filterSelect = [];
    for (int index = 0; index < selectFilterValue.length; index++) {
      filterSelect.add(const SizedBox(width: 16));
      filterSelect.add(
        SizedBox(
          height: 350,
          child: InkWell(
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
          ),
        ),
      );
    }

    if (filterSelect.isNotEmpty) {
      filterSelect.add(const SizedBox(width: 16));
    }

    return filterSelect;
  }
}
