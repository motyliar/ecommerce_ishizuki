import 'package:flutter/material.dart';

const int kSnackbarDuration = 2;

class Utils {
  static void snackBarMessage(BuildContext context, String message,
      {int durationInSeconds = kSnackbarDuration}) {
    final snackBar = SnackBar(
      content: Text(message),
      duration: Duration(seconds: durationInSeconds),
    );
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  List<DropdownMenuItem<String>> generateDropDownMenuItemList(
      List<Map<String, String>> jsonMap) {
    return jsonMap
        .map((keys) => DropdownMenuItem<String>(
              value: keys['value'],
              child: Text(keys['text']!),
            ))
        .toList();
  }
}
