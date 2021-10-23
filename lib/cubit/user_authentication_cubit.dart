import 'package:flutter/foundation.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tutorial_flutter_minimalist_authentication/exceptions/access_token_exception.dart';
import 'package:tutorial_flutter_minimalist_authentication/exceptions/business_exception.dart';
import 'package:tutorial_flutter_minimalist_authentication/exceptions/refresh_token_exception.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/account/renew_access_token.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/account/sign_in.dart';
import 'package:tutorial_flutter_minimalist_authentication/models/session/authentication_data.dart';
import 'package:tutorial_flutter_minimalist_authentication/repositories/api/account_repository.dart';

part 'user_authentication_state.dart';

class UserAuthenticationCubit extends Cubit<UserAuthenticationState> {
  final AccountRepository _accountRepository;
  final FlutterSecureStorage _flutterSecureStorage =
      const FlutterSecureStorage();

  UserAuthenticationCubit(this._accountRepository)
      : super(const UserAuthenticationInitial()) {
    validateAuthentication();
  }

  Future<void> signInUser(SignIn signInInput) async {
    try {
      emit(const UserAuthenticating());
      final authData = await _accountRepository.signIn(signIn: signInInput);
      await _storeAuthData(authData);
      emit(UserAuthenticated(authenticationData: authData));
    } on BusinessException catch (error) {
      //Handle when invalid sign in here
      if (error.businessError.businessError == 123) {
        emit(const UserAuthenticationInvalidCredentials());
      } else if (error.businessError.businessError == 321) {
        //if our API retuned 321 we map it as if the user email wasn't verified
        emit(UserAuthenticationEmailNotConfirmed());
      } else {
        emit(UserAuthenticationError(message: error.businessError.message));
      }
    } catch (error) {
      //Api may fail for varies reasons for example server is down
      emit(const UserAuthenticationError(
          message: "Something happened, try again later"));
    }
  }

  Future<void> validateAuthentication() async {
    try {
      emit(const UserAuthenticating());
      var accessToken = await _flutterSecureStorage.read(key: "accessToken");
      if (accessToken == null) {
        throw AccessTokenException(message: "Token not found");
      }
      final isValidToken =
          await _accountRepository.verifyToken(accessToken: accessToken);
      if (isValidToken) {
        final authData = await _getAuthDataFromDevice();
        emit(UserAuthenticated(authenticationData: authData));
      } else {
        emit(const UserUnauthenticated());
      }
    } on AccessTokenException catch (accessTokenException) {
      await _refreshToken();
    } on RefreshTokenException catch (exception) {
      //Handle when refresh token is either expired or was deleted from device
      await _flutterSecureStorage.deleteAll();
      emit(const UserUnauthenticated());
    } catch (e) {
      emit(const UserAuthenticationError(
          message: "Couldn't not authenticate,try again"));
    }
  }

  Future<void> _refreshToken() async {
    try {
      var refreshToken = await _flutterSecureStorage.read(key: "refreshToken");
      if (refreshToken == null) {
        await _flutterSecureStorage.deleteAll();
        emit(const UserUnauthenticated());
      } else {
        var authData = await _accountRepository.renewAccessToken(
            renewAccessToken: RenewAccessToken(refreshToken: refreshToken));
        await _storeAuthData(authData);
        emit(UserAuthenticated(authenticationData: authData));
      }
    } on RefreshTokenException catch (error) {
      await _flutterSecureStorage.deleteAll();
      emit(const UserUnauthenticated());
    } on Exception catch (error) {
      emit(const UserAuthenticationError(
          message: "Couldn't not authenticate,try again"));
    }
  }

  Future<void> _storeAuthData(AuthenticationData authenticationData) async {
    await _flutterSecureStorage.write(
        key: "accessToken", value: authenticationData.accessToken);
    await _flutterSecureStorage.write(
        key: "refreshToken", value: authenticationData.refreshToken);
    await _flutterSecureStorage.write(key: "id", value: authenticationData.id);
  }

  Future<AuthenticationData> _getAuthDataFromDevice() async {
    final String? accessToken =
        await _flutterSecureStorage.read(key: "accessToken");
    final String? refreshToken =
        await _flutterSecureStorage.read(key: "refreshToken");
    final String? userId = await _flutterSecureStorage.read(key: "id");
    if (accessToken == null || refreshToken == null || userId == null) {
      throw Exception("User might deleted or cleared app data");
    }
    return AuthenticationData(
        accessToken: accessToken, refreshToken: refreshToken, id: userId);
  }

  Future<void> logoutUser() async {
    try {
      //Delets all stored tokens and session data on device
      _flutterSecureStorage.deleteAll();
      emit(const UserUnauthenticated());
    } catch (error) {
      emit(const UserUnauthenticated());
    }
  }
}
