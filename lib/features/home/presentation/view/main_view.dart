import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qibla/features/home/presentation/view/widget/main_view_body.dart';

import '../../../../core/app/di.dart';
import '../../domain/repositories/surah_repository.dart';
import '../manager/cubit/surah_cubit.dart';


class MainView extends StatelessWidget {
  const MainView({super.key});
  @override
  Widget build(BuildContext context) {
    return
      BlocProvider(
        create: (context) =>
    SurahCubit(repository: instance<SurahRepository>())..init(),
     child:  MainViewBody ());
  }
}