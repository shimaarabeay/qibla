import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qibla/features/home/domain/entity/bottom_navigation_bar_entity.dart';


class NavigationBarItem extends StatelessWidget {
  const NavigationBarItem({
    super.key,
    required this.isSelected,
    required this.bottomNavigationBarEntity,
  });

  final bool isSelected;
  final BottomNavigationBarEntity bottomNavigationBarEntity;

  @override
  Widget build(BuildContext context) {
    final color= Theme.of(context);
    final selectedColor = isSelected ? color.bottomNavigationBarTheme.selectedItemColor:  color.bottomNavigationBarTheme.unselectedItemColor;
    final selectedLabelStyle = isSelected ? color.bottomNavigationBarTheme.selectedLabelStyle:  color.bottomNavigationBarTheme.unselectedLabelStyle;

    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            bottomNavigationBarEntity.icon,
            color:selectedColor ,
            size: isSelected ? 26.sp : 24.sp,
          ),
          const SizedBox(height: 4),
          Text(
            bottomNavigationBarEntity.name,
            style: selectedLabelStyle
          ),
        ],
      ),
    );
  }
}