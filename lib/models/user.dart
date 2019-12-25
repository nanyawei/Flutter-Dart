import 'package:json_annotation/json_annotation.dart';

part 'user.g.dart';

@JsonSerializable()
class User {
    User();

    bool MasterFlag;
    String active;
    String chinesename;
    String creationTime;
    String email;
    String firstname;
    String gender;
    List group_id;
    String lastLoginTime;
    String lastname;
    String modifiedTime;
    String type;
    String login;
    
    factory User.fromJson(Map<String,dynamic> json) => _$UserFromJson(json);
    Map<String, dynamic> toJson() => _$UserToJson(this);
}
