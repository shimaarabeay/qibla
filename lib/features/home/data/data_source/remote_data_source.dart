

import 'dart:convert';

import 'package:flutter/services.dart';

import '../models/surah_model.dart';

abstract class SurahRemoteDataSource {
  Future<List<SurahModel>> fetchSurahs();
}


class SurahRemoteDataSourceImpl implements SurahRemoteDataSource {
  final String jsonPath;

  SurahRemoteDataSourceImpl({this.jsonPath = 'assets/json/quran.json'});

  @override
  Future<List<SurahModel>> fetchSurahs() async {
    final String response = await rootBundle.loadString(jsonPath);
    final List<dynamic> data = json.decode(response);
    return data.map((json) => SurahModel.fromJson(json)).toList();
  }
}

