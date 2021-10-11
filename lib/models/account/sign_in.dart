import 'package:json_annotation/json_annotation.dart';

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
}
