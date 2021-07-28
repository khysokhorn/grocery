import 'package:flutter/material.dart';

class AppDialog {
  final BuildContext context;

  AppDialog(this.context);

  void confirmDialog(Function() confirm) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Log out"),
          content: Text("Are u sure u want to log out ?"),
          actions: [
            TextButton(
              onPressed: confirm,
              child: Text("ok"),
            ),
          ],
        );
      },
    );
  }
}
