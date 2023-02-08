import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:sanber_flutter_ta/app/controllers/controllers.dart';

class ContactDetailScreen extends StatelessWidget {
  final authC = Get.find<AuthController>();
  ContactDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Contact Detail",
        ),
        backgroundColor: Colors.redAccent[700],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.network(authC.contactDetail.value.photoUrl!),
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text("Nama : " + authC.contactDetail.value.nama!),
            const SizedBox(
              height: 10,
            ),
            Text("Email : " + authC.contactDetail.value.email!),
            const SizedBox(
              height: 10,
            ),
            Text("Nomor Hp : " + authC.contactDetail.value.phone!),
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
