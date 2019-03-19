// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'alipay_auth_result.dart';

// **************************************************************************
// JaguarSerializerGenerator
// **************************************************************************

abstract class _$AlipayAuthResultSerializer
    implements Serializer<AlipayAuthResult> {
  final _boolToStringProcessor = const BoolToStringProcessor();
  @override
  Map<String, dynamic> toMap(AlipayAuthResult model) {
    if (model == null) return null;
    Map<String, dynamic> ret = <String, dynamic>{};
    setMapValue(
        ret, 'success', _boolToStringProcessor.serialize(model.success));
    setMapValue(ret, 'resultCode', model.resultCode);
    setMapValue(ret, 'authCode', model.authCode);
    setMapValue(ret, 'userId', model.userId);
    return ret;
  }

  @override
  AlipayAuthResult fromMap(Map map) {
    if (map == null) return null;
    final obj = new AlipayAuthResult(
        success: _boolToStringProcessor.deserialize(map['success'] as String) ??
            getJserDefault('success'),
        resultCode: map['resultCode'] as String ?? getJserDefault('resultCode'),
        authCode: map['authCode'] as String ?? getJserDefault('authCode'),
        userId: map['userId'] as String ?? getJserDefault('userId'));
    return obj;
  }
}