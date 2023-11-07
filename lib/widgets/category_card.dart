import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imgUrl;
  final String logoImgUrl;
  final double categoryImageWidth;
  final double categoryImageHeight;
  final double categoryContainerWidth;
  final double categoryContainerHeight;
  final double productPadding;
  final double radiusBorder;
  final double categoryLogoImageWidth;
  final double categoryLogoImageHeight;
  const CategoryCard({
    required this.imgUrl,
    required this.logoImgUrl,
    required this.categoryImageWidth,
    required this.categoryImageHeight,
    required this.categoryContainerWidth,
    required this.categoryContainerHeight,
    required this.categoryLogoImageWidth,
    required this.categoryLogoImageHeight,
    this.productPadding = kDefaultPadding,
    this.radiusBorder = kRadiusAppDefault,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: EdgeInsets.symmetric(
                horizontal: productPadding, vertical: productPadding),
            child: Stack(
              children: [
                Container(
                    height: categoryContainerHeight,
                    width: categoryContainerWidth,
                    padding: EdgeInsets.all(productPadding),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(radiusBorder),
                    )),
                Positioned(
                  top: 30,
                  left: 10,
                  child: Image.network(
                    imgUrl,
                    width: categoryImageWidth,
                    height: categoryImageHeight,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(radiusBorder),
                      ),
                      child: Container(
                        padding: EdgeInsets.only(
                            left: productPadding, right: productPadding),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(radiusBorder),
                        ),
                        width: categoryLogoImageWidth,
                        height: categoryLogoImageHeight,
                        child: Image.network(logoImgUrl),
                      ),
                    )),
              ],
            ))
      ],
    );
  }
}
