import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/features/home/domain/entity/bottom_navigation_bar_entity.dart';

import 'navigation_bar_item.dart';


class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({super.key, required this.onItemTapped});
  final ValueChanged<int> onItemTapped;
  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final color= Theme.of(context);
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: double.infinity,
        height: 70.h,
        decoration: ShapeDecoration(
          color: color.bottomNavigationBarTheme.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r)
          ),
          shadows: [
            BoxShadow(
              color: ColorManager.streakOrange,
              blurRadius: 10,
              offset: Offset(0, -1),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(
          children: bottomNavigationBarItems.asMap().entries.map((e) {
            var index = e.key;
            var entity = e.value;

            return Expanded(
              flex: index == selectedIndex ? 3 : 2,
              child: GestureDetector(
                onTap: () {
                  setState(() {
                    selectedIndex = index;
                    widget.onItemTapped(index);
                  });
                },
                child: NavigationBarItem(
                  isSelected: selectedIndex == index,
                  bottomNavigationBarEntity: entity,
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}