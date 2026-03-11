import 'package:flutter/material.dart';

class SliderObject {
  final String title;
  final String description;
  final String imageUrl;
  final String name;
  final Widget? overlayWidget;

  SliderObject({
    required this.title,
    required this.description,
    required this.imageUrl,
    required this.name,
    this.overlayWidget,
  });
}