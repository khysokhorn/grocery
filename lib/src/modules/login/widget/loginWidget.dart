import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/src/constants/app_constrant.dart';

class LoginWithTitle extends StatelessWidget {
  const LoginWithTitle({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(appDmPrimary),
      child: Text(
        "$title",
        style: TextStyle(
          color: AppConstrant.appColorBlack,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}

class InputForm extends StatelessWidget {
  const InputForm(
      {Key? key,
      this.controller,
      required this.icon,
      required this.hint,
      this.onTextChange,
      this.obscureText = false})
      : super(key: key);
  final TextEditingController? controller;
  final Icon icon;
  final String hint;
  final bool obscureText;
  final Function(String textChange)? onTextChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(left: appDmPrimary),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppConstrant.appColorPrimaryColor,
        ),
        borderRadius: BorderRadius.circular(appDmPrimary - 5),
      ),
      child: TextField(
        onChanged: onTextChange,
        obscureText: obscureText,
        controller: controller,
        decoration: InputDecoration(
          icon: icon,
          border: InputBorder.none,
          hintText: "$hint",
        ),
        onSubmitted: (submit) {},
      ),
    );
  }
}

class OTPWidget extends StatelessWidget {
  const OTPWidget({Key? key, required this.controller}) : super(key: key);
  final TextEditingController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 65,
      padding: EdgeInsets.all(appDmPrimary),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: AppConstrant.appColorPrimaryColor.withOpacity(0.25),
      ),
      child: TextField(
        controller: controller,
        decoration: InputDecoration(
          border: InputBorder.none,
        ),
        textAlign: TextAlign.center,
        style: TextStyle(
          fontSize: 25,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }
}
