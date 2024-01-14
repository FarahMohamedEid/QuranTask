import 'package:quran_task/core/models/ar_overlay_model.dart';
import 'package:quran_task/core/models/ayah_model.dart';
import 'package:quran_task/core/models/hafs_almuaiqly_model.dart';
import 'package:quran_task/core/models/surah_model.dart';

class DbModel{
  List<AyahModel>? ayahModels;
  List<SurahModel>? surahModels;
  List<ArOverlayModel>? arOverlayModels;
  List<HafsAlmuaiqlyModel>? hafsAlmuaiqlyModels;

  DbModel({
    this.ayahModels,
    this.surahModels,
    this.arOverlayModels,
    this.hafsAlmuaiqlyModels,
  });

  DbModel copyWith({
    List<AyahModel>? ayahModels,
    List<SurahModel>? surahModels,
    List<ArOverlayModel>? arOverlayModels,
    List<HafsAlmuaiqlyModel>? hafsAlmuaiqlyModels,
  }) =>
      DbModel(
        ayahModels: ayahModels ?? this.ayahModels,
        surahModels: surahModels ?? this.surahModels,
        arOverlayModels: arOverlayModels ?? this.arOverlayModels,
        hafsAlmuaiqlyModels: hafsAlmuaiqlyModels ?? this.hafsAlmuaiqlyModels,
      );
}