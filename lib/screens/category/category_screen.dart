import 'package:ecommerce_ishizuki/config/app_helpers.dart';
import 'package:ecommerce_ishizuki/widgets/widgets_exports.dart';
import 'package:flutter/material.dart';

import '../../models/models_export.dart';
import '../../models/product/product_model.dart';

class CategoryScreen extends StatelessWidget {
  final Category category;

  const CategoryScreen({super.key, required this.category});
  static const routeName = '/categoryScreen';
  static Route route({required Category category}) {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => CategoryScreen(
              category: category,
            ));
  }

  @override
  Widget build(BuildContext context) {
    List<Product> products = productList
        .where((element) => element.category == category.name)
        .toList();
    return Scaffold(
        appBar: CustomAppBar(
          popArrow: false,
          imgName: category.logoImgUrl,
          isPop: true,
        ),
        bottomNavigationBar: const CustomBottomAppBar(),

        //BODY
        body: GridView.builder(
            itemCount: products.length,
            gridDelegate:
                SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
            itemBuilder: ((context, index) {
              return ProductListWidget(
                product: products[index],
                size: 100,
                iconSize: 20,
              );
            })));
  }
}
