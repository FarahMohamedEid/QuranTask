class AyahModel {
  AyahModel({
    this.id,
    this.surahId,
    this.ayahInSurah,
    this.page,
    this.sajda,
    this.ayahInPage,
  });

  dynamic id;
  dynamic surahId;
  dynamic ayahInSurah;
  dynamic page;
  dynamic sajda;
  dynamic ayahInPage;

  AyahModel.fromJson(dynamic json) {
    id = json['id'] ?? '';
    surahId = json['surah_id'] ?? '';
    ayahInSurah = json['ayah_in_surah'] ?? '';
    page = json['page'] ?? '';
    sajda = json['sajda'] ?? '';
    ayahInPage = json['ayah_in_page'] ?? false;
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['surah_id'] = surahId;
    map['ayah_in_surah'] = ayahInSurah;
    map['page'] = page;
    map['sajda'] = sajda;
    map['ayah_in_page'] = ayahInPage;
    return map;
  }

  AyahModel copyWith({
    dynamic id,
    dynamic surahId,
    dynamic ayahInSurah,
    dynamic page,
    dynamic sajda,
    dynamic ayahInPage,
  }) =>
      AyahModel(
        id: id ?? this.id,
        surahId: surahId ?? this.surahId,
        ayahInSurah: ayahInSurah ?? this.ayahInSurah,
        page: page ?? this.page,
        sajda: sajda ?? this.sajda,
        ayahInPage: ayahInPage ?? this.ayahInPage,
      );
}
