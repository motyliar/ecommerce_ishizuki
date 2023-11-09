import 'package:ecommerce_ishizuki/common/constans/constans.dart';

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';
import 'package:ecommerce_ishizuki/routes/url_navigate.dart';

// value used for create litlle space between widgets
const double kSmallPaddingValue = 5.0;
// const using to set app bar height
const double kToolBarHeight = 120;
// center logo height in app bar
const double kScreenLogoHeight = 70.0;

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isPop;
  final bool popArrow;
  final String imgName;
  const CustomAppBar({
    this.popArrow = false,
    required this.imgName,
    this.isPop = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(0))),
        toolbarHeight: kToolBarHeight,
        automaticallyImplyLeading: popArrow,
        centerTitle: true,
        title: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: kDefaultPadding,
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Column(
                children: [
                  IconButton(
                    onPressed: () {
                      UrlNavigate().launchFacebook();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.facebook,
                      color: mainTextColor,
                    ),
                  ),
                  IconButton(
                    onPressed: () {
                      UrlNavigate().launchInstagram();
                    },
                    icon: const Icon(
                      FontAwesomeIcons.instagram,
                      color: mainTextColor,
                    ),
                  ),
                ],
              ),
              const SizedBox(
                width: kSmallPaddingValue,
              ),
              Expanded(
                child: Image.network(
                  imgName,
                  height: kScreenLogoHeight,
                ),
              ),
              const SizedBox(
                width: kSmallPaddingValue,
              ),
              Column(
                children: [
                  isPop
                      ? IconButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: const Icon(
                            Icons.arrow_back,
                            color: mainTextColor,
                          ),
                        )
                      : Container(),
                  // IconButton(
                  //   onPressed: () {
                  //     Navigator.pushNamed(context, kUserScreen);
                  //   },
                  //   icon: const Icon(
                  //     FontAwesomeIcons.user,
                  //     color: mainTextColor,
                  //     size: 20,
                  //   ),
                  // ),
                ],
              )
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolBarHeight);
}
