import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:hogwarts_hourglasses/models/info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageController {
  void saveToStorage() async {
    final prefs = await SharedPreferences.getInstance();

    final guid = UniqueKey().hashCode;
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;

    final info = Info(guid: guid, deviceInfo: deviceInfo.toMap().toString());

    final result = await prefs.setString('0', info.toString());
    log('Данные сохранились: ${result.toString()}');
  }
}
