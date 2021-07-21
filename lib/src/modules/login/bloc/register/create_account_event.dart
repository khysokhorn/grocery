part of 'create_account_bloc.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();
}

class UserEmailOnChange extends CreateAccountEvent {
  final String email;

  UserEmailOnChange({required this.email});

  @override
  List<Object?> get props => [email];
}

class PasswordOnChange extends CreateAccountEvent {
  final String userName;

  PasswordOnChange({required this.userName});

  @override
  List<Object?> get props => [];
}

class CreateAccount extends CreateAccountEvent {
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;

  CreateAccount({
    required this.userName,
    required this.email,
    required this.phoneNumber,
    required this.password,
  });

  @override
  List<Object?> get props => [
        userName,
        email,
        phoneNumber,
        password,
      ];
}

class LoginAccount extends CreateAccountEvent {
  final String email;

  final String password;

  LoginAccount({required this.email, required this.password});

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
