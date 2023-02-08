import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanber_flutter_ta/app/constants/constanst.dart';
import 'package:sanber_flutter_ta/app/controllers/controllers.dart';
import 'package:sanber_flutter_ta/app/routes/app_routes.dart';
import 'package:sanber_flutter_ta/app/widgets/widgets.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();
    final TextEditingController passwordController = TextEditingController();
    var authC = Get.put(AuthController());

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.only(
            top: 60,
          ),
          child: Container(
            margin: const EdgeInsets.symmetric(
              horizontal: 60,
            ),
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
                  height: 30,
                ),
                const Text(
                  "Login",
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
                  controller: emailController,
                  labelText: "Email",
                  hintText: "Masukkan Email Anda...",
                ),
                const SizedBox(
                  height: 15,
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
                // InkWell(
                //   onTap: () {},
                //   child: Text(
                //     "Forgot Password",
                //     style: TextStyle(
                //       fontSize: 15,
                //       color: Colors.redAccent[700],
                //     ),
                //   ),
                // ),
                const SizedBox(
                  height: 10,
                ),
                CustomButton(
                    text: "Login",
                    onPressed: () {
                      authC.login(
                        email: emailController.text,
                        password: passwordController.text,
                      );
                    }),
                const SizedBox(
                  height: 150,
                ),
                Text.rich(
                  TextSpan(
                    text: 'New User? ',
                    style: const TextStyle(
                      fontSize: 15,
                    ),
                    children: [
                      TextSpan(
                          text: 'Create Account',
                          style: TextStyle(
                            color: Colors.redAccent[700],
                            fontSize: 15,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.offAllNamed(Routes.REGISTER);
                            }),
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
