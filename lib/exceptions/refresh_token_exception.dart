class RefreshTokenException implements Exception {
  final String message;

  RefreshTokenException({required this.message});

  @override
  String toString() {
    return "$message";
  }

  Map<String, dynamic> toMap() {
    return {'message': message};
  }
}
