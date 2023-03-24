import Flutter
import QMUIKit
import UIKit

public class KnightToastPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "knight_toast_plugin", binaryMessenger: registrar.messenger())
    let instance = KnightToastPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
      if (call.method == "showToast") {

          if let arguments = call.arguments as? NSDictionary {
              if let message = arguments["message"], let duration = arguments["duration"] {
                  QMUITips.show(withText:"\(message)",detailText: "\(duration)");
                  result(true)
              }
          }
    }else{
        result("iOS " + UIDevice.current.systemVersion)
    }
  }
}
