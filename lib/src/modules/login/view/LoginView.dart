import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/home/view/homeView.dart';
import 'package:grocery/src/modules/login/bloc/register/create_account_bloc.dart';
import 'package:grocery/src/modules/login/view/forgetpassView.dart';
import 'package:grocery/src/modules/login/widget/loginWidget.dart';
import 'package:grocery/src/repository/userAccRespo/UserRepository.dart';
import 'package:grocery/src/utils/services/localServices/hiveHelper.dart';

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
        child: RepositoryProvider(
          create: (context) => UserRepository(),
          child: BlocProvider(
            create: (context) => CreateAccountBloc(
              context.read<UserRepository>(),
            ),
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    children: [
                      LoginWithTitle(title: "Login"),
                      FormLogin(
                          emailController: emailController,
                          passwordController: passwordController),
                      Container(
                        margin:
                            const EdgeInsets.symmetric(vertical: appDmPrimary),
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
                      LoginButton(
                          size: size,
                          emailController: emailController,
                          passwordController: passwordController),
                      Spacer(),
                      SizedBox(
                        height: appDmPrimary,
                      )
                    ],
                  ),
                ),
                NoAcc(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginButton extends StatelessWidget {
  const LoginButton({
    Key? key,
    required this.size,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final Size size;
  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(
        vertical: appDmPrimary,
      ),
      alignment: Alignment.center,
      child: BlocBuilder<CreateAccountBloc, CreateAccountState>(
        builder: (context, state) {
          if (state is CreateAccountLoadingState) {
            return Container(
              width: 45,
              height: 45,
              child: CircularProgressIndicator(),
            );
          }

          return Container(
            width: size.width,
            child: ElevatedButton(
              onPressed: () {
                print(
                  "====> user name ${emailController.text} with pass word ${passwordController.text}",
                );
                // Navigator.push(context, MaterialPageRoute(builder: (context) {
                //   return HomeView();
                // }));
                context.read<CreateAccountBloc>().add(
                      LoginAccountEvent(
                        email: emailController.text,
                        password: passwordController.text,
                      ),
                    );
              },
              child: Text("Login"),
            ),
          );
        },
      ),
    );
  }
}

class FormLogin extends StatelessWidget {
  const FormLogin({
    Key? key,
    required this.emailController,
    required this.passwordController,
  }) : super(key: key);

  final TextEditingController emailController;
  final TextEditingController passwordController;

  @override
  Widget build(BuildContext context) {
    return BlocListener<CreateAccountBloc, CreateAccountState>(
      listener: (context, state) {
        if (state is CreateAccountErrorState) {
          ScaffoldMessenger.of(context)
              .showSnackBar(SnackBar(content: Text(state.error)));
        } else if (state is LoginSuccessState) {
          var user = state.userModel!;
          print("==> user $user");
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text(
                  "Login successful with user name ${state.userModel!.user!.name}")));
          Navigator.pushReplacement(context,
              MaterialPageRoute(builder: (context) {
            return HomeView();
          }));
        }
      },
      child: Form(
        child: Column(
          children: [
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
              obscureText: true,
              icon: Icon(
                Icons.lock_outline,
                color: AppConstrant.appColorPrimaryColor,
              ),
              hint: "Password",
            ),
          ],
        ),
      ),
    );
  }
}

class NoAcc extends StatelessWidget {
  const NoAcc({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
