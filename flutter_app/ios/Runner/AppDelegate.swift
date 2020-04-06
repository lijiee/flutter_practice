import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
  override func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
    let controller : FlutterViewController = self.window?.rootViewController as! FlutterViewController
    let channel = FlutterMethodChannel.init(name: "com.meetyou.flutter/native_image", binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler { (call, result) in
        let para : String = call.arguments as! String
        
        let image = UIImage.init(named: para)
        let data = image?.pngData()

        let resoultBYTE = FlutterStandardTypedData(bytes: data ?? Data())
        result(resoultBYTE)
    }
    GeneratedPluginRegistrant.register(with: self)
    return super.application(application, didFinishLaunchingWithOptions: launchOptions)
  }
}
