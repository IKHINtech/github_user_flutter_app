import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:device_info/device_info.dart';
import 'package:flutter/services.dart';

class DeviceInfo {
  static Future<List<String>> getDeviceDetails() async {
    String deviceName = '';
    // String deviceVersion;
    String identifier = '';
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    try {
      if (Platform.isAndroid) {
        var build = await deviceInfoPlugin.androidInfo;
        deviceName = '${build.brand} ${build.model}'.trim();
        // deviceVersion = build.version.toString();
        identifier = build.androidId; //UUID for Android
      } else if (Platform.isIOS) {
        var data = await deviceInfoPlugin.iosInfo;
        deviceName = data.name.replaceAll("'", "").replaceAll('"', '');
        // deviceVersion = data.systemVersion;
        identifier = data.identifierForVendor; //UUID for iOS
      }
    } on PlatformException {
      if (kDebugMode) {
        print('Failed to get platform version');
      }
    }

    return [identifier, deviceName];
  }
}
