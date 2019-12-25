// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User()
    ..MasterFlag = json['MasterFlag'] as bool
    ..active = json['active'] as String
    ..chinesename = json['chinesename'] as String
    ..creationTime = json['creationTime'] as String
    ..email = json['email'] as String
    ..firstname = json['firstname'] as String
    ..gender = json['gender'] as String
    ..group_id = json['group_id'] as List
    ..lastLoginTime = json['lastLoginTime'] as String
    ..lastname = json['lastname'] as String
    ..modifiedTime = json['modifiedTime'] as String
    ..type = json['type'] as String
    ..login = json['login'] as String;
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'MasterFlag': instance.MasterFlag,
      'active': instance.active,
      'chinesename': instance.chinesename,
      'creationTime': instance.creationTime,
      'email': instance.email,
      'firstname': instance.firstname,
      'gender': instance.gender,
      'group_id': instance.group_id,
      'lastLoginTime': instance.lastLoginTime,
      'lastname': instance.lastname,
      'modifiedTime': instance.modifiedTime,
      'type': instance.type,
      'login': instance.login
    };
