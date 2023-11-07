import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/screens/screens_export.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/widgets/widgets_exports.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: kHomeScreen),
        builder: (_) => const HomeScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      // APP BAR
      appBar: const CustomAppBar(
        popArrow: false,
        imgName: kAppBarMainLogo,
      ),

      // BOTTOM NAVIGATION BAR
      bottomNavigationBar: const CustomBottomAppBar(),

      // BODY
      //
      body: SingleChildScrollView(
          child: BlocBuilder<FetchProductsBloc, FetchProductsState>(
        builder: (context, state) {
          if (state is FetchProductsInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is FetchProductLoaded) {
            List<Product> listOfNewProducts = state.product
                .where((element) => element.isSold == false)
                .toList();
            return Container(
              decoration: const BoxDecoration(color: Colors.white),
              child: Column(
                children: [
                  Container(
                      height: kHomeScreenCategorySliderHeight,
                      decoration: BoxDecoration(
                          borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(kRadiusAppDefault),
                              bottomRight: Radius.circular(kRadiusAppDefault)),
                          color: mainTextColor.withOpacity(0.1)),
                      width: MediaQuery.of(context).size.width -
                          kSidesDefaultPadding,
                      child: const CategorySlider(
                        category: kCategoryListForHomeScreen,
                        categoryImageWidth: kCategoryImageSquareSize,
                        categoryImageHeight: kCategoryImageSquareSize,
                        categoryContainerWidth: kCategorySpaceContainerWidth,
                        categoryContainerHeight: kCategorySpaceContainerHeight,
                        categoryLogoImageWidth: kCategoryLogoImageWidth,
                        categoryLogoImageHeight: kCategoryLogoImageHeight,
                        productPadding: kDefaultPadding,
                        radiusBorder: kRadiusAppDefault,
                      )),
                  const SizedBox(
                    height: kHomeScreenDefaultSizedBoxHeight,
                  ),
                  const Divider(
                    thickness: kDividerThickness,
                    color: backgroundColor,
                    indent: kDividerDefaultIndent,
                    endIndent: kDividerDefaultIndent,
                  ),
                  const SizedBox(
                    height: kHomeScreenDefaultSizedBoxHeight,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      MiddleSquare(
                        text:
                            AppLocalizations.of(context)!.aboutUs.toUpperCase(),
                        route: kAboutScreen,
                      ),
                      MiddleSquare(
                          route: kCustomScreen,
                          text: AppLocalizations.of(context)!
                              .custom
                              .toUpperCase()),
                      MiddleSquare(
                          route: kDeliveryScreen,
                          text: AppLocalizations.of(context)!
                              .delivery
                              .toUpperCase()),
                    ],
                  ),
                  const SizedBox(
                    height: kHomeScreenDefaultSizedBoxHeight,
                  ),
                  Container(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    margin: const EdgeInsets.only(
                        left: kAvarageMediumPaddingOrMargin,
                        right: kAvarageMediumPaddingOrMargin),
                    color: backgroundColor,
                    child: Center(
                      child: Text(
                        AppLocalizations.of(context)!.check.toUpperCase(),
                        style: headText.copyWith(color: Colors.white),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: kHomeScreenDefaultSizedBoxHeight,
                  ),
                  const Divider(
                    thickness: kDividerThickness,
                    color: backgroundColor,
                    indent: kDividerDefaultIndent,
                    endIndent: kDividerDefaultIndent,
                  ),
                  Container(
                    decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(kRadiusAppDefault),
                            topRight: Radius.circular(kRadiusAppDefault))),
                    padding: const EdgeInsets.only(
                        left: kAvarageMediumPaddingOrMargin,
                        right: kAvarageMediumPaddingOrMargin),
                    child: SizedBox(
                        height: kHomeScreenSingleListOfProductHeight *
                            listOfNewProducts.length.toDouble(),
                        child: ListView.builder(
                            itemCount: listOfNewProducts.length,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) => ProductListHome(
                                  product: listOfNewProducts[index],
                                ))),
                  ),
                  Container(
                      padding: const EdgeInsets.only(left: kDefaultPadding),
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          Text(
                            AppLocalizations.of(context)!
                                .buttonQuestion
                                .toUpperCase(),
                            style: labelTextMidBlack,
                          ),
                          IconButton(
                              onPressed: () {
                                Navigator.pushNamed(context, kContactScreen);
                              },
                              icon: const Icon(Icons.email)),
                        ],
                      )),
                ],
              ),
            );
          } else {
            return const ErrorScreen();
          }
        },
      )),
    );
  }
}
