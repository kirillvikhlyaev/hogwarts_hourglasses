import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/api_handler.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/models/info.dart';

class DetailInfoScreen extends StatelessWidget {
  DetailInfoScreen({Key? key, required this.guid}) : super(key: key);
  final String guid;
  final api = ApiHandler();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        centerTitle: true,
        title: Text(guid),
      ),
      body: FutureBuilder(
        future: api.getStatById(guid),
        builder: (BuildContext context, AsyncSnapshot<Info> snapshot) {
          if (snapshot.hasError) {
            return const Center(child: Text('Ошибка соединения'));
          } else if (snapshot.hasData) {
            return Padding(
              padding: const EdgeInsets.all(16.0),
              child: ListView(
                children: [
                  const Text('Log in date:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text('${snapshot.data!.dateTime}'),
                  const SizedBox(height: 10),
                  const Text('Device info:',
                      style: TextStyle(fontWeight: FontWeight.bold)),
                  Text(snapshot.data!.deviceInfo),
                ],
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
