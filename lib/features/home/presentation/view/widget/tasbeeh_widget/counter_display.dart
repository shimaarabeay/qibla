import 'package:flutter/material.dart';
import '../../../../../../core/presentation/resources/color_manager.dart';
import '../../../manager/tasbeeh_cubit/tasbeeh_state.dart';

class CounterDisplay extends StatelessWidget {
  final TasbeehType type;
  final int count;

  const CounterDisplay({
    super.key,
    required this.type,
    required this.count,
  });

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);
    return Column(
      children: [
        Text(
          type.displayName,
          style: const TextStyle(
            fontSize: 26,
            fontWeight: FontWeight.w600,
            color: ColorManager.orange
          ),
        ),

        const SizedBox(height: 20),

        AnimatedSwitcher(
          duration: const Duration(milliseconds: 250),
          child: Text(
            "$count",
            key: ValueKey(count),
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
                color:ColorManager.orange
            ),
          ),
        ),
      ],
    );
  }
}