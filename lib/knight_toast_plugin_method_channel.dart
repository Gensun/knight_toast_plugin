import 'dart:ffi';

import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'knight_toast_plugin_platform_interface.dart';

/// An implementation of [KnightToastPluginPlatform] that uses method channels.
class MethodChannelKnightToastPlugin extends KnightToastPluginPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('knight_toast_plugin');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> showToast(Map argument) async {
    final success =
        (await methodChannel.invokeMethod<bool>('showToast', argument));
    return success!;
  }
}
