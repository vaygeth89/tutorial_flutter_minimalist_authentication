// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'business_error.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BusinessError _$BusinessErrorFromJson(Map<String, dynamic> json) {
  return BusinessError(
    message: json['message'] as String,
    businessError: json['businessError'] as int?,
  );
}

Map<String, dynamic> _$BusinessErrorToJson(BusinessError instance) =>
    <String, dynamic>{
      'message': instance.message,
      'businessError': instance.businessError,
    };
