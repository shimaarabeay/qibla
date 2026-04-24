import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../domain/entity/ayah_entity.dart';
import '../../../manager/quran_read_cubit/surah_cubit.dart';


class AyahItem extends StatelessWidget {
  final AyahEntity ayah;
  final int index;
  final bool isPlaying;
  const AyahItem({
    super.key,
    required this.ayah,
    required this.index,
    required this.isPlaying,
  });

  @override
  Widget build(BuildContext context) {
    return MouseRegion(
      cursor: SystemMouseCursors.click,
      child: Card(
        margin: const EdgeInsets.symmetric(vertical: 6),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Tooltip(
          message: ayah.tafsir,
          waitDuration: const Duration(milliseconds: 200),
          showDuration: const Duration(seconds: 3),
          textStyle: const TextStyle(color: Colors.white),
          decoration: BoxDecoration(
            color: Colors.black87,
            borderRadius: BorderRadius.circular(6),
          ),
          child: ListTile(
            contentPadding: const EdgeInsets.all(12),
            title: Text(
              ayah.text,
              textAlign: TextAlign.right,
              style: const TextStyle(fontSize: 18, height: 1.8),
            ),
            leading: IconButton(
              icon: Icon(
                isPlaying ? Icons.pause_circle : Icons.play_circle,
                size: 28,
                color: isPlaying ? Colors.green : Colors.grey,
              ),
              onPressed: () {
                context.read<SurahCubit>().togglePlayAyah(ayah, index);
              },
            ),
          ),
        ),
      ),
    );
  }
}