import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/src/constants/app_constrant.dart';
import 'package:grocery/src/modules/login/widget/loginWidget.dart';

class OTPView extends StatelessWidget {
  const OTPView({Key? key}) : super(key: key);

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
            LoginWithTitle(title: "Enter OTP Code"),
            Container(
              margin: EdgeInsets.symmetric(horizontal: appDmPrimary),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  OTPWidget(controller: TextEditingController()),
                  OTPWidget(controller: TextEditingController()),
                  OTPWidget(controller: TextEditingController()),
                  OTPWidget(controller: TextEditingController()),
                ],
              ),
            ),
            SizedBox(
              height: appDmPrimary,
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(vertical: appDmPrimary),
              child: Text("Resend 00:20"),
            ),
            Container(
              margin: const EdgeInsets.symmetric(
                vertical: appDmPrimary * 2,
              ),
              width: size.width,
              child: ElevatedButton(
                onPressed: () {},
                child: Text("Next"),
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
