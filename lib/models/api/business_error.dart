//Add this
import 'package:json_annotation/json_annotation.dart';
//Add this
part 'business_error.g.dart';

//Add this
@JsonSerializable()
class BusinessError {
  final String message;
  final int? businessError;
  BusinessError({
    required this.message,
    this.businessError,
  });

  //Add this
  static BusinessError fromJson(Map<String, dynamic> map) =>
      _$BusinessErrorFromJson(map);
  Map<String, dynamic> toJson() => _$BusinessErrorToJson(this);
}
