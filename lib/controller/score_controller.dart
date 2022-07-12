import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/models/hourglass_model.dart';

class ScoreController with ChangeNotifier {
  var slytherin = HourglassModel(
    name: Names.slytherin,
    score: 0,
  );
  var ravenclaw = HourglassModel(
    name: Names.ravenclaw,
    score: 0,
  );
  var gryffindor = HourglassModel(
    name: Names.gryffindor,
    score: 0,
  );
  var hufflepuff = HourglassModel(
    name: Names.hufflepuff,
    score: 0,
  );

  void addPoints(int howMuch, HourglassModel house) {
    if (house.score + howMuch <= 100) {
      house.score += howMuch;
    } else {
      house.score = 100;
    }
    log('${house.score}');
    notifyListeners();
  }

  void removePoints(int howMuch, HourglassModel house) {
    if (house.score - howMuch >= 0) {
      house.score -= howMuch;
    } else {
      house.score = 0;
    }
    log('${house.score}');
    notifyListeners();
  }

  int getScore(HourglassModel house) {
    return house.score;
  }

  Image getImage(HourglassModel house) {
    switch (house.name) {
      case 'Gryffindor':
        return Image.network(Images.gryffindor);
      case 'Hufflepuff':
        return Image.network(Images.hufflepuff);
      case 'Ravenclaw':
        return Image.network(Images.ravenclaw);
      case 'Slytherin':
        return Image.network(Images.slytherin);
      default:
        return Image.network(Images.emptyLogo);
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
