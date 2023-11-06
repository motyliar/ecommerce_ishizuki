import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/constans/routes_constans.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CustomBottomAppBar extends StatelessWidget {
  const CustomBottomAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: backgroundColor,
      height: 60,
      child: SizedBox(
        height: 60,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, kHomeScreen);
              },
              icon: const Icon(
                FontAwesomeIcons.house,
                color: mainTextColor,
              ),
            ),
            IconButton(
              onPressed: () {
                Navigator.pushNamed(context, kCartScreen);
              },
              icon: const Icon(
                FontAwesomeIcons.cartShopping,
                color: mainTextColor,
              ),
            ),
            BlocConsumer<CurrencyBloc, CurrencyState>(
              listener: (context, state) {
                if (state is ChangeCurrency) {
                  BlocProvider.of<CartBloc>(context).add(GetCurrencyEvent(
                      currencyCalculate: state.currentConversion));
                }
              },
              builder: (context, state) {
                return BlocBuilder<CurrencyBloc, CurrencyState>(
                  builder: (context, state) {
                    return Row(
                      children: [
                        IconButton(
                          onPressed: () {
                            context
                                .read<CurrencyBloc>()
                                .add(ChangeCurrencyEvent());
                          },
                          icon: const Icon(
                            Icons.currency_exchange,
                            color: mainTextColor,
                          ),
                        ),
                        Text(
                          state.currentCurrency,
                          style: labelText,
                        )
                      ],
                    );
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
