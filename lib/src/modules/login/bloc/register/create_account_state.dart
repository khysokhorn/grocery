part of 'create_account_bloc.dart';

abstract class CreateAccountState extends Equatable {
  const CreateAccountState();
}

class CreateAccountInitialState extends CreateAccountState {
  @override
  List<Object> get props => [];
}

class CreateAccountErrorState extends CreateAccountState {
  final String error;

  CreateAccountErrorState(this.error);

  @override
  List<Object?> get props => [];
}

class CreateAccountLoadingState extends CreateAccountState {
  @override
  List<Object?> get props => [];
}

class CreateAccSubmitSuccessState extends CreateAccountState {
  final String res;

  CreateAccSubmitSuccessState(this.res);

  @override
  List<Object?> get props => [res];
}

class LoginSuccessState extends CreateAccountState {
  final UserModel? userModel;

  LoginSuccessState({required this.userModel});

  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}
