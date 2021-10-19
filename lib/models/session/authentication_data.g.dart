// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'authentication_data.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthenticationData _$AuthenticationDataFromJson(Map<String, dynamic> json) {
  return AuthenticationData(
    accessToken: json['accessToken'] as String,
    refreshToken: json['refreshToken'] as String,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$AuthenticationDataToJson(AuthenticationData instance) =>
    <String, dynamic>{
      'id': instance.id,
      'accessToken': instance.accessToken,
      'refreshToken': instance.refreshToken,
    };
