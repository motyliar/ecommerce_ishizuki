import 'package:ecommerce_ishizuki/common/theme_data/colors.dart';
import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

const double kCircuralIndicatorSize = 8.0;
const double kHeightSpaceFromAppBar = 60.0;

class InitialStateWidget extends StatelessWidget {
  const InitialStateWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Center(
        child: Column(
          children: [
            SizedBox(
              height: kHeightSpaceFromAppBar,
            ),
            Text(
              AppLocalizations.of(context)!.blocInitialMessage,
              style: headText,
            ),
            const CircularProgressIndicator(
              backgroundColor: backgroundColor,
              strokeWidth: kCircuralIndicatorSize,
            ),
          ],
        ),
      ),
    );
  }
}
