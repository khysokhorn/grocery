import 'package:flutter/material.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/login/widget/loginWidget.dart';

class ForgetPasswordView extends StatelessWidget {
  const ForgetPasswordView({Key? key}) : super(key: key);

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
            LoginWithTitle(
              title: "Forget Password?",
            ),
            InputForm(
              controller: TextEditingController(),
              icon: Icon(
                Icons.email_outlined,
                color: AppConstrant.appColorPrimaryColor,
              ),
              hint: "Email address",
            ),
            SizedBox(
              height: appDmPrimary * 5,
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: appDmPrimary,
              ),
              width: size.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Log in"),
              ),
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
