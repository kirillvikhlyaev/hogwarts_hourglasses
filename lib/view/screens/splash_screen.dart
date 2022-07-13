import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:hogwarts_hourglasses/controller/dumbledore_mode_conroller.dart';
import 'package:hogwarts_hourglasses/controller/local_storage_controller.dart';
import 'package:hogwarts_hourglasses/core/constants.dart';
import 'package:hogwarts_hourglasses/view/screens/dumbledore_screen.dart';
import 'package:hogwarts_hourglasses/view/screens/home_screen.dart';
import 'package:provider/provider.dart';

GlobalKey<FormState> _splashScreenFormKey = GlobalKey<FormState>();

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // Future.delayed(
    //     const Duration(milliseconds: 5000),
    //     () => Navigator.pushReplacement(
    //         context, MaterialPageRoute(builder: (context) => HomeScreen())));
  }

  List<String> houses = [
    Names.slytherin,
    Names.ravenclaw,
    Names.gryffindor,
    Names.hufflepuff
  ];

  String currentHouse = Names.slytherin;

  final storageController = LocalStorageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.appColor,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: MediaQuery.of(context).size.width / 2,
              width: MediaQuery.of(context).size.width / 2,
              child: CachedNetworkImage(
                progressIndicatorBuilder: (context, url, progress) =>
                    const CircularProgressIndicator(),
                imageUrl: Images.hogwarts,
                errorWidget: (context, error, status) =>
                    const Icon(Icons.error),
              ),
            ),
            const SizedBox(height: 10),
            Text(Names.appName,
                style: const TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 26)),
            const SizedBox(height: 25),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 105.0),
              child: Form(
                key: _splashScreenFormKey,
                child: DropdownButtonFormField(
                  hint: const Text('Choose house',
                      style: TextStyle(color: Colors.white, fontSize: 18)),
                  dropdownColor: Colors.indigo[700],
                  iconEnabledColor: Colors.white,
                  icon: const Icon(Icons.arrow_downward),
                  items: houses.map<DropdownMenuItem<String>>((String value) {
                    return DropdownMenuItem(
                      value: value,
                      child: Text(value,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 18)),
                    );
                  }).toList(),
                  onChanged: (String? value) {
                    setState(() {
                      currentHouse = value!;
                    });
                  },
                  validator: (value) => value == null ? 'field required' : null,
                ),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all(Colors.white),
                  shape: MaterialStateProperty.all(const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(Radius.circular(20)))),
                  padding: MaterialStateProperty.all(
                    const EdgeInsets.symmetric(vertical: 14.0, horizontal: 35),
                  ),
                ),
                onPressed: () {
                  if (_splashScreenFormKey.currentState!.validate()) {
                    storageController.saveToStorage();
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const HomeScreen()));
                  }
                },
                child: const Text('Log In',
                    style: TextStyle(
                        color: Colors.indigo,
                        fontSize: 16,
                        fontWeight: FontWeight.bold)))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () => Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => ChangeNotifierProvider(
              create: (_) => DumbledoreModeController(),
              child: const DumbledoreScreen(),
            ),
          ),
        ),
        backgroundColor: Colors.yellow[700],
        child: const Icon(Icons.star, color: Colors.white),
      ),
    );
  }
}
