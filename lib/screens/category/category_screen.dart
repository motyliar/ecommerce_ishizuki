import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:ecommerce_ishizuki/screens/screens_export.dart';
import 'package:ecommerce_ishizuki/widgets/widgets_exports.dart';
import 'package:flutter/material.dart';

import '../../models/models_export.dart';
import '../../models/product/product_model.dart';

// size of display image of product in category screen
const double kCategoryProductImageSize = 135.0;
// size of add button icon in category screen
const double kCategoryIconSize = 35.0;

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({super.key, required this.category});

  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: kCategoryScreen),
        builder: (_) => CategoryScreen(
              category: category,
            ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppBar(
          popArrow: false,
          imgName: category.logoImgUrl,
          isPop: true,
        ),
        bottomNavigationBar: const CustomBottomAppBar(),

        //BODY
        body: BlocBuilder<FetchProductsBloc, FetchProductsState>(
          builder: (context, state) {
            if (state is FetchProductsInitial) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is FetchProductLoaded) {
              List<Product> products = state.product
                  .where((element) => element.category.contains(category.name))
                  .toList();

              return GridView.builder(
                  itemCount: products.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2),
                  itemBuilder: ((context, index) {
                    return ProductListWidget(
                      product: products[index],
                      sizeOfImage: kCategoryProductImageSize,
                      iconSize: kCategoryIconSize,
                      isSold: products[index].isSold,
                    );
                  }));
            } else {
              return const ErrorScreen();
            }
          },
        ));
  }
}
