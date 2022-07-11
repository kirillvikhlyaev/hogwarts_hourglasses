import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/view/screens/home_screen.dart';
import 'package:hogwarts_hourglasses/view/widgets/score_edit_widget.dart';

class HouseScreen extends StatelessWidget {
  const HouseScreen({Key? key, required this.house}) : super(key: key);
  final House house;

  String getName(House house) {
    switch (house) {
      case House.Gryffindor:
        return 'Gryffindor';
      case House.Hufflepuff:
        return 'Hufflepuff';
      case House.Ravenclaw:
        return 'Ravenclaw';
      case House.Slytherin:
        return 'Slytherin';
    }
  }

  Color getColor(House house) {
    switch (house) {
      case House.Gryffindor:
        return Colors.red[700]!;
      case House.Hufflepuff:
        return Colors.orange[700]!;
      case House.Ravenclaw:
        return Colors.blue[700]!;
      case House.Slytherin:
        return Colors.teal[700]!;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: getColor(house),
        title: Text(
          getName(house),
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: ScoreEditWidget(house: house),
      ),
    );
  }
}
