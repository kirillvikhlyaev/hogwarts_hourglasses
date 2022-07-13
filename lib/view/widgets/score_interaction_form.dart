import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hogwarts_hourglasses/controller/score_controller.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/models/hourglass_model.dart';
import 'package:provider/provider.dart';

final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
TextEditingController editController = TextEditingController();

class ScoreForm extends StatelessWidget {
  const ScoreForm({Key? key, required this.house}) : super(key: key);
  final HourglassModel house;

  @override
  Widget build(BuildContext context) {
    final c = Provider.of<ScoreController>(context);
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 50.0),
          child: Form(
            key: _formKey,
            child: TextFormField(
              controller: editController,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Enter the number of points';
                } else if (int.parse(value) >= 100) {
                  return 'The number of points should not exceed 100';
                }
                return null;
              },
              maxLines: 1,
              keyboardType: TextInputType.number,
              inputFormatters: [FilteringTextInputFormatter.digitsOnly],
              decoration: InputDecoration(
                hintText: 'Enter the number of points',
                filled: true,
                fillColor: AppColors.emptyBar,
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(25.0),
                    borderSide: BorderSide.none),
                errorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 1,
                  ),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(25.0),
                  borderSide: BorderSide(
                    color: c.getColor(house),
                    width: 2,
                  ),
                ),
                focusedErrorBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10.0),
                  borderSide: const BorderSide(
                    color: Colors.red,
                    width: 2,
                  ),
                ),
              ),
            ),
          ),
        ),
        const SizedBox(height: 25),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    int value = int.tryParse(editController.text)!;
                    editController.text = '';
                    c.removePoints(value, house);
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 35),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.red),
                ),
                child: const Icon(Icons.remove)),
            const SizedBox(width: 25),
            ElevatedButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    int value = int.tryParse(editController.text)!;
                    editController.text = '';
                    c.addPoints(value, house);
                  }
                },
                style: ButtonStyle(
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 35),
                  ),
                  backgroundColor: MaterialStateProperty.all(Colors.green),
                ),
                child: const Icon(Icons.add)),
          ],
        ),
      ],
    );
  }
}
