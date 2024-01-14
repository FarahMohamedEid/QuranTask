class HafsAlmuaiqlyModel {
  HafsAlmuaiqlyModel({
    this.ayahId,
    this.startMarker,
    this.duration,
  });

  dynamic ayahId;
  dynamic startMarker;
  dynamic duration;

  HafsAlmuaiqlyModel.fromJson(dynamic json) {
    ayahId = json['ayah_id'] ?? '';
    startMarker = json['start_marker'] ?? '';
    duration = json['duration'] ?? '';
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ayah_id'] = ayahId;
    map['start_marker'] = startMarker;
    map['duration'] = duration;
    return map;
  }

  HafsAlmuaiqlyModel copyWith({
    dynamic ayahId,
    dynamic startMarker,
    dynamic duration,
  }) =>
      HafsAlmuaiqlyModel(
        ayahId: ayahId ?? this.ayahId,
        startMarker: startMarker ?? this.startMarker,
        duration: duration ?? this.duration,
      );
}
