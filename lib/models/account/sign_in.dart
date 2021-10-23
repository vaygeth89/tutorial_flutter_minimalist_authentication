//Add this
import 'package:json_annotation/json_annotation.dart';
//Add this
part 'sign_in.g.dart';

//Add this
@JsonSerializable()
class SignIn {
  final String email;
  final String password;
  SignIn({
    required this.email,
    required this.password,
  });

  //Add this
  static SignIn fromJson(Map<String, dynamic> map) => _$SignInFromJson(map);
  Map<String, dynamic> toJson() => _$SignInToJson(this);
}
