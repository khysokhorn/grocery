import 'package:grocery/src/modules/login/usermodel.dart';
import 'package:hive/hive.dart';

class HiveHelper {
  var _userHive = Hive.box("UserModel");

  void addUser(UserModel userModel) {
    _userHive.put("UserModel", userModel);
  }

  UserModel? getUserModel() {
    return _userHive.get('UserModel');
  }

  void deleteUser() {
    _userHive.delete("UserModel");
  }
}
