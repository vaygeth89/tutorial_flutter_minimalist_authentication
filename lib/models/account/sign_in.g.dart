// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'sign_in.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SignIn _$SignInFromJson(Map<String, dynamic> json) {
  return SignIn(
    email: json['email'] as String,
    password: json['password'] as String,
  );
}

Map<String, dynamic> _$SignInToJson(SignIn instance) => <String, dynamic>{
      'email': instance.email,
      'password': instance.password,
    };
