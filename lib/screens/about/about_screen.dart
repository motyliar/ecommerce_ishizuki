import 'package:ecommerce_ishizuki/config/box_decoration.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:ecommerce_ishizuki/widgets/custom_app_bar.dart';
import 'package:ecommerce_ishizuki/widgets/custom_bottom_app_bar.dart';
import 'package:flutter/material.dart';
import 'widget.dart';

class AboutScreen extends StatelessWidget {
  const AboutScreen({super.key});

  static const routeName = '/about';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const AboutScreen());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        isPop: true,
      ),
      bottomNavigationBar: const CustomBottomAppBar(),
      body: Container(
        color: mainTextColor.withOpacity(0.07),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.only(right: 20.0, left: 20.0),
            child: Column(children: [
              const SizedBox(
                height: 10.0,
              ),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        ImageContainer(
                          image: 'about1.jpg',
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextContainer(
                            text:
                                ' \nIshizuki rocks was created from passion to bonsai.\nMy fascination of planting ishizuki and searching for the best rock in good condition awakened the desire to create something of my own.\n'),
                        SizedBox(
                          height: 10.0,
                        ),
                        ImageContainer(
                          image: 'about2.jpg',
                          customHeight: 50,
                        ),
                        SizedBox(
                          height: 10.0,
                        ),
                        TextContainer(
                            text:
                                'Now...\nI am creating rocks, pots and slabs for your bonsai tree. Now, I sent my products worldwide'),
                        SizedBox(
                          height: 10.0,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 10.0,
                  ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          decoration: shadeBox,
                          width: MediaQuery.of(context).size.width / 2 - 23,
                          child: const Padding(
                            padding: EdgeInsets.all(10.0),
                            child: Center(
                              child: Text(
                                ' At beggining\n was only\n idea...',
                                style: headText,
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const ImageContainer(
                          image: 'product1.jpg',
                          customHeight: 50,
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const TextContainer(
                          text:
                              '  Experimenting with lots of materials finally gives me the best product. Natural rusty colors, shapes and edges of rocks, and finally hard and frost-resistant.',
                        ),
                        const SizedBox(
                          height: 10.0,
                        ),
                        const ImageContainer(
                          image: 'about3.jpg',
                          customHeight: 50,
                        )
                      ],
                    ),
                  )
                ],
              ),
              const SizedBox(
                height: 30,
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
