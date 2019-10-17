// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

User _$UserFromJson(Map<String, dynamic> json) {
  return User(
      json['name'] as String,
      json['email'] as String,
      json['secondName'] as String,
      json['registration_date_millis'] as int,
      User._socialNameFromId(json['socialId'] as int));
}

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
      'name': instance.name,
      'email': instance.email,
      'secondName': instance.secondName,
      'registration_date_millis': instance.registrationDateMillis,
      'socialId': User._idFromName(instance.profileLink)
    };
