part of 'create_account_bloc.dart';

abstract class CreateAccountEvent extends Equatable {
  const CreateAccountEvent();
}

class UserEmailOnChangeEvent extends CreateAccountEvent {
  final String email;

  UserEmailOnChangeEvent({required this.email});

  @override
  List<Object?> get props => [email];
}

class PasswordOnChangeEvent extends CreateAccountEvent {
  final String userName;

  PasswordOnChangeEvent({required this.userName});

  @override
  List<Object?> get props => [];
}

class CreateAccountSubmitEvent extends CreateAccountEvent {
  final String userName;
  final String email;
  final String phoneNumber;
  final String password;

  CreateAccountSubmitEvent({
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

class LoginAccountEvent extends CreateAccountEvent {
  final String email;

  final String password;

  LoginAccountEvent({required this.email, required this.password});

  @override
  List<Object?> get props => [
        email,
        password,
      ];
}
