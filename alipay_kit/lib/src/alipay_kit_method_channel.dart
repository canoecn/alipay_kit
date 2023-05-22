import 'dart:async';

import 'package:alipay_kit/src/alipay_kit_platform_interface.dart';
import 'package:alipay_kit/src/model/resp.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

/// An implementation of [ZfbKitPlatform] that uses method channels.
class MethodChannelAlipayKit extends ZfbKitPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  late final MethodChannel methodChannel =
      const MethodChannel('v7lin.github.io/alipay_kit')
        ..setMethodCallHandler(_handleMethod);

  final StreamController<ZfbResp> _payRespStreamController =
      StreamController<ZfbResp>.broadcast();
  final StreamController<ZfbResp> _authRespStreamController =
      StreamController<ZfbResp>.broadcast();

  Future<dynamic> _handleMethod(MethodCall call) async {
    switch (call.method) {
      case 'onPayResp':
        _payRespStreamController.add(ZfbResp.fromJson(
            (call.arguments as Map<dynamic, dynamic>).cast<String, dynamic>()));
        break;
      case 'onAuthResp':
        _authRespStreamController.add(ZfbResp.fromJson(
            (call.arguments as Map<dynamic, dynamic>).cast<String, dynamic>()));
        break;
    }
  }

  @override
  Stream<ZfbResp> payResp() {
    return _payRespStreamController.stream;
  }

  @override
  Stream<ZfbResp> authResp() {
    return _authRespStreamController.stream;
  }

  @override
  Future<bool> isInstalled() async {
    return await methodChannel.invokeMethod<bool?>('isInstalled') ?? false;
  }

  @override
  Future<void> pay({
    required String orderInfo,
    bool isShowLoading = true,
  }) {
    return methodChannel.invokeMethod<void>(
      'pay',
      <String, dynamic>{
        'orderInfo': orderInfo,
        'isShowLoading': isShowLoading,
      },
    );
  }

  @override
  Future<void> auth({
    required String authInfo,
    bool isShowLoading = true,
  }) {
    return methodChannel.invokeMethod<void>(
      'auth',
      <String, dynamic>{
        'authInfo': authInfo,
        'isShowLoading': isShowLoading,
      },
    );
  }
}
