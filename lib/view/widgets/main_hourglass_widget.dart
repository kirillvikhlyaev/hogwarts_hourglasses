import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/score_controller.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/models/hourglass_model.dart';
import 'package:hogwarts_hourglasses/view/screens/house_screen.dart';
import 'package:hogwarts_hourglasses/view/widgets/hourgalss_widget.dart';
import 'package:provider/provider.dart';

class MainHourglassWidget extends StatelessWidget {
  const MainHourglassWidget({Key? key, required this.house}) : super(key: key);
  final HourglassModel house;

  @override
  Widget build(BuildContext context) {
    final c = Provider.of<ScoreController>(context);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 7,
          height: MediaQuery.of(context).size.width / 7,
          child: c.getImage(house),
        ),
        HourglassWidget(house: house),
        Text(
          '${c.getScore(house)}',
          style: const TextStyle(fontSize: 21),
        ),
      ],
    );
  }
}
