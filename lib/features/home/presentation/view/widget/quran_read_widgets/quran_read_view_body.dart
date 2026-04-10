import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../manager/quran_read_cubit/surah_cubit.dart';
import '../../../manager/quran_read_cubit/surah_state.dart';

class QuranReadBody extends StatelessWidget {
  const QuranReadBody({super.key});

  @override
  Widget build(BuildContext context) {
    final cubit = context.read<SurahCubit>();

    return Scaffold(
      body: PageView.builder(
        itemCount: 114,
        onPageChanged: (index) {
          cubit.fetchSurah(index + 1);
        },
        itemBuilder: (context, index) {
          return BlocBuilder<SurahCubit, SurahState>(
            builder: (context, state) {
              if (state.status == SurahStatus.loading) {
                return const Center(child: CircularProgressIndicator());
              }

              if (state.status == SurahStatus.error) {
                return Center(child: Text(state.errorMessage));
لهف
              if (state.status == SurahStatus.loaded &&
                  state.surah != null) {
                final surah = state.surah!;

                return Column(
                  children: [
                    AppBar(
                      centerTitle: true,
                      title: Text(surah.name),
                    ),

                    Expanded(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.all(16),
                        child: RichText(
                          textAlign: TextAlign.right,
                          text: TextSpan(
                            children: [
                              for (int i = 0;
                              i < surah.ayahs.length;
                              i++) ...[
                                TextSpan(
                                  text: "${surah.ayahs[i].text} ",
                                  style: const TextStyle(
                                    fontSize: 22,
                                    height: 2,
                                    color: Colors.black,
                                  ),
                                ),

                                // رقم الآية
                                WidgetSpan(
                                  alignment:
                                  PlaceholderAlignment.middle,
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 4),
                                    padding: const EdgeInsets.all(6),
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                      color: Colors.green.withOpacity(0.2),
                                    ),
                                    child: Text(
                                      "${surah.ayahs[i].ayahNumber}",
                                      style: const TextStyle(
                                        fontSize: 14,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.green,
                                      ),
                                    ),
                                  ),
                                ),
                              ]
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                );
              }
              return const SizedBox();
            },
          );
        },
      ),
    );
  }
}