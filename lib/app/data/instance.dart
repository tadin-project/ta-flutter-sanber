import 'package:cloud_firestore/cloud_firestore.dart';

class FsInstance {
  FsInstance._();
  static final FirebaseFirestore db = FirebaseFirestore.instance;
}
