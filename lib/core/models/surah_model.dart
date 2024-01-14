class SurahModel {
  SurahModel({
    this.id,
    this.nameArabic,
    this.nameTransliteration,
    this.maxVerses,
  });

  dynamic id;
  dynamic nameArabic;
  dynamic nameTransliteration;
  dynamic maxVerses;

  SurahModel.fromJson(dynamic json) {
    id = json['id'] ?? '';
    nameArabic = json['name_arabic'] ?? '';
    nameTransliteration = json['name_transliteration'] ?? '';
    maxVerses = json['max_verses'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name_arabic'] = nameArabic;
    map['name_transliteration'] = nameTransliteration;
    map['max_verses'] = maxVerses;
    return map;
  }

  SurahModel copyWith({
    dynamic id,
    dynamic nameArabic,
    dynamic nameTransliteration,
    dynamic maxVerses,
  }) =>
      SurahModel(
        id: id ?? this.id,
        nameArabic: nameArabic ?? this.nameArabic,
        nameTransliteration: nameTransliteration ?? this.nameTransliteration,
        maxVerses: maxVerses ?? this.maxVerses,
      );
}
