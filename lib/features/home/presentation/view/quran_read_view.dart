import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:qibla/core/app/di.dart';
import 'package:qibla/features/home/presentation/manager/quran_read_cubit/surah_cubit.dart';

import 'widget/quran_read_widgets/quran_read_view_body.dart';

class QuranReadView extends StatelessWidget {
  const QuranReadView({super.key});

  @override
  Widget build(BuildContext context) {
    return  BlocProvider(
        create: (context) =>instance<SurahCubit>(),
      child:QuranReadBody());
  }
}


