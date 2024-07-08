import 'dart:convert';

Dimensions dimensionsFromJson(String str) =>
    Dimensions.fromJson(json.decode(str));
String dimensionsToJson(Dimensions data) => json.encode(data.toJson());

class Dimensions {
  Dimensions({
    this.width,
    this.height,
    this.depth,
  });

  Dimensions.fromJson(dynamic json) {
    width = json['width'];
    height = json['height'];
    depth = json['depth'];
  }
  num? width;
  num? height;
  num? depth;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['width'] = width;
    map['height'] = height;
    map['depth'] = depth;
    return map;
  }
}
