import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/login/bloc/register/create_account_bloc.dart';
import 'package:grocery/src/modules/login/view/forgetpassView.dart';
import 'package:grocery/src/modules/login/widget/loginWidget.dart';
import 'package:grocery/src/repository/userAccRespo/UserRepository.dart';

import 'createAccount.dart';

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  _LoginViewState createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  late TextEditingController emailController;
  late TextEditingController passwordController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    emailController = TextEditingController();
    passwordController = TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios_outlined,
            color: AppConstrant.appColorBlack,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        margin: EdgeInsets.all(appDmPrimary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            LoginWithTitle(title: "Login"),
            InputForm(
              controller: emailController,
              icon: Icon(
                Icons.email_outlined,
                color: AppConstrant.appColorPrimaryColor,
              ),
              hint: "Email address",
            ),
            SizedBox(
              height: appDmPrimary * 2,
            ),
            InputForm(
              controller: passwordController,
              icon: Icon(
                Icons.lock_outline,
                color: AppConstrant.appColorPrimaryColor,
              ),
              hint: "Password",
            ),
            Container(
              margin: const EdgeInsets.symmetric(vertical: appDmPrimary),
              child: Align(
                alignment: Alignment.center,
                child: TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return ForgetPasswordView();
                        },
                      ),
                    );
                  },
                  child: Text("Forget Password"),
                ),
              ),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: appDmPrimary,
              ),
              width: size.width,
              child: RepositoryProvider(
                create: (context) => UserRepository(),
                child: BlocProvider(
                  create: (context) =>
                      CreateAccountBloc(context.read<UserRepository>()),
                  child: BlocBuilder<CreateAccountBloc, CreateAccountState>(
                    builder: (context, state) {

                      return ElevatedButton(
                        onPressed: () {
                          context.read<CreateAccountBloc>().add(
                                LoginAccount(
                                    email: emailController.text,
                                    password: passwordController.text),
                              );
                        },
                        child: Text("Login"),
                      );
                    },
                  ),
                ),
              ),
            ),
            Spacer(),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Don't have an account ?"),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return CreateAccountView();
                        },
                      ),
                    );
                  },
                  child: Text("Sign up"),
                )
              ],
            ),
            SizedBox(
              height: appDmPrimary,
            )
          ],
        ),
      ),
    );
  }
}
