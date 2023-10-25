import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/routes/url_navigate.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool isPop;
  final bool popArrow;
  final String imgName;
  const CustomAppBar({
    this.popArrow = false,
    this.imgName = 'images/appbar_logo.png',
    this.isPop = false,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
        backgroundColor: backgroundColor,
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(0))),
        toolbarHeight: 120,
        automaticallyImplyLeading: popArrow,
        centerTitle: true,
        title: Container(
          width: MediaQuery.of(context).size.width,
          padding: const EdgeInsets.symmetric(
            horizontal: 5,
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
                width: 5,
              ),
              Expanded(
                child: Image.asset(
                  imgName,
                  height: 70,
                ),
              ),
              const SizedBox(
                width: 5,
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
                  IconButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/userScreen');
                    },
                    icon: const Icon(
                      FontAwesomeIcons.user,
                      color: mainTextColor,
                      size: 20,
                    ),
                  ),
                ],
              )
            ],
          ),
        ));
  }

  @override
  Size get preferredSize => const Size.fromHeight(110);
}
