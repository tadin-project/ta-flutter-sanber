import 'package:flutter/material.dart';
import 'package:sanber_flutter_ta/app/constants/constanst.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: SizedBox(
                  width: 120,
                  child: Image.asset(
                    Img.LOGO,
                  ),
                ),
              ),
              const SizedBox(
                height: 10,
              ),
              const CircularProgressIndicator(),
            ],
          ),
        ),
      ),
    );
  }
}
