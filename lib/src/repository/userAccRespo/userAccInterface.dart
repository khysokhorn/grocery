import 'package:grocery/src/modules/login/usermodel.dart';

abstract class UserAccount {
  Future<String>? createAccount({
    required String userName,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<String>? login({
    required String userEmail,
    required String password,
  }) {}
}
