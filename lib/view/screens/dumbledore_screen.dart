import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:hogwarts_hourglasses/controller/dumbledore_mode_conroller.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
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
              padding: EdgeInsets.symmetric(horizontal: 16.0),
              child: Card(
                child: ListTile(
                  title: Text('GUID: ${c.info.guid}'),
                  subtitle: Text('DEVICE INFO: ${c.info.deviceInfo}'),
                ),
              ),
            );
          },
          itemCount: 1,
          separatorBuilder: (BuildContext context, int index) =>
              const SizedBox(height: 10),
        ),
      ),
    );
  }
}
