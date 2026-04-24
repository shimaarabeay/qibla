import 'package:flutter/material.dart';
import 'package:qibla/core/presentation/resources/color_manager.dart';
import '../../../manager/tasbeeh_cubit/tasbeeh_state.dart';

class TasbeehButton extends StatelessWidget {
  final TasbeehType type;
  final bool isSelected;
  final VoidCallback onTap;

  const TasbeehButton({
    super.key,
    required this.type,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);
    return TextButton(
      onPressed: onTap,
      child: Text(
        type.displayName,
        style: TextStyle(
          fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
          color: isSelected ? ColorManager.orange: ColorManager.gray,
        ),
      ),
    );
  }
}