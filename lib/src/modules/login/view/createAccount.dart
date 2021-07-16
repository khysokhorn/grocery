import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/login/bloc/register/create_account_bloc.dart';
import 'package:grocery/src/modules/login/widget/loginWidget.dart';
import 'package:grocery/src/repository/userAccRespo/UserRepository.dart';

import 'otpView.dart';

class CreateAccountView extends StatefulWidget {
  const CreateAccountView({Key? key}) : super(key: key);

  @override
  _CreateAccountViewState createState() => _CreateAccountViewState();
}

class _CreateAccountViewState extends State<CreateAccountView> {
  late var userNameController;
  late var emailController;
  late var passwordController;

  @override
  void initState() {
    userNameController = TextEditingController();
    passwordController = TextEditingController();
    emailController = TextEditingController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    LoginWidget loginWidget = LoginWidget();
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
      body: RepositoryProvider(
        create: (context) => UserRepository(),
        child: BlocProvider(
          create: (context) =>
              CreateAccountBloc(context.read<UserRepository>()),
          child: SingleChildScrollView(
            child: Container(
              margin: EdgeInsets.all(appDmPrimary),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  loginWidget.titleLogin("Create your account"),
                  loginWidget.inputForm(
                    controller: userNameController,
                    icon: Icon(
                      Icons.person,
                      color: AppConstrant.appColorPrimaryColor,
                    ),
                    hint: "User Name",
                  ),
                  SizedBox(
                    height: appDmPrimary * 2,
                  ),
                  Container(
                    child: BlocBuilder<CreateAccountBloc, CreateAccountState>(
                      builder: (context, state) {
                        return loginWidget.inputForm(
                          controller: emailController,
                          onTextChange: (email) {
                            context
                                .read<CreateAccountBloc>()
                                .add(UserEmailOnChange(email: email));
                          },
                          icon: Icon(
                            Icons.email_outlined,
                            color: AppConstrant.appColorPrimaryColor,
                          ),
                          hint: "Email address",
                        );
                      },
                    ),
                  ),
                  SizedBox(
                    height: appDmPrimary * 2,
                  ),
                  loginWidget.inputForm(
                    icon: Icon(
                      Icons.phone_android,
                      color: AppConstrant.appColorPrimaryColor,
                    ),
                    hint: "Phone number",
                  ),
                  SizedBox(
                    height: appDmPrimary * 2,
                  ),
                  loginWidget.inputForm(
                    obscureText: true,
                    controller: passwordController,
                    icon: Icon(
                      Icons.lock_outline,
                      color: AppConstrant.appColorPrimaryColor,
                    ),
                    hint: "Password",
                  ),
                  SizedBox(
                    height: appDmPrimary * 2,
                  ),
                  Container(
                    margin: const EdgeInsets.symmetric(
                      vertical: appDmPrimary,
                    ),
                    width: size.width,
                    child: BlocBuilder<CreateAccountBloc, CreateAccountState>(
                      builder: (context, state) {
                        return ElevatedButton(
                          onPressed: () {
                            context.read<CreateAccountBloc>().add(
                                  CreateAccount(
                                    userName: userNameController.text,
                                    phoneNumber: "",
                                    email: emailController.text,
                                    password: passwordController.text,
                                  ),
                                );
                            //  enter OTP code
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) {
                                  return OTPView();
                                },
                              ),
                            );
                          },
                          child: Text("Register"),
                        );
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
