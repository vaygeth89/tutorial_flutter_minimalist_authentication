import 'package:json_annotation/json_annotation.dart';
part 'sign_in.g.dart';

@JsonSerializable()
class SignIn {
  final String email;
  final String password;
  SignIn({
    required this.email,
    required this.password,
  });

  static SignIn fromJson(Map<String, dynamic> map) => _$SignInFromJson(map);
  Map<String, dynamic> toJson() => _$SignInToJson(this);
}
