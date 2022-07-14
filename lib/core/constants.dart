import 'package:flutter/material.dart';

class AppColors {
  static Color appColor = Colors.indigo;

  static Color slytherin = const Color.fromRGBO(42, 98, 61, 1.0);
  static Color ravenclaw = const Color.fromRGBO(34, 47, 91, 1.0);
  static Color gryffindor = const Color.fromRGBO(174, 0, 1, 1.0);
  static Color hufflepuff = const Color.fromRGBO(240, 199, 94, 1.0);

  static Color emptyBar = const Color.fromARGB(255, 218, 218, 218);
}

class Names {
  static String appName = 'Hogwarts Hourglasses';

  static String slytherin = 'Slytherin';
  static String ravenclaw = 'Ravenclaw';
  static String gryffindor = 'Gryffindor';
  static String hufflepuff = 'Hufflepuff';

  static String apiUrl = 'http://192.168.56.1:8080';
}

class Images {
  static String hogwarts =
      'assets/images/Hogwarts.png';

  static String slytherin =
      'assets/images/Slytherin.png';
  static String ravenclaw =
      'assets/images/Ravenclaw.png';
  static String gryffindor =
      'assets/images/Gryffindor.png';
  static String hufflepuff =
      'assets/images/Hufflepuff.png';
  static String emptyLogo =
      'assets/images/Hogwarts.png';
}
