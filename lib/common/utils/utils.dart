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
}
