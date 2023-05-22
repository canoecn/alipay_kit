// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'resp.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ZfbResp _$AlipayRespFromJson(Map<String, dynamic> json) => ZfbResp(
      resultStatus: const NullableStringToNullableIntConverter()
          .fromJson(json['resultStatus'] as String?),
      result: json['result'] as String?,
      memo: json['memo'] as String?,
    );

Map<String, dynamic> _$AlipayRespToJson(ZfbResp instance) => <String, dynamic>{
      'resultStatus': const NullableStringToNullableIntConverter()
          .toJson(instance.resultStatus),
      'result': instance.result,
      'memo': instance.memo,
    };
