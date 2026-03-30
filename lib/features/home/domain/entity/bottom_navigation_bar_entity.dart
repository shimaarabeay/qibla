

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
    icon: Icons.home,
    name: 'الرئيسية',
  ),
  BottomNavigationBarEntity(
    icon: Icons.menu_book,
    name: 'المصحف',
  ),
  BottomNavigationBarEntity(
    icon: Icons.explore,
    name: 'القبلة',
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