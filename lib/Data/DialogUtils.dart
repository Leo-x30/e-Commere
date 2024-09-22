import 'package:e_commerce/Data/Text_Theme.dart';
import 'package:e_commerce/UI/Home_Screen.dart';
import 'package:flutter/material.dart';

class Dialogutils {
  static void ShowLoudingDialog(
      {required BuildContext context, bool barrierDismissible = false}) {
    showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            content: Row(
              children: [CircularProgressIndicator(), Text("Loading...")],
            ),
          );
        });
  }

  static void HideLoudingDialog(BuildContext context) {
    Navigator.pop(context);
  }

  static void ShowMessageDialog({
    required BuildContext context,
    String title = '',
    required String content,
    bool barrierDismissible = false,
    String? posActionName,
    Function? posAction,
    String? nigActionName,
    Function? nigAction,
  }) {
    List<Widget> actions = [];
    if (posActionName != null) {
      actions.add(ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
            Navigator.pushReplacementNamed(context, HomeScreen.routName);
          },
          child: Text(posActionName)));
    }
    if (nigActionName != null) {
      actions.add(ElevatedButton(
          onPressed: () {
            Navigator.pop(context);
          },
          child: Text(nigActionName)));
    }

    showDialog(
        barrierDismissible: barrierDismissible,
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text(
              title,
              style: TextThemes.bodyLargeBlack,
            ),
            content: Text(content, style: TextThemes.bodymidBlack),
            actions: actions,
          );
        });
  }
}
