import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qibla/features/home/presentation/view/widget/tasbeeh_widget/tasbeeh_button.dart';

import '../../../manager/tasbeeh_cubit/tasbeeh_cubit.dart';
import '../../../manager/tasbeeh_cubit/tasbeeh_state.dart';
import 'counter_display.dart';
import 'tasbeeh_action_button.dart';

class TasbeehViewBody extends StatelessWidget {
  const TasbeehViewBody({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: BlocBuilder<TasbeehCubit, TasbeehState>(
          builder: (context, state) {
            final color = Theme.of(context);
            final cubit = context.read<TasbeehCubit>();
            return Container(
              color: color.colorScheme.background,
              child: Column(
                children: [
                  const SizedBox(height: 16),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: TasbeehType.values.map((type) {
                      return TasbeehButton(
                        type: type,
                        isSelected: state.type == type,
                        onTap: () => cubit.changeTasbeeh(type),
                      );
                    }).toList(),
                  ),
                  const SizedBox(height: 40),
                  CounterDisplay(
                    type: state.type,
                    count: state.count,
                  ),
                  const Spacer(),
                  TasbeehActionButton(
                    onTap: () {
                      HapticFeedback.lightImpact();
                      cubit.increment();
                    },
                  ),

                  const SizedBox(height: 20),

                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor:color.colorScheme.primary,
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(14),
                      elevation: 3,
                    ),
                    onPressed: () {
                      HapticFeedback.mediumImpact();
                      cubit.reset();
                    },
                    child: Text(
                      "home.reset".tr(),
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}
