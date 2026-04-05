import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../manager/cubit/surah_cubit.dart';
import '../../manager/cubit/surah_state.dart';
import 'up_next_item.dart';

class UpNextListView extends StatelessWidget {
  const UpNextListView({super.key});

  @override
  Widget build(BuildContext context) {
    final color = Theme.of(context);
    return BlocBuilder<SurahCubit, SurahState>(
      builder: (context, state) {
        if (state is SurahPlayerState) {
          final surahs = state.surahs;
          return ListView.builder(
            itemCount: surahs.length,
            itemBuilder: (context, index) {
              return UpNextItem(
                index: index,
                surah: surahs[index],
              );
            },
          );
        } else if (state is SurahLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state is SurahError) {
          return Center(
            child: Text(
              state.message,
              style:  TextStyle(color: color.colorScheme.secondary),
            ),
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}