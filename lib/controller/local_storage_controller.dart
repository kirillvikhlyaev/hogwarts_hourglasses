import 'dart:developer';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/cupertino.dart';
import 'package:hogwarts_hourglasses/controller/api_handler.dart';
import 'package:hogwarts_hourglasses/models/info.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalStorageController {
  final api = ApiHandler();

  void saveToStorage(String houseName) async {
    final prefs = await SharedPreferences.getInstance();

    final guid = UniqueKey().hashCode;
    final deviceInfoPlugin = DeviceInfoPlugin();
    final deviceInfo = await deviceInfoPlugin.deviceInfo;

    final info = Info(
        guid: guid,
        deviceInfo: deviceInfo.toMap().toString(),
        dateTime: DateTime.now());

    final result = await prefs.setString(houseName, info.toString());

    api.addStats(info);
    // log('Данные сохранились: ${result.toString()}');
  }
}
