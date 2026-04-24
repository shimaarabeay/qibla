

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
class BottomNavigationBarEntity {
  final IconData icon;
  final String name;

  BottomNavigationBarEntity({
    required this.icon,
    required this.name,
  });
}

List<BottomNavigationBarEntity> get bottomNavigationBarItems => [
  BottomNavigationBarEntity(
    icon: Icons.headphones,
    name: "home.listen".tr(),
  ),
  BottomNavigationBarEntity(
    icon: Icons.menu_book,
    name:"home.mushaf".tr(),
  ),
  BottomNavigationBarEntity(
    icon: Icons.touch_app,
    name: "home.tasbeeh".tr(),
  ),
  BottomNavigationBarEntity(
    icon: Icons.settings,
    name: 'الإعدادات',
  ),
  BottomNavigationBarEntity(
    icon: Icons.more_horiz,
    name: 'المزيد',
  ),
];