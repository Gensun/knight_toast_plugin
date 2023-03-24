import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'knight_toast_plugin_method_channel.dart';

abstract class KnightToastPluginPlatform extends PlatformInterface {
  /// Constructs a KnightToastPluginPlatform.
  KnightToastPluginPlatform() : super(token: _token);

  static final Object _token = Object();

  static KnightToastPluginPlatform _instance = MethodChannelKnightToastPlugin();

  /// The default instance of [KnightToastPluginPlatform] to use.
  ///
  /// Defaults to [MethodChannelKnightToastPlugin].
  static KnightToastPluginPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [KnightToastPluginPlatform] when
  /// they register themselves.
  static set instance(KnightToastPluginPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> showToast(Map argument) {
    throw UnimplementedError('showToast() has not been implemented.');
  }
}
