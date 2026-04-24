import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/features/home/domain/entity/bottom_navigation_bar_entity.dart';

import 'navigation_bar_item.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  const CustomBottomNavigationBar({
    super.key,
    required this.onItemTapped,
  });

  final ValueChanged<int> onItemTapped;

  @override
  State<CustomBottomNavigationBar> createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState
    extends State<CustomBottomNavigationBar> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: EdgeInsets.all(8.0.r),
      child: Container(
        width: double.infinity,
        height: 60.h,
        decoration: ShapeDecoration(
          color: theme.bottomNavigationBarTheme.backgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.r),
          ),
          shadows: [
            BoxShadow(
              color: ColorManager.streakOrange.withOpacity(0.4),
              blurRadius: 10.r,
              offset: const Offset(0, -1),
            )
          ],
        ),

        child: Row(
          children: bottomNavigationBarItems.asMap().entries.map((e) {
            final index = e.key;
            final entity = e.value;

            final isSelected = selectedIndex == index;

            return Expanded(
              flex: isSelected ? 3 : 2,


              child: Material(
                color: Colors.transparent,
                child: InkWell(
                  borderRadius: BorderRadius.circular(10.r),

                  onTap: () {
                    if (selectedIndex == index) return;

                    setState(() {
                      selectedIndex = index;
                    });

                    widget.onItemTapped(index);
                  },

                  child: Center(
                    child: NavigationBarItem(
                      isSelected: isSelected,
                      bottomNavigationBarEntity: entity,
                    ),
                  ),
                ),
              ),
            );
          }).toList(),
        ),
      ),
    );
  }
}