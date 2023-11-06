import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:ecommerce_ishizuki/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widget.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

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
        color: mainTextColor.withOpacity(0.07),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Column(children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const ImageContainer(
                          image: kAboutLeftTopImage,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextContainer(
                            text: AppLocalizations.of(context)!
                                .aboutDescriptionLeftTop),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const ImageContainer(
                          image: kAboutLeftBottomImage,
                          customHeight: 50,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextContainer(
                            text: AppLocalizations.of(context)!
                                .aboutDescriptionLeftBottom),
                        const SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: shadeBox,
                          width: MediaQuery.of(context).size.width / 2 - 23,
                          child: Padding(
                            padding: const EdgeInsets.all(10.0),
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
                          height: 10.0,
                        ),
                        const ImageContainer(
                          image: kAboutRightTopImage,
                          customHeight: 50,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        TextContainer(
                          text: AppLocalizations.of(context)!
                              .aboutDescriptionRightBottom,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const ImageContainer(
                          image: kAboutRightBottomImage,
                          customHeight: 50,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
