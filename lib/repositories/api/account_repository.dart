import 'package:tutorial_flutter_minimalist_authentication/models/account/renew_access_token.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/account/sign_in.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/session/authentication_data.dart';

abstract class AccountRepository {
  Future<AuthenticationData> signIn({required SignIn signIn});

  Future<bool> verifyToken({required String accessToken});

  Future<AuthenticationData> renewAccessToken(
      {required RenewAccessToken renewAccessToken});
}
