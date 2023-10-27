import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:flutter/material.dart';

class ImageContainer extends StatelessWidget {
  final String image;
  final double customHeight;
  const ImageContainer({
    required this.image,
    this.customHeight = 0,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          boxShadow: [boxShadowCustom],
          borderRadius: BorderRadius.circular(20.0)),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20.0),
        child: Image.network(
          'http://motyliar.webd.pro/.sharedphotos/$image',
          width: MediaQuery.of(context).size.width / 2 - 23,
          height: MediaQuery.of(context).size.width / 2 + customHeight,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}
