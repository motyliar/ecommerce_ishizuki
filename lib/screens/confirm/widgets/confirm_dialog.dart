import 'package:ecommerce_ishizuki/common/constans/exports.dart';
import 'package:flutter/material.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/common/theme_data/config_exports.dart';
import 'details_text.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';

// alert confirm
const double kConfirmAlertMargin = 10.0;
const double kConfirmAlertBackgroundOpacity = 0.5;

class ConfirmDialog extends StatelessWidget {
  final GlobalKey<FormState> formKey;
  final double mainContainerMargin;
  final double mainContainerBackgroundOpacity;
  final double textMarginLeft;
  final double textSpaceBetweenHeight;

  const ConfirmDialog({
    required this.formKey,
    this.mainContainerMargin = kConfirmAlertMargin,
    this.mainContainerBackgroundOpacity = kConfirmAlertBackgroundOpacity,
    this.textMarginLeft = kSidesDefaultPadding,
    this.textSpaceBetweenHeight = kDefaultPadding,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ConfirmBloc, ConfirmState>(
      builder: (context, state) {
        return InkWell(
          onTap: () {
            if (formKey.currentState!.validate()) {
              context.read<ConfirmBloc>().add(OrderConfirmSymbol());
              showGeneralDialog(
                  context: context,
                  pageBuilder: (_, __, ___) {
                    return Center(
                      child: SingleChildScrollView(
                        child: Container(
                          color: Colors.transparent,
                          child: Container(
                            margin: EdgeInsets.all(mainContainerMargin),
                            color: backgroundColor
                                .withOpacity(mainContainerBackgroundOpacity),
                            child: Material(
                              color: backgroundColor
                                  .withOpacity(mainContainerBackgroundOpacity),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    margin:
                                        EdgeInsets.only(left: textMarginLeft),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        SizedBox(
                                          height: textSpaceBetweenHeight,
                                        ),
                                        Text(
                                          AppLocalizations.of(context)!
                                              .confirmDetails,
                                          style: labelText,
                                        ),
                                        DetailsText(
                                            title: AppLocalizations.of(context)!
                                                .textFormTitleName,
                                            text:
                                                '${state.address.name} ${state.address.surname}'),
                                        SizedBox(
                                            height: textSpaceBetweenHeight),
                                        DetailsText(
                                            title: AppLocalizations.of(context)!
                                                .textFormTitleEmail,
                                            text: state.address.email),
                                        SizedBox(
                                            height: textSpaceBetweenHeight),
                                        DetailsText(
                                            title: AppLocalizations.of(context)!
                                                .labelAddress,
                                            text: ' '),
                                        Container(
                                          margin: EdgeInsets.only(
                                              left: textMarginLeft),
                                          child: Text(
                                            '${state.address.street} ${state.address.numbers} \n${state.address.city} ${state.address.zipCode}\n${state.address.country}',
                                            style: labelMidText,
                                          ),
                                        ),
                                        const SizedBox(height: kDefaultPadding),
                                        DetailsText(
                                            title: AppLocalizations.of(context)!
                                                .labelWishes,
                                            text: '${state.address.wishes}'),
                                      ],
                                    ),
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                    children: [
                                      TextButton(
                                          onPressed: () {
                                            Navigator.pop(context);
                                          },
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .buttonBack,
                                            style: labelText,
                                          )),
                                      TextButton(
                                          onPressed: () {
                                            context
                                                .read<ConfirmBloc>()
                                                .add(SetSoldProduct());
                                            context
                                                .read<ConfirmBloc>()
                                                .add(SendConfirmEmail());
                                            context
                                                .read<ConfirmBloc>()
                                                .add(SendOrderToDB());
                                            Navigator.pushNamed(
                                                context, kOrderScreen);
                                          },
                                          child: Text(
                                            AppLocalizations.of(context)!
                                                .send
                                                .toUpperCase(),
                                            style: labelText,
                                          )),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    );
                  });
            }
          },
          child: Container(
            padding: const EdgeInsets.all(kDefaultPadding),
            color: backgroundColor,
            child: Text(
              AppLocalizations.of(context)!.buttonResume,
              style: labelButtonText,
            ),
          ),
        );
      },
    );
  }
}
