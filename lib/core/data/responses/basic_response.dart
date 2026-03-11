import 'package:json_annotation/json_annotation.dart';

part 'basic_response.g.dart';

@JsonSerializable(checked: true)
class BasicResponse {
  BasicResponse({
    this.returnValue,
    this.returnString,
    this.threadId,
  });

  @JsonKey(name: 'returnValue')
  final int? returnValue;

  @JsonKey(name: 'returnString')
  final String? returnString;

  @JsonKey(name: 'threadId')
  final num? threadId;

  factory BasicResponse.fromJson(Map<String, dynamic> json) =>
      _$BasicResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BasicResponseToJson(this);
}

@JsonSerializable(checked: true)
class BasicDefResponse {
  BasicDefResponse({
    this.returnValue,
    this.returnString,
  });

  @JsonKey(name: 'returnValue')
  final int? returnValue;

  @JsonKey(name: 'returnMessage')
  final String? returnString;

  factory BasicDefResponse.fromJson(Map<String, dynamic> json) =>
      _$BasicDefResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BasicDefResponseToJson(this);
}
