

import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/audio_model/audio_model.dart';

abstract class AudioRemoteDataSource {
  Future<List<AudioModel>> fetchSurahs();
}


class AudioRemoteDataSourceImpl implements AudioRemoteDataSource {
  final String jsonPath;

  AudioRemoteDataSourceImpl({this.jsonPath = 'assets/json/quran.json'});

  @override
  Future<List<AudioModel>> fetchSurahs() async {
    final String response = await rootBundle.loadString(jsonPath);
    final List<dynamic> data = json.decode(response);
    return data.map((json) => AudioModel.fromJson(json)).toList();
  }
}

