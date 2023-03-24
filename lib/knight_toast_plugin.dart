import 'knight_toast_plugin_platform_interface.dart';

enum Duration{
  length_short,
  length_long
}

class KnightToastPlugin {
  Future<String?> getPlatformVersion() {
    return KnightToastPluginPlatform.instance.getPlatformVersion();
  }

  static Future<bool> showToast(String message, Duration duration) async {
    var argument = {'message': message, 'duration': duration.toString()};
    var success = await KnightToastPluginPlatform.instance.showToast(argument);
    return success;
  }
}
