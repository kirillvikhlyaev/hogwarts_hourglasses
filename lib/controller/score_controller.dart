import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/api_handler.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/models/hourglass_model.dart';

class ScoreController with ChangeNotifier {
  final api = ApiHandler();
  List<HourglassModel> houses = [
    HourglassModel(
      id: 0,
      name: Names.slytherin,
      score: 0,
    ),
    HourglassModel(
      id: 1,
      name: Names.ravenclaw,
      score: 0,
    ),
    HourglassModel(
      id: 2,
      name: Names.gryffindor,
      score: 0,
    ),
    HourglassModel(
      id: 3,
      name: Names.hufflepuff,
      score: 0,
    )
  ];

  void getInfoFromServer() async {
    houses = await api.fetchData();
    notifyListeners();
  }

  void addPoints(int howMuch, HourglassModel house) {
    if (house.score + howMuch <= 100) {
      house.score += howMuch;
    } else {
      house.score = 100;
    }
    log('${house.score}');
    api.updateData(house);
    notifyListeners();
  }

  void removePoints(int howMuch, HourglassModel house) {
    if (house.score - howMuch >= 0) {
      house.score -= howMuch;
    } else {
      house.score = 0;
    }
    log('${house.score}');

    api.updateData(house);
    notifyListeners();
  }

  int getScore(HourglassModel house) {
    return house.score;
  }

  String getImage(HourglassModel house) {
    switch (house.name) {
      case 'Gryffindor':
        return Images.gryffindor;
      case 'Hufflepuff':
        return Images.hufflepuff;
      case 'Ravenclaw':
        return Images.ravenclaw;
      case 'Slytherin':
        return Images.slytherin;
      default:
        return Images.emptyLogo;
    }
  }

  Color getColor(HourglassModel house) {
    switch (house.name) {
      case 'Gryffindor':
        return AppColors.gryffindor;
      case 'Hufflepuff':
        return AppColors.hufflepuff;
      case 'Ravenclaw':
        return AppColors.ravenclaw;
      case 'Slytherin':
        return AppColors.slytherin;
      default:
        return AppColors.emptyBar;
    }
  }
}
