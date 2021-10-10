// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'renew_access_token.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

RenewAccessToken _$RenewAccessTokenFromJson(Map<String, dynamic> json) {
  return RenewAccessToken(
    refreshToken: json['refreshToken'] as String,
  );
}

Map<String, dynamic> _$RenewAccessTokenToJson(RenewAccessToken instance) =>
    <String, dynamic>{
      'refreshToken': instance.refreshToken,
    };
