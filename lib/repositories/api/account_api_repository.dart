import 'dart:io';

import 'package:dio/dio.dart';
import 'package:tutorial_flutter_minimalist_authentication/constants/constants.dart';
import 'package:tutorial_flutter_minimalist_authentication/exceptions/access_token_exception.dart';
import 'package:tutorial_flutter_minimalist_authentication/exceptions/business_exception.dart';
import 'package:tutorial_flutter_minimalist_authentication/exceptions/refresh_token_exception.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/api/business_error.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/session/authentication_data.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/account/sign_in.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/account/renew_access_token.dart';
import 'package:tutorial_flutter_minimalist_authentication/repositories/api/account_repository.dart';

class ApiRepositoryBase {
  late Dio _dio;
  static final String bearerTokenHeader = "Bearer ";
  Duration timeout = const Duration(seconds: 8);

  ApiRepositoryBase({required String baseURL}) {
    _dio = Dio(
      BaseOptions(
        baseUrl: baseURL,
        headers: {
          HttpHeaders.contentTypeHeader: ContentType.json.value,
        },
      ),
    );
  }
}

class AccountApiRepository extends ApiRepositoryBase
    implements AccountRepository {
  AccountApiRepository({String baseURL = accountAPIURL_v1})
      : super(baseURL: accountAPIURL_v1);

  @override
  Future<AuthenticationData> signIn({
    required SignIn signIn,
    String routePath = "sign-in",
  }) async {
    try {
      var result = await super
          ._dio
          .post(routePath, data: signIn.toJson())
          .timeout(super.timeout);
      if (result.statusCode == 200) {
        return AuthenticationData.fromJson(result.data);
      }
      throw DioError(requestOptions: result.requestOptions);
    } on DioError catch (error) {
      var businessError = BusinessError.fromJson(error.response?.data);
      throw BusinessException(businessError,
          statusCode: error.response?.statusCode);
    } catch (error) {
      throw Error();
    }
  }

  @override
  Future<bool> verifyToken(
      {required String accessToken, String routePath = "verify-token"}) async {
    try {
      var result = await super._dio.get(routePath,
          queryParameters: {"accessToken": accessToken}).timeout(super.timeout);
      if (result.statusCode == 200) {
        return true;
      }

      throw DioError(requestOptions: result.requestOptions);
    } on DioError catch (error) {
      if (error.response!.statusCode! >= 400) {
        throw AccessTokenException(message: "Token invalid or expired");
      }
      var businessError = BusinessError.fromJson(error.response?.data);
      throw BusinessException(businessError,
          statusCode: error.response?.statusCode);
    } catch (error) {
      throw Error();
    }
  }

  //I posted refresh token in body as post just to
  //demonstrate the different cases for dio htt ppost, get example
  //how you do it is purely your deisgn whether on url as queryparam
  //or post it in the http body
  @override
  Future<AuthenticationData> renewAccessToken(
      {required RenewAccessToken renewAccessToken,
      String routePath = "renew-token"}) async {
    try {
      var result = await super
          ._dio
          .post(routePath, data: renewAccessToken.toJson())
          .timeout(super.timeout);
      if (result.statusCode == 200) {
        return AuthenticationData.fromJson(result.data);
      }
      throw DioError(requestOptions: result.requestOptions);
    } on DioError catch (error) {
      if (error.response!.statusCode! >= 400) {
        throw RefreshTokenException(message: "Token invalid or expired");
      }
      var businessError = BusinessError.fromJson(error.response?.data);
      throw BusinessException(businessError,
          statusCode: error.response?.statusCode);
    } catch (error) {
      throw Error();
    }
  }
}
