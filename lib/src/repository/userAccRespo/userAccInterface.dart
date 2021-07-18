abstract class UserAccount {
  Future<String>? createAccount({
    required String userName,
    required String email,
    required String phoneNumber,
    required String password,
  });

   login({
    required String userEmail,
    required String password,
  }) {}
}
