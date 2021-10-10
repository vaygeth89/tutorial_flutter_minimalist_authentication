import 'package:tutorial_flutter_minimalist_authentication/models/api/business_error.dart';

class BusinessException implements Exception {
  final BusinessError businessError;
  int? statusCode;
  BusinessException(this.businessError, {this.statusCode});
}
