import 'package:flutter/material.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import 'package:qibla/core/presentation/resources/styles_manager.dart';

AppBar buildAppBar(
    BuildContext context, {
      required String title,
      bool showBackButton = true,
      Widget? actionIcon,
    }) {
  return AppBar(
    backgroundColor: ColorManager.brown.withOpacity(0.18),
    leading: Visibility(
      visible: showBackButton,
      child: GestureDetector(
        onTap: () {
          Navigator.pop(context);
        },
        child: Icon(
          Icons.arrow_back_ios_new,
          color: ColorManager.white,
        ),
      ),
    ),
    centerTitle: true,
    title: Text(
      title,
      style: getBoldStyle(color: ColorManager.white),
    ),

    actions: actionIcon != null ? [actionIcon] : [],
  );
}
