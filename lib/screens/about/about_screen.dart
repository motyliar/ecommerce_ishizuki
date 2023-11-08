import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:ecommerce_ishizuki/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widget.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

// space between widgets
const double kAboutSpaceBetweenWidgetsHeight = 10.0;

const double kAboutSpaceToAlignHeightOfRowHeight = 30.0;
// opacity to set background color in text and image boxes
const double kAboutOpacityOfMainColorScreenBackground = 0.07;

// space values to calculate dimensions of container for about screen rows
const double kAboutPaddingSpaceAndBorder = 23.0;
const double kAboutImageHeightAddition = 50.0;

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: kAboutScreen),
        builder: (_) => const AboutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        imgName: kAppBarMainLogo,
        isPop: true,
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: Container(
        color:
            mainTextColor.withOpacity(kAboutOpacityOfMainColorScreenBackground),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(
                right: kSidesDefaultPadding, left: kSidesDefaultPadding),
            child: Column(children: [
              const SizedBox(
                height: kAboutSpaceBetweenWidgetsHeight,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                          image: kAboutLeftTopImage,
                          imageNetworkWidth: Utils().calculateRowWidthDimension(
                              context: context,
                              spaceToSubstraction: kAboutPaddingSpaceAndBorder),
                          imageNetworkHeight: Utils()
                              .calculateRowWidthDimension(context: context),
                        ),
                        const SizedBox(
                          height: kAboutSpaceBetweenWidgetsHeight,
                        ),
                        TextContainer(
                          textToDisplay: AppLocalizations.of(context)!
                              .aboutDescriptionLeftTop,
                          textContainerWidthSize: Utils()
                              .calculateRowWidthDimension(
                                  context: context,
                                  spaceToSubstraction:
                                      kAboutPaddingSpaceAndBorder),
                        ),
                        const SizedBox(
                          height: kAboutSpaceBetweenWidgetsHeight,
                        ),
                        ImageContainer(
                          image: kAboutLeftBottomImage,
                          imageNetworkWidth: Utils().calculateRowWidthDimension(
                              context: context,
                              spaceToSubstraction: kAboutPaddingSpaceAndBorder),
                          imageNetworkHeight: Utils()
                              .calculateRowWidthDimension(
                                  context: context,
                                  spaceToAddition: kAboutImageHeightAddition),
                        ),
                        const SizedBox(
                          height: kAboutSpaceBetweenWidgetsHeight,
                        ),
                        TextContainer(
                            textToDisplay: AppLocalizations.of(context)!
                                .aboutDescriptionLeftBottom,
                            textContainerWidthSize: Utils()
                                .calculateRowWidthDimension(
                                    context: context,
                                    spaceToSubstraction:
                                        kAboutPaddingSpaceAndBorder)),
                        const SizedBox(
                          height: kAboutSpaceBetweenWidgetsHeight,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: kAboutSpaceBetweenWidgetsHeight,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: shadeBox,
                          width: Utils().calculateRowWidthDimension(
                              context: context,
                              spaceToSubstraction: kAboutPaddingSpaceAndBorder),
                          child: Padding(
                            padding: const EdgeInsets.all(kAboutTextPadding),
                            child: Center(
                              child: Text(
                                AppLocalizations.of(context)!
                                    .aboutDescriptionLabel,
                                style: headText,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: kAboutSpaceBetweenWidgetsHeight,
                        ),
                        ImageContainer(
                          image: kAboutRightTopImage,
                          imageNetworkWidth: Utils().calculateRowWidthDimension(
                              context: context,
                              spaceToSubstraction: kAboutPaddingSpaceAndBorder),
                          imageNetworkHeight: Utils()
                              .calculateRowWidthDimension(
                                  context: context,
                                  spaceToAddition: kAboutImageHeightAddition),
                        ),
                        const SizedBox(
                          height: kAboutSpaceBetweenWidgetsHeight,
                        ),
                        TextContainer(
                            textToDisplay: AppLocalizations.of(context)!
                                .aboutDescriptionRightBottom,
                            textContainerWidthSize: Utils()
                                .calculateRowWidthDimension(
                                    context: context,
                                    spaceToSubstraction:
                                        kAboutPaddingSpaceAndBorder)),
                        const SizedBox(
                          height: kAboutSpaceBetweenWidgetsHeight,
                        ),
                        ImageContainer(
                          image: kAboutRightBottomImage,
                          imageNetworkWidth: Utils().calculateRowWidthDimension(
                              context: context,
                              spaceToSubstraction: kAboutPaddingSpaceAndBorder),
                          imageNetworkHeight: Utils()
                              .calculateRowWidthDimension(
                                  context: context,
                                  spaceToAddition: kAboutImageHeightAddition),
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: kAboutSpaceToAlignHeightOfRowHeight,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
