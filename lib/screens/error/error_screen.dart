import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/common/theme_data/box_decoration.dart';
import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

class ErrorScreen extends StatelessWidget {
  const ErrorScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(
                  left: kDefaultSpaceBetweenWidgets,
                  right: kDefaultSpaceBetweenWidgets,
                  top: 50),
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(kAvarageMediumPaddingOrMargin),
              decoration: BoxDecoration(
                  boxShadow: [deliveryBoxShadow],
                  color: mainTextColor.withOpacity(kMediumOpacity),
                  borderRadius: BorderRadius.circular(kRadiusAppDefault)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    AppLocalizations.of(context)!.blocError.toUpperCase(),
                    style: headButtonText,
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Text(AppLocalizations.of(context)!.blocErrorMessage,
                      style: labelTextMidBlack),
                  const SizedBox(
                    height: kDefaultSpaceBetweenWidgets,
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pushNamed(context, kSplashScreen);
                    },
                    child: Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      color: Colors.black,
                      child: Text(
                        AppLocalizations.of(context)!
                            .blocErrorButton
                            .toUpperCase(),
                        style: labelTwentyTwoText,
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    ));
  }
}
