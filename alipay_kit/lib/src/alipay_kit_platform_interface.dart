import 'package:alipay_kit/src/alipay_kit_method_channel.dart';
import 'package:alipay_kit/src/model/resp.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

/// 支付宝
///
/// * 默认不包含iOS支付
///   添加 alipay_kit_ios 依赖，可切换为不包含支付。
/// * 不含「iOS 支付」调用会抛出 [MissingPluginException]。
abstract class ZfbKitPlatform extends PlatformInterface {
  /// Constructs a AlipayKitPlatform.
  ZfbKitPlatform() : super(token: _token);

  static final Object _token = Object();

  static ZfbKitPlatform _instance = MethodChannelAlipayKit();

  /// The default instance of [ZfbKitPlatform] to use.
  ///
  /// Defaults to [MethodChannelAlipayKit].
  static ZfbKitPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [ZfbKitPlatform] when
  /// they register themselves.
  static set instance(ZfbKitPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// 支付
  Stream<ZfbResp> payResp() {
    throw UnimplementedError('payResp() has not been implemented.');
  }

  /// 登录
  Stream<ZfbResp> authResp() {
    throw UnimplementedError('authResp() has not been implemented.');
  }

  /// 检测支付宝是否已安装
  Future<bool> isInstalled() {
    throw UnimplementedError('isInstalled() has not been implemented.');
  }

  /// 支付
  Future<void> pay({
    required String orderInfo,
    bool isShowLoading = true,
  }) {
    throw UnimplementedError(
        'pay({required orderInfo, isShowLoading}) has not been implemented.');
  }

  /// 登录
  Future<void> auth({
    required String authInfo,
    bool isShowLoading = true,
  }) {
    throw UnimplementedError(
        'auth({required info, isShowLoading}) has not been implemented.');
  }
}
