import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:flutter/material.dart';
import 'dart:math';

const int kSnackbarDuration = 2;
const kSymbolsToCreateUniqeOrderNumber = 'ABCDEFGHIJKLMNOPRSTUWXYZ123456789';
const int kNumberOfSymbolToCreate = 6;

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
      double spaceToSubstraction = 0,
      double spaceToAddition = 0}) {
    return MediaQuery.of(context).size.width * multiplyWidth -
        spaceToSubstraction +
        spaceToAddition;
  }

  String creatingSymbol() {
    final DateTime data = DateTime.now();
    final dataFormat = data.month.toString();
    String characters = kSymbolsToCreateUniqeOrderNumber;
    List randomSymbol = [];
    Random random = Random();
    for (int i = 0; i < kNumberOfSymbolToCreate; i++) {
      randomSymbol.add(characters[random.nextInt(characters.length)]);
    }
    return '2023 -${randomSymbol.join()}-$dataFormat';
  }
}
