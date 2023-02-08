import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:sanber_flutter_ta/app/constants/constanst.dart';
import 'package:sanber_flutter_ta/app/data/data.dart';
import 'package:sanber_flutter_ta/app/models/models.dart';
import 'package:sanber_flutter_ta/app/routes/app_routes.dart';

class AuthController extends GetxController {
  final FirebaseAuth _firebaseAuth = FirebaseAuth.instance;

  RxBool isLogin = false.obs;
  RxList listContact = [].obs;
  var userData = UserModel().obs;
  var contactDetail = ContactModel().obs;
  late TextEditingController searchController;

  @override
  void onInit() {
    searchController = TextEditingController();
    super.onInit();
  }

  Future<void> firstInitialized() async {
    bool statusLogin = await cekLogin();
    isLogin.value = statusLogin;
  }

  Future<bool> cekLogin() async {
    // ignore: await_only_futures
    final authData = await _firebaseAuth.currentUser;
    if (authData != null) {
      final currUser = await UserCollection.clc.doc(authData.email).get();
      final currUserModel = currUser.data() as Map<String, dynamic>;
      userData(UserModel.fromJson(currUserModel));
      userData.refresh();

      return true;
    }
    return false;
  }

  Future<void> login({email, password}) async {
    try {
      var user = await _firebaseAuth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ignore: unnecessary_null_comparison
      if (user != null) {
        final ref = await UserCollection.clc.doc(email).get();
        final userFs = ref.data() as Map<String, dynamic>;

        userData(UserModel.fromJson(userFs));
        userData.refresh();
        isLogin.value = true;
        getAllContact();
        Get.offAndToNamed(Routes.HOME);
      }
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> register({
    required nama,
    required phone,
    required email,
    required password,
  }) async {
    try {
      // proses register
      UserCredential user = await _firebaseAuth.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      // ignore: unnecessary_null_comparison
      if (user != null) {
        final String registerAt = DateTime.now().toIso8601String();
        await UserCollection.clc.doc(email).set(
              UserModel(
                nama: nama,
                email: email,
                registerAt: registerAt,
                phone: phone,
                photoUrl: Img.DEFAULT_PP,
              ).toJson(),
            );
        final currUser = await UserCollection.clc.doc(email).get();
        final currUserModel = currUser.data() as Map<String, dynamic>;

        userData(UserModel.fromJson(currUserModel));
        userData.refresh();
        isLogin.value = true;
        getAllContact();
        Get.offAndToNamed(Routes.HOME);
      }
      // ambil data user
      // print(user.user!.email);
    } catch (e) {
      Get.snackbar(
        "Error",
        e.toString(),
        backgroundColor: Colors.red,
        colorText: Colors.white,
      );
    }
  }

  Future<void> logout() async {
    await _firebaseAuth.signOut();
    isLogin.value = false;
    Get.offAndToNamed(Routes.LOGIN);
  }

  // menambahkan koneksi ke user lain
  Future<void> getAllContact() async {
    try {
      listContact.value = [];
      // var getAllData = await ContactCollection.clc
      //     .where("userId", isEqualTo: userData.value.email!)
      //     .get();
      var getAllData;

      if (listContact.value.length == 0 && searchController.text != "") {
        getAllData = await ContactCollection.clc
            .where("userId", isEqualTo: userData.value.email!)
            .where("keyNama", isEqualTo: searchController.text[0].toUpperCase())
            .get();
      } else {
        getAllData = await ContactCollection.clc
            .where("userId", isEqualTo: userData.value.email!)
            .get();
      }

      getAllData.docs.forEach((v) {
        if (searchController.text.length > 1) {
          print((v.data() as Map<String, dynamic>)["nama"].toString());
          if (v.data()["nama"].startsWith(searchController.text)) {
            listContact.value
                .add(ContactModel.fromJson(v.data() as Map<String, dynamic>));
          }
        } else {
          listContact.value
              .add(ContactModel.fromJson(v.data() as Map<String, dynamic>));
        }
        listContact.refresh();
      });
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }

  Future<void> getContactDetail(String contactId) async {
    try {
      final getData = await ContactCollection.clc.doc(contactId).get();
      final data = getData.data() as Map<String, dynamic>;
      print(contactId);
      print(data);
      contactDetail(ContactModel.fromJson(data));
      contactDetail.refresh();
      Get.toNamed(Routes.CONTACT_DETAIL);
    } catch (e) {
      Get.snackbar("Error", e.toString());
    }
  }
}
