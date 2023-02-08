import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanber_flutter_ta/app/controllers/controllers.dart';
import 'package:sanber_flutter_ta/app/widgets/general_widgets/general_widgets.dart';

class ContactFormScreen extends StatelessWidget {
  final authC = Get.find<AuthController>();
  final contactFormC = Get.put(ContactController());
  ContactFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Contact Form',
        ),
        backgroundColor: Colors.redAccent[700],
      ),
      body: Padding(
        padding: const EdgeInsets.only(
          left: 20,
          right: 20,
          top: 50,
          bottom: 50,
        ),
        child: Column(
          children: [
            CustomInput(
                controller: contactFormC.namaController, labelText: "Nama"),
            const SizedBox(
              height: 5,
            ),
            CustomInput(
                controller: contactFormC.emailController, labelText: "Email"),
            const SizedBox(
              height: 5,
            ),
            CustomInput(
                controller: contactFormC.phoneController, labelText: "No Hp"),
            const SizedBox(
              height: 5,
            ),
            CustomButton(
                text: "Simpan",
                onPressed: () {
                  contactFormC.addContact(authC.userData.value.email!);
                }),
          ],
        ),
      ),
    );
  }
}
