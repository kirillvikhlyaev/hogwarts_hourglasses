import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/view/widgets/hourglass_widget.dart';

enum House {
  Gryffindor,
  Hufflepuff,
  Ravenclaw,
  Slytherin,
}

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal[800],
        centerTitle: true,
        title: const Text(
          'Hogwarts Hourglasses',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            HourglassWidget(
              house: House.Slytherin,
            ),
            HourglassWidget(
              house: House.Ravenclaw,
            ),
            HourglassWidget(
              house: House.Hufflepuff,
            ),
            HourglassWidget(
              house: House.Gryffindor,
            ),
          ],
        ),
      ),
    );
  }
}
