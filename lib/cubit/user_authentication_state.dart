part of 'user_authentication_cubit.dart';

@immutable
abstract class UserAuthenticationState {
  const UserAuthenticationState();
}

class UserAuthenticationInitial extends UserAuthenticationState {
  const UserAuthenticationInitial();
}

class UserAuthenticating extends UserAuthenticationState {
  const UserAuthenticating();
}

class UserAuthenticated extends UserAuthenticationState {
  final AuthenticationData authenticationData;
  const UserAuthenticated({required this.authenticationData});
}

class UserUnauthenticated extends UserAuthenticationState {
  const UserUnauthenticated();
}

class UserAuthenticationInvalidCredentials extends UserAuthenticationState {
  const UserAuthenticationInvalidCredentials();
}

class UserAuthenticationError extends UserAuthenticationState {
  final String message;

  const UserAuthenticationError({required this.message});
}

// You can handle further special states when loging in for example
class UserAuthenticationEmailNotConfirmed extends UserAuthenticationState {
  const UserAuthenticationEmailNotConfirmed();
}
// Another example
// class UserAuthenticationAccountLocked extends UserAuthenticationState {
//   const UserAuthenticationAccountLocked();
// }
