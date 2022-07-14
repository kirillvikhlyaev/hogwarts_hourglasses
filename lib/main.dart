import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/score_controller.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/view/screens/splash_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => ScoreController(),
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        title: Names.appName,
        theme: ThemeData(
          primarySwatch: Colors.indigo,
        ),
        home: const SplashScreen(),
      ),
    );
  }
}
