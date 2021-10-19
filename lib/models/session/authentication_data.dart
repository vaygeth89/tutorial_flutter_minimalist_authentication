import 'package:json_annotation/json_annotation.dart';
part 'authentication_data.g.dart';

@JsonSerializable()
class AuthenticationData {
  final String id;
  final String accessToken;
  final String refreshToken;

  AuthenticationData({
    required this.accessToken,
    required this.refreshToken,
    required this.id,
  });

  static AuthenticationData fromJson(Map<String, dynamic> map) =>
      _$AuthenticationDataFromJson(map);
  Map<String, dynamic> toJson() => _$AuthenticationDataToJson(this);
}
