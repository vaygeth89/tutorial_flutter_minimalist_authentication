// import 'dart:convert';

import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class AuthenticationData {
  @JsonKey(name: 'id')
  final String id;
  @JsonKey(name: "accessToken")
  final String accessToken;
  @JsonKey(name: "refreshToken")
  final String refreshToken;

  AuthenticationData({
    required this.accessToken,
    required this.refreshToken,
    required this.id,
  });
}
