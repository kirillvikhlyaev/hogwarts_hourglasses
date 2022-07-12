import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/score_controller.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/view/widgets/hourglass_widget.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Provider.of<ScoreController>(context);
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
            HourglassWidget(house: c.slytherin),
            HourglassWidget(house: c.ravenclaw),
            HourglassWidget(house: c.gryffindor),
            HourglassWidget(house: c.hufflepuff)
          ],
        ),
      ),
    );
  }
}
