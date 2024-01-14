import 'package:path/path.dart';
import 'package:quran_task/core/models/ar_overlay_model.dart';
import 'package:quran_task/core/models/ayah_model.dart';
import 'package:quran_task/core/models/db_model.dart';
import 'package:quran_task/core/models/hafs_almuaiqly_model.dart';
import 'package:quran_task/core/models/surah_model.dart';
import 'package:sqflite/sqflite.dart';
import 'dart:io';
import 'package:flutter/services.dart';

class DatabaseHelper {
  late final DbModel dbModel;

  Future<DbModel> initializeDatabase() async {
    // Get the path to the database in the device's file system.
    String dbPath = join(await getDatabasesPath(), 'quran.sqlite');

    // Check if the database already exists
    if (await File(dbPath).exists()) {
      return await _openDatabaseAndQuery(dbPath: dbPath);
    } else {
      // Copy from assets to the file system
      ByteData data = await rootBundle.load('assets/data/quran.sqlite');
      List<int> bytes =
          data.buffer.asUint8List(data.offsetInBytes, data.lengthInBytes);
      // Write and flush the bytes written
      return await File(dbPath).writeAsBytes(bytes, flush: true).then(
            (value) async => await _openDatabaseAndQuery(
              dbPath: dbPath,
            ),
          );
    }
  }

  Future<DbModel> _openDatabaseAndQuery({required String dbPath}) async {
    List<AyahModel>? ayahModel;
    List<SurahModel>? surahs;
    List<ArOverlayModel>? arOverlays;
    List<HafsAlmuaiqlyModel>? hafs;
    await openDatabase(dbPath, readOnly: true, onOpen: (database) async {
      ayahModel = await _getAyahs(db: database);
      surahs = await _getSurahs(db: database);
      arOverlays = await _getArOverlays(db: database);
      hafs = await _getHafsAlmuaiqlyModel(db: database);
      await database.close();
    });
    return dbModel = DbModel(
      ayahModels: ayahModel,
      surahModels: surahs,
      arOverlayModels: arOverlays,
      hafsAlmuaiqlyModels: hafs,
    );
  }

  Future<List<AyahModel>?> _getAyahs({required Database db}) async {
    List<AyahModel> ayahs = [];
    List<Map<String, dynamic>> ayahResults =
        await db.database.rawQuery('SELECT * FROM Ayah');
    for (var i = 0; i < ayahResults.length; i++) {
      AyahModel ayahModel = AyahModel.fromJson(ayahResults[i]);
      ayahs.add(ayahModel);
    }
    return ayahs;
  }

  Future<List<SurahModel>?> _getSurahs({required Database db}) async {
    List<SurahModel> surahs = [];
    List<Map<String, dynamic>> surahsResults =
        await db.database.rawQuery('SELECT * FROM Surah');
    for (var i = 0; i < surahsResults.length; i++) {
      SurahModel surahModel = SurahModel.fromJson(surahsResults[i]);
      surahs.add(surahModel);
    }
    return surahs;
  }

  Future<List<ArOverlayModel>?> _getArOverlays({required Database db}) async {
    List<ArOverlayModel> arOverlays = [];
    List<Map<String, dynamic>> arOverlaysResults =
        await db.database.rawQuery('SELECT * FROM ar_overlay');
    for (var i = 0; i < arOverlaysResults.length; i++) {
      ArOverlayModel arOverlayModel = ArOverlayModel.fromJson(arOverlaysResults[i]);
      arOverlays.add(arOverlayModel);
    }
    return arOverlays;
  }

  Future<List<HafsAlmuaiqlyModel>?> _getHafsAlmuaiqlyModel(
      {required Database db}) async {
    List<HafsAlmuaiqlyModel> hafs = [];
    List<Map<String, dynamic>> hafsResults =
        await db.database.rawQuery('SELECT * FROM hafs_almuaiqly');
    for (var i = 0; i < hafsResults.length; i++) {
      HafsAlmuaiqlyModel hafsModel =
          HafsAlmuaiqlyModel.fromJson(hafsResults[i]);
      hafs.add(hafsModel);
    }
    return hafs;
  }
}
