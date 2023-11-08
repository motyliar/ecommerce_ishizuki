import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';
import 'package:ecommerce_ishizuki/config/config_exports.dart';
import 'package:flutter/material.dart';
import '../screens_export.dart';

/* TODO
 Need to network checker file to network
 Most important is create some of visual display for better looking of Internet Diconeccted
 Better experience
 */
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
          return Scaffold(
              body: SafeArea(
                  child: Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height,
                      color: backgroundColor,
                      child: const Text('Network Initial'))));
        }
        if (state is NetworkConnected) {
          return const HomeScreen();
        }
        if (state is NetworkDisconnected) {
          return const Scaffold(
              body: SafeArea(child: Text('NetworkDisconnected')));
        } else {
          return const Scaffold(body: SafeArea(child: Text('Something Wrong')));
        }
      },
    );
  }
}
