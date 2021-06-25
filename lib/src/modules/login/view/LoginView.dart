import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/home/view/homeView.dart';
import 'package:grocery/src/modules/login/view/forgetpassView.dart';
import 'package:grocery/src/modules/login/widget/loginWidget.dart';

import 'createAccount.dart';

class LoginView extends StatelessWidget {
  const LoginView({Key? key}) : super(key: key);

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
      body: Container(
        margin: EdgeInsets.all(appDmPrimary),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            loginWidget.titleLogin("Login"),
            loginWidget.inputForm(
              controller: TextEditingController(),
              icon: Icon(
                Icons.email_outlined,
                color: AppConstrant.appColorPrimaryColor,
              ),
              hint: "Email address",
            ),
            SizedBox(
              height: appDmPrimary * 2,
            ),
            loginWidget.inputForm(
              controller: TextEditingController(),
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
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) {
                        return HomeView();
                      },
                    ),
                  );
                },
                child: Text("Log in"),
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
