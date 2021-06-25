import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:grocery/src/constants/app_constrant.dart';

class LoginWidget {
  Container inputForm({
    required TextEditingController controller,
    required Icon icon,
    required String hint,
  }) {
    return Container(
      padding: const EdgeInsets.only(left: appDmPrimary),
      decoration: BoxDecoration(
        border: Border.all(
          color: AppConstrant.appColorPrimaryColor,
        ),
        borderRadius: BorderRadius.circular(appDmPrimary - 5),
      ),
      child: TextField(
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

  Container titleLogin(String title) {
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

  Container otpItem(TextEditingController controller) {
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
