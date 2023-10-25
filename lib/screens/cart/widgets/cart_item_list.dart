import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';

class CartItemList extends StatelessWidget {
  const CartItemList({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: BlocBuilder<CartBloc, CartState>(
        builder: (context, state) {
          if (state is CartInitial) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          if (state is CartLoaded) {
            return Container(
              child: ListView.builder(
                  itemCount: state.cart.products.length,
                  itemBuilder: (context, index) {
                    return Builder(builder: (context) {
                      final price =
                          '${context.select((CurrencyBloc bloc) => bloc.state.currentConversion * state.cart.products[index].price)} ${context.select((CurrencyBloc bloc) => bloc.state.currentSign)}';
                      return Padding(
                        padding: const EdgeInsets.only(top: 15, left: 20),
                        child: Container(
                          margin: const EdgeInsets.only(right: 20),
                          padding: const EdgeInsets.only(
                              right: 20, top: 3, left: 15, bottom: 5),
                          decoration: BoxDecoration(
                              color: mainTextColor.withOpacity(0.3),
                              borderRadius: const BorderRadius.only(
                                topLeft: Radius.circular(20),
                                bottomRight: Radius.elliptical(20, 40),
                              ),
                              gradient: LinearGradient(colors: [
                                mainTextColor.withOpacity(0.5),
                                backgroundColor,
                                mainTextColor.withOpacity(0.5)
                              ], begin: Alignment.topCenter),
                              boxShadow: [
                                BoxShadow(
                                    blurRadius: 3.0,
                                    spreadRadius: 2.0,
                                    color: Colors.grey.withOpacity(0.2),
                                    offset: const Offset(4, -4)),
                              ]),
                          child: Row(
                            children: [
                              Image.asset(
                                state.cart.products[index].imgUrl[0],
                                width: 120,
                                height: 120,
                              ),
                              Container(
                                width: 80,
                                height: 150,
                                child: Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    Text(
                                      state.cart.products[index].name,
                                      style: labelTextMidBlack,
                                    ),
                                    Text(price),
                                  ],
                                ),
                              ),
                              Center(
                                child: Container(
                                  margin: const EdgeInsets.only(left: 30),
                                  padding: const EdgeInsets.all(5),
                                  color: Colors.black.withOpacity(0.9),
                                  child: InkWell(
                                    onTap: () {
                                      context.read<CartBloc>().add(
                                          RemoveCartEvent(
                                              product:
                                                  state.cart.products[index]));
                                    },
                                    child: const Text(
                                      'REMOVE',
                                      style: labelText,
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ),
                      );
                    });
                  }),
            );
          }
          return const Center(
            child: Text('Something Wrong'),
          );
        },
      ),
    );
  }
}
