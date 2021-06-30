import 'package:flutter/material.dart';
import 'package:grocery/src/config/themes/light_theme.dart';
import 'package:grocery/src/constants/app_constrant.dart';

Container addAndRemove() {
  return Container(
    margin: const EdgeInsets.symmetric(
      vertical: appDmPrimary,
    ),
    decoration: BoxDecoration(
        border: Border.all(
          color: AppConstrant.appColorGra,
        ),
        borderRadius: BorderRadius.circular(appDmPrimary * 2)),
    child: Row(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          child: InkWell(
            onTap: () {},
            child: Icon(
              Icons.remove,
              color: AppConstrant.appColorLightBlack,
            ),
          ),
          margin: const EdgeInsets.symmetric(horizontal: 5),
          padding: const EdgeInsets.all(appDmPrimary - 10),
        ),
        Text(
          "2",
          style: titleStyle(),
        ),
        Container(
          margin: const EdgeInsets.symmetric(horizontal: 5),
          child: InkWell(
            onTap: () {},
            child: Icon(
              Icons.add,
              color: AppConstrant.appColorBlack,
            ),
          ),
          padding: const EdgeInsets.all(appDmPrimary - 10),
        ),
      ],
    ),
  );
}

BoxDecoration shadowContaianerdecore() {
  return BoxDecoration(
    color: Colors.white,
    boxShadow: [
      BoxShadow(
        color: Colors.grey.withOpacity(0.2),
        blurRadius: 2,
        spreadRadius: 4,
      )
    ],
    borderRadius: BorderRadius.only(
        topRight: const Radius.circular(
          appDmPrimary,
        ),
        topLeft: const Radius.circular(
          appDmPrimary,
        )),
  );
}

BoxDecoration containerBKDecore() {
  return BoxDecoration(
    color: Colors.grey.withOpacity(0.06),
    borderRadius: BorderRadius.circular(appDmPrimary),
  );
}
