import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/score_controller.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/models/hourglass_model.dart';
import 'package:hogwarts_hourglasses/view/screens/house_screen.dart';
import 'package:provider/provider.dart';

class HourglassWidget extends StatelessWidget {
  const HourglassWidget({Key? key, required this.house}) : super(key: key);
  final HourglassModel house;

  @override
  Widget build(BuildContext context) {
    final c = Provider.of<ScoreController>(context);

    final scoreBarHeight = MediaQuery.of(context).size.height / 2;
    final scoreBarFilledHeight = scoreBarHeight * (house.score / 100);

    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        SizedBox(
          width: MediaQuery.of(context).size.width / 7,
          height: MediaQuery.of(context).size.width / 7,
          child: c.getImage(house),
        ),
        InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HouseScreen(house: house)),
                ),
            child: Stack(
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
            )),
        Text(
          '${c.getScore(house)}',
          style: const TextStyle(fontSize: 21),
        ),
      ],
    );
  }
}
