import 'instance.dart';

class UserCollection {
  UserCollection._();
  static final clc = FsInstance.db.collection('users');
}
