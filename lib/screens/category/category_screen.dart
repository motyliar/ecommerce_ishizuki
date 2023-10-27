import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';

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
                      size: 135,
                      iconSize: 35,
                      isSold: products[index].isSold,
                    );
                  }));
            } else {
              return const Text('data');
            }
          },
        ));
  }
}
