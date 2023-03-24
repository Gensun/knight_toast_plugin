import 'package:flutter_test/flutter_test.dart';
import 'package:knight_toast_plugin/knight_toast_plugin.dart';
import 'package:knight_toast_plugin/knight_toast_plugin_platform_interface.dart';
import 'package:knight_toast_plugin/knight_toast_plugin_method_channel.dart';
import 'package:plugin_platform_interface/plugin_platform_interface.dart';

class MockKnightToastPluginPlatform
    with MockPlatformInterfaceMixin
    implements KnightToastPluginPlatform {

  @override
  Future<String?> getPlatformVersion() => Future.value('42');
  
  @override
  Future<bool> showToast(Map<dynamic, dynamic> argument) {
    // TODO: implement showToast
    throw UnimplementedError();
  }
}

void main() {
  final KnightToastPluginPlatform initialPlatform = KnightToastPluginPlatform.instance;

  test('$MethodChannelKnightToastPlugin is the default instance', () {
    expect(initialPlatform, isInstanceOf<MethodChannelKnightToastPlugin>());
  });

  test('getPlatformVersion', () async {
    KnightToastPlugin knightToastPlugin = KnightToastPlugin();
    MockKnightToastPluginPlatform fakePlatform = MockKnightToastPluginPlatform();
    KnightToastPluginPlatform.instance = fakePlatform;

    expect(await knightToastPlugin.getPlatformVersion(), '42');
  });
}
