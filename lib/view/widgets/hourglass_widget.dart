import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/view/screens/home_screen.dart';
import 'package:hogwarts_hourglasses/view/screens/house_screen.dart';

class HourglassWidget extends StatelessWidget {
  const HourglassWidget({Key? key, required this.house}) : super(key: key);
  final House house;

  Image getImage(House house) {
    switch (house) {
      case House.Gryffindor:
        return Image.network(
            'https://static.wikia.nocookie.net/harrypotter/images/0/01/Gryffindor.png/revision/latest?cb=20150807113230&path-prefix=ru');
      case House.Hufflepuff:
        return Image.network(
            'https://static.wikia.nocookie.net/harrypotter/images/c/c9/Hufflepuff.png/revision/latest?cb=20150807113309&path-prefix=ru');
      case House.Ravenclaw:
        return Image.network(
            'https://static.wikia.nocookie.net/harrypotter/images/b/b8/Ravenclaw1.png/revision/latest?cb=20150807113300&path-prefix=ru');
      case House.Slytherin:
        return Image.network(
            'https://static.wikia.nocookie.net/harrypotter/images/f/fe/Slytherin_.png/revision/latest/scale-to-width-down/350?cb=20210801142751&path-prefix=ru');
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        InkWell(
            onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HouseScreen(house: house)),
                ),
            child: Container(
              width: 60,
              height: MediaQuery.of(context).size.height / 3,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(15.0),
                color: getColor(house),
              ),
            )),
        SizedBox(
          width: 50,
          height: 50,
          child: getImage(house),
        ),
      ],
    );
  }
}
