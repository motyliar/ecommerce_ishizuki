import 'dart:ui';

import 'package:ecommerce_ishizuki/common/constans/routes_constans.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/widgets/widgets_exports.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';

class CategorySlider extends StatelessWidget {
  const CategorySlider({
    super.key,
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
            itemCount: Category.category.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    Navigator.pushNamed(context, kCategoryScreen,
                        arguments: Category.category[index]);
                  },
                  child: CategoryCard(
                      imgUrl: Category.category[index].imgUrl,
                      logoImgUrl: Category.category[index].logoImgUrl),
                )),
      ),
    );
  }
}
