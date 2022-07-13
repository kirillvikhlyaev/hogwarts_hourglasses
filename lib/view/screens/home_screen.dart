import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/score_controller.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/view/widgets/main_hourglass_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Provider.of<ScoreController>(context);
    c.getInfoFromServer();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        centerTitle: true,
        title: Text(
          Names.appName,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            MainHourglassWidget(house: c.houses[0]),
            MainHourglassWidget(house: c.houses[1]),
            MainHourglassWidget(house: c.houses[2]),
            MainHourglassWidget(house: c.houses[3])
          ],
        ),
      ),
    );
  }
}
