import 'package:json_annotation/json_annotation.dart';

part 'homekitHoom.g.dart';

@JsonSerializable()
class HomekitHoom {
    HomekitHoom();

    List result;
    
    factory HomekitHoom.fromJson(Map<String,dynamic> json) => _$HomekitHoomFromJson(json);
    Map<String, dynamic> toJson() => _$HomekitHoomToJson(this);
}
