import 'package:ecommerce_ishizuki/blocs/confirm/confirm_bloc.dart';
import 'package:ecommerce_ishizuki/routes/app_routes.dart';
import 'blocs/bloc_exports.dart';

import 'package:ecommerce_ishizuki/screens/screens_export.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: ((_) => GaleryBloc()..add(GaleryUpdate()))),
          BlocProvider(
              create: ((_) => SliderBloc()..add(SliderLoadingEvent()))),
          BlocProvider(create: (context) => CartBloc()..add(StartCartEvent())),
          BlocProvider(
            create: (context) => CurrencyBloc(),
          ),
          BlocProvider(create: (_) => ConfirmBloc()..add(StartEvent())),
          BlocProvider(create: (_) => ContactCubit()),
          BlocProvider(create: (_) => DeliveryCubit()),
          BlocProvider(
            create: (context) => CustomBloc(),
          )
        ],
        child: const MaterialApp(
          onGenerateRoute: AppRoutes.onGenerateRoute,
          initialRoute: HomeScreen.routeName,
          debugShowCheckedModeBanner: false,
        ));
  }
}
