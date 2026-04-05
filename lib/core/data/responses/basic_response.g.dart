// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'basic_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BasicResponse _$BasicResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BasicResponse',
      json,
      ($checkedConvert) {
        final val = BasicResponse(
          returnValue:
              $checkedConvert('returnValue', (v) => (v as num?)?.toInt()),
          returnString: $checkedConvert('returnString', (v) => v as String?),
          threadId: $checkedConvert('threadId', (v) => v as num?),
        );
        return val;
      },
    );

Map<String, dynamic> _$BasicResponseToJson(BasicResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnString': instance.returnString,
      'threadId': instance.threadId,
    };

BasicDefResponse _$BasicDefResponseFromJson(Map<String, dynamic> json) =>
    $checkedCreate(
      'BasicDefResponse',
      json,
      ($checkedConvert) {
        final val = BasicDefResponse(
          returnValue:
              $checkedConvert('returnValue', (v) => (v as num?)?.toInt()),
          returnString: $checkedConvert('returnMessage', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'returnString': 'returnMessage'},
    );

Map<String, dynamic> _$BasicDefResponseToJson(BasicDefResponse instance) =>
    <String, dynamic>{
      'returnValue': instance.returnValue,
      'returnMessage': instance.returnString,
    };
