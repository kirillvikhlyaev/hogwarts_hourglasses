import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/dumbledore_mode_conroller.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/view/screens/detail_info_screen.dart';
import 'package:provider/provider.dart';

class DumbledoreScreen extends StatelessWidget {
  const DumbledoreScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final c = Provider.of<DumbledoreModeController>(context);
    c.updateData();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.appColor,
        centerTitle: true,
        title: const Text(
          'X-Dumbledore-Mode',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: ColoredBox(
        color: Colors.grey[300]!,
        child: ListView.separated(
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                child: ListTile(
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => DetailInfoScreen(
                        guid: c.infoList[index].guid.toString(),
                      ),
                    ),
                  ),
                  title: Text('GUID: ${c.infoList[index].guid}'),
                  subtitle: Text('LOG IN DATE: ${c.infoList[index].dateTime}'),
                  trailing: const Icon(Icons.arrow_forward),
                ),
              ),
            );
          },
          itemCount: c.infoList.length,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 10),
        ),
      ),
    );
  }
}
