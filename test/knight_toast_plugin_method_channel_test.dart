import 'package:flutter/services.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:knight_toast_plugin/knight_toast_plugin_method_channel.dart';

void main() {
  MethodChannelKnightToastPlugin platform = MethodChannelKnightToastPlugin();
  const MethodChannel channel = MethodChannel('knight_toast_plugin');

  TestWidgetsFlutterBinding.ensureInitialized();

  setUp(() {
    channel.setMockMethodCallHandler((MethodCall methodCall) async {
      return '42';
    });
  });

  tearDown(() {
    channel.setMockMethodCallHandler(null);
  });

  test('getPlatformVersion', () async {
    expect(await platform.getPlatformVersion(), '42');
  });
}
