import 'package:json_annotation/json_annotation.dart';

part 'sign_in.g.dart';

@JsonSerializable()
class SignIn {
  @JsonKey(name: 'email')
  final String email;
  @JsonKey(name: 'password')
  final String password;
  SignIn({
    required this.email,
    required this.password,
  });

  factory SignIn.fromJson(Map<String, dynamic> json) => _$SignInFromJson(json);
  Map<String, dynamic> toJson() => _$SignInToJson(this);
}
