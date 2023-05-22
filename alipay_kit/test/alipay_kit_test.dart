import 'package:alipay_kit/src/alipay_kit_method_channel.dart';
import 'package:alipay_kit/src/alipay_kit_platform_interface.dart';
import 'package:alipay_kit/src/model/resp.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockAlipayKitPlatform
    with MockPlatformInterfaceMixin
    implements ZfbKitPlatform {
  @override
  Stream<ZfbResp> payResp() {
    throw UnimplementedError();
  }

  @override
  Stream<ZfbResp> authResp() {
    throw UnimplementedError();
  }

  @override
  Future<bool> isInstalled() {
    return Future<bool>.value(true);
  }

  @override
  Future<void> pay({required String orderInfo, bool isShowLoading = true}) {
    throw UnimplementedError();
  }

  @override
  Future<void> auth({
    required String authInfo,
    bool isShowLoading = true,
  }) {
    throw UnimplementedError();
  }
}

void main() {
  final ZfbKitPlatform initialPlatform = ZfbKitPlatform.instance;

  test('$MethodChannelAlipayKit is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelAlipayKit>());
  });

  test('isInstalled', () async {
    final MockAlipayKitPlatform fakePlatform = MockAlipayKitPlatform();
    ZfbKitPlatform.instance = fakePlatform;

    expect(await ZfbKitPlatform.instance.isInstalled(), true);
  });
}
