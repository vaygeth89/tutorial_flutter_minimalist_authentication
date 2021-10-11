import 'package:json_annotation/json_annotation.dart';

@JsonSerializable()
class BusinessError {
  @JsonKey(name: "message")
  final String message;
  @JsonKey(name: "businessError")
  final int? businessError;
  BusinessError({
    required this.message,
    this.businessError,
  });
}
