//Add this
import 'package:json_annotation/json_annotation.dart';
//Add this
part 'renew_access_token.g.dart';

//Add this
@JsonSerializable()
class RenewAccessToken {
  String refreshToken;
  RenewAccessToken({
    required this.refreshToken,
  });

  //Add this
  static RenewAccessToken fromJson(Map<String, dynamic> map) =>
      _$RenewAccessTokenFromJson(map);
  Map<String, dynamic> toJson() => _$RenewAccessTokenToJson(this);
}
