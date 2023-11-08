import 'package:ecommerce_ishizuki/common/constans/routes_constans.dart';
import 'package:ecommerce_ishizuki/common/l10n/l10n.dart';
import 'package:ecommerce_ishizuki/repository/emailAPI/email_repository.dart';
import 'package:ecommerce_ishizuki/repository/exports.dart';

import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:ecommerce_ishizuki/routes/app_routes.dart';
import 'package:ecommerce_ishizuki/screens/splash/splash_screen.dart';
import 'blocs/bloc_exports.dart';

import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return RepositoryProvider(
      create: (context) => ProductRepository(),
      child: MultiBlocProvider(
          providers: [
            BlocProvider(
                create: (context) =>
                    NetworkBloc()..add(NetworkObserverEvent())),
            BlocProvider(
                create: (context) => FetchProductsBloc(
                    RepositoryProvider.of<ProductRepository>(context))
                  ..add(LoadingProductEvent())),
            BlocProvider(create: ((_) => GaleryBloc()..add(GaleryUpdate()))),
            BlocProvider(
                create: ((_) => SliderBloc()..add(SliderLoadingEvent()))),
            BlocProvider(
                create: (context) => CartBloc()..add(StartCartEvent())),
            BlocProvider(
              create: (context) => CurrencyBloc(),
            ),
            BlocProvider(
                create: (_) => ConfirmBloc(
                    OrderRepository(), ProductRepository(), EmailRepository())
                  ..add(StartEvent())),
            BlocProvider(create: (_) => ContactCubit(EmailRepository())),
            BlocProvider(create: (_) => DeliveryCubit()),
            BlocProvider(
              create: (context) => CustomBloc(CustomRepository()),
            )
          ],
          child: MaterialApp(
              onGenerateRoute: AppRoutes.onGenerateRoute,
              initialRoute: kSplashScreen,
              debugShowCheckedModeBanner: false,
              supportedLocales: L10n.all,
              locale: const Locale('en'),
              localizationsDelegates: const [
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
                AppLocalizations.delegate
              ])),
    );
  }
}
