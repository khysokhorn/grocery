import 'package:grocery/src/constants/api_path.dart';
import 'package:grocery/src/repository/BaseRepository.dart';
import 'package:grocery/src/repository/userAccRespo/userAccInterface.dart';
import 'package:http/http.dart';

class UserRepository extends BaseRepository implements UserAccount   {

  @override
  Future<String>? createAccount(
      {required String userName,
      required String email,
      required String phoneNumber,
      required String password}) async {
    print(
        "===> user information  email $email name $userName phone number $phoneNumber pass $password");
    return await baseRequest.post(
      'register',
      {
        "name": "$userName",
        "email": "$email",
        "password": "$password",
      },
    );
  }

  @override
  Future<Response?>? login(
      {required String userEmail, required String password}) async {
    Response? res;
    await baseRequest.post1(
        APICONST.login,
        {
          "email": userEmail,
          "password": password,
        },
        (response) => {res = response});
    return res;
  }
}
