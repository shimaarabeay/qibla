import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qibla/core/app/di.dart';
import 'package:qibla/features/settings/presentation/manager/settings_cubit.dart';
import 'package:qibla/features/settings/presentation/view/widget/settings_view_body.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocProvider(
          create: (_) => instance<SettingsCubit>(),
      child: SettingsViewBody()),
    );
  }
}
