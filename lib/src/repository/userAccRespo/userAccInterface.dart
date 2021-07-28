import 'package:grocery/src/modules/login/usermodel.dart';
import 'package:http/http.dart';

abstract class UserAccount {
  Future<String>? createAccount({
    required String userName,
    required String email,
    required String phoneNumber,
    required String password,
  });

  Future<Response?>? login({
    required String userEmail,
    required String password,
  }) async{}
}
