import 'package:flutter/material.dart';

class CategoryCard extends StatelessWidget {
  final String imgUrl;
  final String logoImgUrl;
  const CategoryCard({
    required this.imgUrl,
    required this.logoImgUrl,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 5.0),
            child: Stack(
              children: [
                Container(
                    height: 230,
                    width: 190,
                    padding: const EdgeInsets.all(5),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                    )),
                Positioned(
                  top: 30,
                  left: 10,
                  child: Image.asset(
                    imgUrl,
                    width: 170,
                    height: 170,
                  ),
                ),
                Positioned(
                    bottom: 0,
                    left: 10,
                    child: Container(
                      padding: const EdgeInsets.only(left: 10, right: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        padding: const EdgeInsets.only(left: 3, right: 3),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Image.asset(logoImgUrl),
                        width: 90,
                        height: 65,
                      ),
                    )),
              ],
            ))
      ],
    );
  }
}
