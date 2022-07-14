import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/api_handler.dart';
import 'package:hogwarts_hourglasses/models/info.dart';

class DumbledoreModeController with ChangeNotifier {
  final api = ApiHandler();

  List<Info> infoList = [
    Info(
      guid: 0,
      deviceInfo: "",
      dateTime: DateTime.fromMicrosecondsSinceEpoch(0),
    ),
  ];

  void updateData() async {
    infoList = await api.fetchStats();
    notifyListeners();
  }
}
