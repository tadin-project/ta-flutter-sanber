import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanber_flutter_ta/app/controllers/controllers.dart';
import 'package:sanber_flutter_ta/app/routes/app_pages.dart';
import 'package:sanber_flutter_ta/app/routes/app_routes.dart';
import 'package:sanber_flutter_ta/app/screens/screens.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    var authC = Get.put(AuthController(), permanent: true);
    return FutureBuilder(
      future: Future.delayed(
        const Duration(
          seconds: 3,
        ),
      ),
      builder: ((context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return GetMaterialApp(
            title: 'Sanber Chat',
            initialRoute: authC.isLogin.value ? Routes.HOME : Routes.LOGIN,
            // initialRoute: AppPages.INITIAL,
            getPages: AppPages.routes,
            debugShowCheckedModeBanner: false,
          );
        }
        return FutureBuilder(
          future: authC.firstInitialized(),
          builder: (context, snapshot) {
            return const SplashScreen();
          },
        );
      }),
    );
  }
}
