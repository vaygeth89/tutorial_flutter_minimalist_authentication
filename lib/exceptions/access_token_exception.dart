class AccessTokenException implements Exception {
  final String message;

  AccessTokenException({required this.message});

  @override
  String toString() {
    return "$message";
  }

  Map<String, dynamic> toMap() {
    return {'message': message};
  }
}
