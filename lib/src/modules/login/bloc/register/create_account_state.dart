part of 'create_account_bloc.dart';

abstract class CreateAccountState extends Equatable {
  const CreateAccountState();
}

class CreateAccountInitial extends CreateAccountState {
  @override
  List<Object> get props => [];
}

class CreateAccountError extends CreateAccountState {
  final String error;

  CreateAccountError(this.error);

  @override
  List<Object?> get props => [];
}

class CreateAccountLoading extends CreateAccountState {
  @override
  List<Object?> get props => [];
}

class CreateAccSubmitSuccess extends CreateAccountState {
  final String res;

  CreateAccSubmitSuccess(this.res);

  @override
  List<Object?> get props => [res];
}

class LoginSuccess extends CreateAccountState {
  final UserModel userModel;

  LoginSuccess({required this.userModel});

  @override
  // TODO: implement props
  List<Object?> get props => [userModel];
}
