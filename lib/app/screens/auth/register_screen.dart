import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanber_flutter_ta/app/constants/constanst.dart';
import 'package:sanber_flutter_ta/app/controllers/controllers.dart';
import 'package:sanber_flutter_ta/app/routes/app_routes.dart';
import 'package:sanber_flutter_ta/app/widgets/widgets.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final authC = Get.put(AuthController());

  @override
  Widget build(BuildContext context) {
    final TextEditingController namaController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 60,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 30,
            ),
            // color: Colors.amber,
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
                  height: 40,
                ),
                const Text(
                  "Register",
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w700,
                    color: Color.fromARGB(255, 213, 0, 0),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                AuthInput(
                  controller: namaController,
                  labelText: "Nama Lengkap",
                  hintText: "Masukkan Nama Lengkap Anda...",
                ),
                const SizedBox(
                  height: 5,
                ),
                AuthInput(
                  controller: phoneController,
                  labelText: "Nomor Hp",
                  hintText: "Masukkan Nomor Hp Anda...",
                ),
                const SizedBox(
                  height: 5,
                ),
                AuthInput(
                  controller: emailController,
                  labelText: "Email",
                  hintText: "Masukkan Email Anda...",
                ),
                const SizedBox(
                  height: 5,
                ),
                AuthInput(
                  controller: passwordController,
                  labelText: "Password",
                  hintText: "Masukkan Pasword Anda...",
                  isObsecure: true,
                ),
                const SizedBox(
                  height: 20,
                ),
                CustomButton(
                    text: "Register",
                    onPressed: () {
                      // Get.offAllNamed(Routes.HOME);
                      authC.register(
                        nama: namaController.text,
                        email: emailController.text,
                        password: passwordController.text,
                        phone: phoneController.text,
                      );
                    }),
                const SizedBox(
                  height: 110,
                ),
                Text.rich(
                  TextSpan(
                    text: 'Already have account? ',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                        text: 'Sign In',
                        style: TextStyle(
                          color: Colors.redAccent[700],
                          fontSize: 15,
                        ),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            Get.offAllNamed(Routes.LOGIN);
                          },
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 30,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
