class AuthenticationData {
  final String id;
  final String accessToken;
  final String refreshToken;

  AuthenticationData({
    required this.accessToken,
    required this.refreshToken,
    required this.id,
  });
}
