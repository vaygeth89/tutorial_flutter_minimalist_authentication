import 'package:tutorial_flutter_minimalist_authentication/models/account/renew_access_token.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/account/sign_in.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/api/business_error.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/session/authentication_data.dart';
import 'package:tutorial_flutter_minimalist_authentication/repositories/api/account_service.dart';

class FakeAccountAPIService implements AccountService {
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
      //you make your API return special business code for different error
      //for example if business code is 123 when user sign up before but didn't verify his email
      //then the
      final businessCode = 123;
      throw BusinessError(
          message: "Invalid Sign In", businessError: businessCode);
    } on BusinessError catch (error) {
      rethrow;
    } catch (error) {
      throw Error();
    }
  }

  @override
  Future<AuthenticationData> renewAccessToken(
      {required RenewAccessToken renewAccessToken}) async {
    return _fakeAuthData;
  }

  @override
  Future<bool> verifyToken({required String accessToken}) async {
    return true;
  }
}
