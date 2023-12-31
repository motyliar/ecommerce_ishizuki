import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'widgets/widgets.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/widgets/widgets_exports.dart';
import 'package:flutter/material.dart';

class CartScreen extends StatelessWidget {
  const CartScreen({super.key});

  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: kCartScreen),
        builder: (_) => const CartScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        popArrow: false,
        imgName: kAppBarCartLogo,
        isPop: true,
      ),
      bottomNavigationBar: const CustomBottomAppBar(),

      //BODY

      body: Column(
        children: [
          // Widget to show every single cart product //
          const CartItemList(),
          // Show Dialog to user about DeliveryRules
          const DeliveryDialog(),

          // Bottom widget of showing costs //
          BottomTotalPriceWidget(
            snackBarMessage: () => Utils.snackBarMessage(
              context,
              AppLocalizations.of(context)!.snackbarConfirmRules,
            ),
            dropdownListGenerate:
                Utils().generateDropDownMenuItemList(kDeliveryWorldPlaceChoose),
          )
        ],
      ),
    );
  }
}
