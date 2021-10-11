import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class RenewAccessToken {
  @JsonKey(name: "refreshToken")
  String refreshToken;
  RenewAccessToken({
    required this.refreshToken,
  });
}
