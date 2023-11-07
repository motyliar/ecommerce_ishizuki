import 'dart:ui';

import 'package:ecommerce_ishizuki/common/constans/routes_constans.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/widgets/widgets_exports.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';

class CategorySlider extends StatelessWidget {
  final List<Category> category;
  final double categoryImageWidth;
  final double categoryImageHeight;
  final double categoryContainerWidth;
  final double categoryContainerHeight;
  final double productPadding;
  final double radiusBorder;
  final double categoryLogoImageWidth;
  final double categoryLogoImageHeight;
  const CategorySlider({
    super.key,
    required this.category,
    required this.categoryImageWidth,
    required this.categoryImageHeight,
    required this.categoryContainerWidth,
    required this.categoryContainerHeight,
    required this.productPadding,
    required this.radiusBorder,
    required this.categoryLogoImageWidth,
    required this.categoryLogoImageHeight,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ScrollConfiguration(
        behavior: ScrollConfiguration.of(context).copyWith(
          dragDevices: {PointerDeviceKind.touch, PointerDeviceKind.mouse},
        ),
        child: ListView.builder(
            physics: const AlwaysScrollableScrollPhysics(),
            controller: ScrollController(
              initialScrollOffset: 180,
            ),
            itemCount: category.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, kCategoryScreen,
                        arguments: category[index]);
                  },
                  child: CategoryCard(
                    imgUrl: category[index].imgUrl,
                    logoImgUrl: category[index].logoImgUrl,
                    categoryImageWidth: categoryImageWidth,
                    categoryImageHeight: categoryImageHeight,
                    categoryContainerWidth: categoryContainerHeight,
                    categoryContainerHeight: categoryContainerHeight,
                    categoryLogoImageHeight: categoryLogoImageHeight,
                    categoryLogoImageWidth: categoryLogoImageWidth,
                  ),
                )),
      ),
    );
  }
}
