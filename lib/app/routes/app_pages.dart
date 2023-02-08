import 'package:get/get.dart';
import 'package:sanber_flutter_ta/app/routes/app_routes.dart';
import 'package:sanber_flutter_ta/app/screens/screens.dart';

class AppPages {
  AppPages._();

  // ignore: constant_identifier_names
  static const INITIAL = Routes.LOGIN;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => HomeScreen(),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () => const LoginScreen(),
    ),
    GetPage(
      name: Routes.REGISTER,
      page: () => RegisterScreen(),
    ),
    GetPage(
      name: Routes.PROFIL,
      page: () => ProfilScreen(),
    ),
    GetPage(
      name: Routes.CONTACT_DETAIL,
      page: () => ContactDetailScreen(),
    ),
    GetPage(
      name: Routes.CONTACT_FORM,
      page: () => ContactFormScreen(),
    ),
  ];
}
