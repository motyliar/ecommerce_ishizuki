import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/common/theme_data/box_decoration.dart';
import 'package:ecommerce_ishizuki/common/theme_data/colors.dart';
import 'package:ecommerce_ishizuki/common/theme_data/text_style.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

const double topHeightFromAppBar = 50.0;

class ServerDisconnected extends StatelessWidget {
  final void Function()? onTap;
  const ServerDisconnected({super.key, required this.onTap});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
              margin: const EdgeInsets.only(
                  left: kDefaultSpaceBetweenWidgets,
                  right: kDefaultSpaceBetweenWidgets,
                  top: topHeightFromAppBar),
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
                    AppLocalizations.of(context)!.server_error.toUpperCase(),
                    style: headButtonText,
                  ),
                  const SizedBox(
                    height: kDefaultPadding,
                  ),
                  Text(AppLocalizations.of(context)!.serverDisconnectedMessage,
                      style: labelTextMidBlack),
                  const SizedBox(
                    height: kDefaultSpaceBetweenWidgets,
                  ),
                  InkWell(
                    onTap: () {
                      onTap!();
                    },
                    child: Container(
                      padding: const EdgeInsets.all(kDefaultPadding),
                      color: Colors.black,
                      child: Text(
                        AppLocalizations.of(context)!
                            .serverRequestRefresh
                            .toUpperCase(),
                        style: labelTwentyTwoText,
                      ),
                    ),
                  )
                ],
              ))
        ],
      ),
    );
  }
}
