import 'package:tutorial_flutter_minimalist_authentication/exceptions/access_token_exception.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/account/renew_access_token.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/account/sign_in.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/api/business_error.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/session/authentication_data.dart';
import 'package:tutorial_flutter_minimalist_authentication/repositories/api/account_repository.dart';

class FakeAccountAPIRepository implements AccountRepository {
  final _fakeAuthData = AuthenticationData(
      accessToken: "fakeAccessToken",
      refreshToken: "fakeRefreshToken",
      id: "1");
  final _fakeEmail = "email@fake.fake";
  final _fakePassword = "password";
  @override
  Future<AuthenticationData> signIn({
    required SignIn signIn,
  }) async {
    try {
      if (signIn.email == _fakeEmail && signIn.password == _fakePassword) {
        return _fakeAuthData;
      }
      final businessCode = 123;
      //you make your API return special business code for different error
      //for example if business code is 123 when user try to sign in and it was invalid credentials
      //or for example if business code is 321 when user sign up before but didn't verify his email

      throw BusinessError(message: "Invalid Sign In", businessError: 123);
    } on BusinessError catch (error) {
      throw error;
    } catch (error) {
      throw Exception();
    }
  }

  @override
  Future<AuthenticationData> renewAccessToken(
      {required RenewAccessToken renewAccessToken}) async {
    return _fakeAuthData;
  }

  @override
  Future<bool> verifyToken({required String accessToken}) async {
    try {
      return true;
    } on AccessTokenException catch (error) {
      //Here you can throw AccessTokenException if access token either expired or invalid
      throw error;
    } catch (error) {
      throw error;
    }
  }
}
