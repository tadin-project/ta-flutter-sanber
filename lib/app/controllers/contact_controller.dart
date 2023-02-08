import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:sanber_flutter_ta/app/constants/constanst.dart';
import 'package:sanber_flutter_ta/app/controllers/controllers.dart';
import 'package:sanber_flutter_ta/app/data/data.dart';
import 'package:sanber_flutter_ta/app/models/models.dart';

class ContactController extends GetxController {
  final authC = Get.find<AuthController>();

  late TextEditingController namaController;
  late TextEditingController emailController;
  late TextEditingController phoneController;

  @override
  void onInit() {
    namaController = TextEditingController();
    emailController = TextEditingController();
    phoneController = TextEditingController();
    super.onInit();
  }

  void dispose() {
    super.dispose();
  }

  void addContact(String emailUser) async {
    try {
      final keyNama = namaController.text[0].capitalize;
      final dataSave = await ContactCollection.clc.doc();
      await ContactCollection.clc.doc(dataSave.id).set(ContactModel(
            nama: namaController.text,
            keyNama: keyNama,
            email: emailController.text,
            phone: phoneController.text,
            photoUrl: Img.DEFAULT_PP,
            registerAt: DateTime.now().toIso8601String(),
            userId: emailUser,
            contactId: dataSave.id,
          ).toJson());
      namaController.text = "";
      emailController.text = "";
      phoneController.text = "";
      authC.getAllContact();
      Get.back();
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  void delContact(String contactId) async {
    await ContactCollection.clc.doc(contactId).delete();
    authC.getAllContact();
  }
}
