import 'package:json_annotation/json_annotation.dart';
part 'business_error.g.dart';

@JsonSerializable()
class BusinessError {
  final String message;
  final int? businessError;
  BusinessError({
    required this.message,
    this.businessError,
  });

  static BusinessError fromJson(Map<String, dynamic> map) =>
      _$BusinessErrorFromJson(map);
  Map<String, dynamic> toJson() => _$BusinessErrorToJson(this);
}
