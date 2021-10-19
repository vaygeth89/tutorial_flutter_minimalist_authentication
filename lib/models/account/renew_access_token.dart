import 'package:json_annotation/json_annotation.dart';
part 'renew_access_token.g.dart';

@JsonSerializable()
class RenewAccessToken {
  String refreshToken;
  RenewAccessToken({
    required this.refreshToken,
  });

  static RenewAccessToken fromJson(Map<String, dynamic> map) =>
      _$RenewAccessTokenFromJson(map);
  Map<String, dynamic> toJson() => _$RenewAccessTokenToJson(this);
}
