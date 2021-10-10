import 'package:json_annotation/json_annotation.dart';

part 'business_error.g.dart';

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

  factory BusinessError.fromJson(Map<String, dynamic> json) =>
      _$BusinessErrorFromJson(json);

  Map<String, dynamic> toJson() => _$BusinessErrorToJson(this);
}
