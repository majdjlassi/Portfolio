import 'dart:convert';
import 'dart:developer';
import 'dart:io' as io;
import 'package:flutter_cache_manager/file.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:intl/intl.dart';
import 'package:portfolio/data/model/experience.dart';
import 'package:portfolio/data/model/personal_info.dart';

Future<List<Experience>> getMockExperienceDataFromJsonFile() async {
  try {
    final file =  io.File('assets/json/exeprience_mock.json');
    List<dynamic> data = json.decode(await file.readAsString());
    final experiences = data.map((e) => Experience.fromJson(e)).toList();
    return experiences;
  } catch (e) {
    log(e.toString());
  }
  return [];
}

Future<PersonalInfo?> getMockPersonalInfoDataFromJsonFile() async {
  try {
    final file =  io.File('assets/json/personal_info_mock.json');
    dynamic data = json.decode(await file.readAsString());
    return PersonalInfo.fromJson(data);
  } catch (e) {
    log(e.toString());
  }
  return null;
}

String convertDate(String date) {
  try{
    DateFormat inputFormat = DateFormat('dd-MM-yyyy');
    DateTime parsedDate = inputFormat.parse(date);
    final DateFormat formatter = DateFormat('MMM yyyy');
    return formatter.format(parsedDate);
  }catch(e){
    log(e.toString());
  }
  return '';
}

Future<File> getOrDownloadImage(String imageUrl) async {
  final cacheFile = await DefaultCacheManager().getFileFromCache(imageUrl);
  if (cacheFile != null) {
    return cacheFile.file;
  }
  return (await DefaultCacheManager().downloadFile(imageUrl, key: imageUrl))
      .file;
}
