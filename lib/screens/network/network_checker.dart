import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';

import 'package:ecommerce_ishizuki/screens/network/network_disconnected_widget.dart';
import 'package:ecommerce_ishizuki/screens/network/network_init_widget.dart';
import 'package:flutter/material.dart';
import '../screens_export.dart';

class NetworkChecker extends StatelessWidget {
  const NetworkChecker({super.key});
  static const routeName = '/network';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const NetworkChecker());
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<NetworkBloc, NetworkState>(
      builder: (context, state) {
        if (state is NetworkInitial) {
          return const NetworkInitWidget();
        }
        if (state is NetworkConnected) {
          return const HomeScreen();
        }
        if (state is NetworkDisconnected) {
          return const NetworkDisconnectedWidget();
        } else {
          return const ErrorScreen();
        }
      },
    );
  }
}
