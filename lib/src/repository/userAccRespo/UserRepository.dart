import 'package:grocery/src/modules/login/usermodel.dart';
import 'package:grocery/src/repository/BaseRepository.dart';
import 'package:grocery/src/repository/userAccRespo/userAccInterface.dart';

import '../baseRequest.dart';

class UserRepository extends BaseRepository implements UserAccount   {

  @override
  Future<String>? createAccount(
      {required String userName,
      required String email,
      required String phoneNumber,
      required String password}) async {
    print(
        "===> user information  email $email name $userName phone number $phoneNumber pass $password");
    return await  baseRequest.post(
      'register',
      {
        "name": "$userName",
        "email": "$email",
        "password": "$password",
      },
    );
  }

  @override
  Future<String>? login({required String userEmail, required String password}) async {
    return await baseRequest.post("", {

    });
  }
}
