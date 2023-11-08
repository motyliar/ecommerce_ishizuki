import 'package:ecommerce_ishizuki/common/constans/constans.dart';
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

  static void printDebugError({required String errorMessage}) {
    debugPrint('Something wrong: $errorMessage');
  }

  double calculateRowWidthDimension(
      {required BuildContext context,
      double multiplyWidth = kMultiplyToHalf,
      double spaceToSubstraction = 0}) {
    return MediaQuery.of(context).size.width * multiplyWidth -
        spaceToSubstraction;
  }
}
