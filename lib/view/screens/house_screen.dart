import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/score_controller.dart';
import 'package:hogwarts_hourglasses/models/hourglass_model.dart';
import 'package:hogwarts_hourglasses/view/widgets/hourgalss_widget.dart';
import 'package:hogwarts_hourglasses/view/widgets/score_interaction_form.dart';
import 'package:provider/provider.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({Key? key, required this.house}) : super(key: key);
  final HourglassModel house;

  @override
  Widget build(BuildContext context) {
    final c = Provider.of<ScoreController>(context);

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: c.getColor(house),
        title: Text(
          house.name,
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: SizedBox(
          height: MediaQuery.of(context).size.height - 100,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 16.0),
                child: Text('${house.name} hourglasses',
                    style: Theme.of(context).textTheme.headline5),
              ),
              HourglassWidget(house: house),
              ScoreForm(house: house),
            ],
          ),
        ),
      ),
    );
  }
}
