import 'package:json_annotation/json_annotation.dart';

part 'default_response.g.dart';

@JsonSerializable(checked: true)
class DefaultResponse {
  DefaultResponse({
    this.status,
    this.message,
  });

  @JsonKey(name: 'status')
  final int? status;

  @JsonKey(name: 'message')
  final String? message;

  factory DefaultResponse.fromJson(Map<String, dynamic> json) =>
      _$DefaultResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DefaultResponseToJson(this);
}
