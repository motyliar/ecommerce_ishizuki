import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/common/theme_data/box_decoration.dart';
import 'package:ecommerce_ishizuki/common/theme_data/colors.dart';
import 'package:ecommerce_ishizuki/common/theme_data/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

const double topHeightFromAppBar = 50.0;

class NetworkDisconnectedWidget extends StatelessWidget {
  const NetworkDisconnectedWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Container(
                    margin: const EdgeInsets.only(
                      left: kDefaultSpaceBetweenWidgets,
                      right: kDefaultSpaceBetweenWidgets,
                    ),
                    width: MediaQuery.of(context).size.width,
                    padding:
                        const EdgeInsets.all(kAvarageMediumPaddingOrMargin),
                    decoration: BoxDecoration(
                        boxShadow: [deliveryBoxShadow],
                        color: mainTextColor.withOpacity(kMediumOpacity),
                        borderRadius: BorderRadius.circular(kRadiusAppDefault)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          AppLocalizations.of(context)!
                              .networkErrorLabel
                              .toUpperCase(),
                          style: headButtonText,
                        ),
                        const SizedBox(
                          height: kDefaultPadding,
                        ),
                        Text(AppLocalizations.of(context)!.networkErrorMessage,
                            style: headTextEightTeen),
                        const SizedBox(
                          height: kDefaultSpaceBetweenWidgets,
                        ),
                        Text(
                          AppLocalizations.of(context)!.networkErrorDescription,
                          style: labelTextMidBlack,
                        ),
                      ],
                    ))
              ],
            ),
          ),
        ),
      ),
    );
  }
}
