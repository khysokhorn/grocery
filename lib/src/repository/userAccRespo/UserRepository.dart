import 'package:grocery/src/repository/userAccRespo/userAccInterface.dart';

import '../baseRequest.dart';

class UserRepository implements UserAccount {
  AppBaseRequest _baseRequest = AppBaseRequest();

  @override
  Future<String>? createAccount(
      {required String userName,
      required String email,
      required String phoneNumber,
      required String password}) async {
    print(
        "===> user information  email $email name $userName phone number $phoneNumber pass $password");
    return await _baseRequest.post(
      'register',
      {
        "name": "$userName",
        "email": "$email",
        "password": "$password",
      },
    );
  }

  @override
  void login({required String userEmail, required String password}) async {}
}
