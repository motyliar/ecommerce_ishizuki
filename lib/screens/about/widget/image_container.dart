import 'package:ecommerce_ishizuki/common/constans/constans.dart';
import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String image;
  final double borderRadiusCircular;
  final double imageNetworkWidth;
  final double imageNetworkHeight;

  const ImageContainer({
    required this.image,
    this.borderRadiusCircular = kRadiusAppDefault,
    required this.imageNetworkWidth,
    required this.imageNetworkHeight,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [boxShadowCustom],
          borderRadius: BorderRadius.circular(borderRadiusCircular)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(borderRadiusCircular),
        child: Image.network(
          image,
          // to change
          width: imageNetworkWidth,
          height: imageNetworkHeight,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
