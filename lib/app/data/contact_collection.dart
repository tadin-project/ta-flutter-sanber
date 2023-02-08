import 'instance.dart';

class ContactCollection {
  ContactCollection._();
  static final clc = FsInstance.db.collection('contacts');
}
