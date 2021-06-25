import 'package:flutter/material.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/login/widget/loginWidget.dart';

import 'otpView.dart';

class CreateAccountView extends StatelessWidget {
  const CreateAccountView({Key? key}) : super(key: key);

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
            loginWidget.titleLogin("Create your account"),
            loginWidget.inputForm(
              controller: TextEditingController(),
              icon: Icon(
                Icons.person,
                color: AppConstrant.appColorPrimaryColor,
              ),
              hint: "User Name",
            ),
            SizedBox(
              height: appDmPrimary * 2,
            ),
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
                Icons.phone_android,
                color: AppConstrant.appColorPrimaryColor,
              ),
              hint: "Phone number",
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
            SizedBox(
              height: appDmPrimary * 2,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: appDmPrimary,
              ),
              width: size.width,
              child: ElevatedButton(
                onPressed: () {
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
                child: Text("Next"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
