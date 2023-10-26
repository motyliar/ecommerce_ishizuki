import 'package:ecommerce_ishizuki/repository/exports.dart';

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
                create: (_) =>
                    ConfirmBloc(OrderRepository(), ProductRepository())
                      ..add(StartEvent())),
            BlocProvider(create: (_) => ContactCubit()),
            BlocProvider(create: (_) => DeliveryCubit()),
            BlocProvider(
              create: (context) => CustomBloc(CustomRepository()),
            )
          ],
          child: const MaterialApp(
            onGenerateRoute: AppRoutes.onGenerateRoute,
            initialRoute: SplashScreen.routeName,
            debugShowCheckedModeBanner: false,
          )),
    );
  }
}
