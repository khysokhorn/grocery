import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:grocery/src/modules/login/usermodel.dart';
import 'package:grocery/src/repository/userAccRespo/UserRepository.dart';

part 'create_account_event.dart';
part 'create_account_state.dart';

class CreateAccountBloc extends Bloc<CreateAccountEvent, CreateAccountState> {
  final UserRepository _repository;

  CreateAccountBloc(this._repository) : super(CreateAccountInitial());

  @override
  Stream<CreateAccountState> mapEventToState(
    CreateAccountEvent event,
  ) async* {
    yield CreateAccountInitial();
    if(event is UserEmailOnChange){
      print(" =======> user event ${event.email}");
    }
    if (event is CreateAccount) {
      yield CreateAccountLoading();
      try {
        var res = await _repository.login(password: '', userEmail: '');

      } catch (e) {
        yield CreateAccountError(e.toString());
      }
    }
  }
}
