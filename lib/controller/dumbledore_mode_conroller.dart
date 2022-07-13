import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/api_handler.dart';
import 'package:hogwarts_hourglasses/models/info.dart';

class DumbledoreModeController with ChangeNotifier {
  final api = ApiHandler();

  Info info = Info(guid: 0, deviceInfo: "");

  void updateData() async {
    info = await api.fetchStats();
    notifyListeners();
  }
}
