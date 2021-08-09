import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/src/modules/login/usermodel.dart';
import 'package:grocery/src/repository/userAccRespo/UserRepository.dart';
import 'package:grocery/src/utils/services/localServices/hiveHelper.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  final UserRepository _userRepository;
  HiveHelper _hiveHelper = HiveHelper();

  CreateAccountBloc(this._userRepository) : super(CreateAccountInitialState());

  @override
  Stream<CreateAccountState> mapEventToState(
    CreateAccountEvent event,
  ) async* {
    yield CreateAccountInitialState();
    if (event is LoginAccountEvent) {
      try {
        print(
          " =======> user event ${event.email} and password ${event.password}",
        );
        yield CreateAccountLoadingState();
        var res = await _userRepository.login(
          userEmail: event.email,
          password: event.password,
        );
        // _hiveHelper.addUser(user!);
        // yield LoginSuccessState(userModel: user);
        print("code ${res!.statusCode}");
        if (res.statusCode >= 200 && res.statusCode <= 299) {
          var userInfoModel = userModelFromJson(res.body);
          print("success body ===> ${res.body}");
          HiveHelper().addUser(userInfoModel);
          yield LoginSuccessState(userModel: userInfoModel);
        } else {
          print("error body ===> ${res.body}");
          yield CreateAccountErrorState(res.body);
        }
        print("====> user $res");
      } catch (e) {
        print("===> error with $e");
        yield CreateAccountErrorState(e.toString());
      }
    }
  }
}
