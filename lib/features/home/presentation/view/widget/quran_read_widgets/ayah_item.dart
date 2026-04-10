import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entity/surah_entity.dart';
import '../../../manager/quran_read_cubit/surah_cubit.dart';


class AyahItem extends StatelessWidget {
  final SurahEntity surah;
  final int index;
  final bool isPlaying;

  const AyahItem({
    super.key,
    required this.surah,
    required this.index,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    final ayah = surah.ayahs[index];

    return GestureDetector(
      onTap: () {
        context.read<SurahCubit>().togglePlayAyah(ayah, index);
      },
      child: Tooltip(
        message: ayah.tafsir,
        waitDuration: const Duration(milliseconds: 200),
        showDuration: const Duration(seconds: 3),
        child: RichText(
          text: TextSpan(
            children: [
              // 🔥 نص الآية
              TextSpan(
                text: "${ayah.text} ",
                style: TextStyle(
                  fontSize: 22,
                  height: 2,
                  color: isPlaying ? Colors.green : Colors.white,
                ),
              ),

              // 🔢 رقم الآية
              WidgetSpan(
                alignment: PlaceholderAlignment.middle,
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  padding: const EdgeInsets.all(5),
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.green.withOpacity(0.2),
                  ),
                  child: Text(
                    "${ayah.ayahNumber}",
                    style: const TextStyle(
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                      color: Colors.green,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}