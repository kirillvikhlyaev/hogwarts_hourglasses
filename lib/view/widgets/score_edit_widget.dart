import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/view/screens/home_screen.dart';

class ScoreEditWidget extends StatelessWidget {
  const ScoreEditWidget({Key? key, required this.house}) : super(key: key);

  final House house;

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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.add),
        ),
        Container(
          width: 60,
          height: MediaQuery.of(context).size.height / 3,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15.0),
            color: getColor(house),
          ),
        ),
        IconButton(
          onPressed: () {},
          icon: const Icon(Icons.remove),
        ),
      ],
    );
  }
}
