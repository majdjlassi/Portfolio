import 'dart:convert';
import 'dart:developer';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/data/model/experience.dart';

Future<List<Experience>> fetchExperiences() async {
  try {
    String jsonData = await rootBundle.loadString('assets/json/mocks.json');
    List<dynamic> data = json.decode(jsonData);
    final experiences = data.map((e) => Experience.fromJson(e)).toList();
    return experiences;
  } catch (e) {
    log(e.toString());
  }
  return [];
}

String convertDate(String date) {
  DateFormat inputFormat = DateFormat('dd-MM-yyyy');
  DateTime parsedDate = inputFormat.parse(date);
  final DateFormat formatter = DateFormat('MMM yyyy');
  return formatter.format(parsedDate);
}

Future<File> getOrDownloadImage(String imageUrl) async {
  final cacheFile = await DefaultCacheManager().getFileFromCache(imageUrl);
  if (cacheFile != null) {
    return cacheFile.file;
  }
  return (await DefaultCacheManager().downloadFile(imageUrl, key: imageUrl))
      .file;
}
