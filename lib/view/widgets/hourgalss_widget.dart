import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/score_controller.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/models/hourglass_model.dart';
import 'package:provider/provider.dart';

class HourglassWidget extends StatelessWidget {
  const HourglassWidget({Key? key, required this.house}) : super(key: key);
  final HourglassModel house;

  @override
  Widget build(BuildContext context) {
    final c = Provider.of<ScoreController>(context);
    final scoreBarHeight = MediaQuery.of(context).size.height / 2;
    final scoreBarFilledHeight = scoreBarHeight * (house.score / 100);

    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Container(
          width: 60,
          height: scoreBarHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: AppColors.emptyBar,
          ),
        ),
        Container(
          width: 60,
          height: scoreBarFilledHeight,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: c.getColor(house),
          ),
        ),
      ],
    );
  }
}
