import 'dart:convert' as convert;


/// ayah_id : 13
/// overlay : [{"x":0,"y":35.8055,"w":723.648,"h":64.4499},{"x":532.1828,"y":100.25540000000001,"w":191.4652,"h":62.565400000000004}]
/// page : null
class ArOverlayModel {
  ArOverlayModel({
      num? ayahId,
      List<OverlayTest>? overlayTest,
      dynamic page,}){
    _ayahId = ayahId;
    _overlay = overlayTest;
    _page = page;
}

  ArOverlayModel.fromJson(dynamic json) {
    _ayahId = json['ayah_id'];
    if (json['overlay'] != null) {
      List dataList = convert.json.decode(json['overlay']);
      _overlay = dataList.map((json) => OverlayTest.fromJson(json)).toList();
    }
    _page = json['page'];
  }
  num? _ayahId;
  List<OverlayTest>? _overlay;
  dynamic _page;
ArOverlayModel copyWith({  num? ayahId,
  List<OverlayTest>? overlay,
  dynamic page,
}) => ArOverlayModel(  ayahId: ayahId ?? _ayahId,
  overlayTest: overlay ?? _overlay,
  page: page ?? _page,
);
  num? get ayahId => _ayahId;
  List<OverlayTest>? get overlay => _overlay;
  dynamic get page => _page;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['ayah_id'] = _ayahId;
    if (_overlay != null) {
      map['overlay'] = _overlay?.map((v) => v.toJson()).toList();
    }
    map['page'] = _page;
    return map;
  }

}

/// x : 0
/// y : 35.8055
/// w : 723.648
/// h : 64.4499

class OverlayTest {
  OverlayTest({
      num? x, 
      num? y, 
      num? w, 
      num? h,}){
    _x = x;
    _y = y;
    _w = w;
    _h = h;
}

  OverlayTest.fromJson(dynamic json) {
    _x = json['x'];
    _y = json['y'];
    _w = json['w'];
    _h = json['h'];
  }
  num? _x;
  num? _y;
  num? _w;
  num? _h;
OverlayTest copyWith({  num? x,
  num? y,
  num? w,
  num? h,
}) => OverlayTest(  x: x ?? _x,
  y: y ?? _y,
  w: w ?? _w,
  h: h ?? _h,
);
  num? get x => _x;
  num? get y => _y;
  num? get w => _w;
  num? get h => _h;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['x'] = _x;
    map['y'] = _y;
    map['w'] = _w;
    map['h'] = _h;
    return map;
  }

}