import 'package:flutter/material.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  static const routeName = '/userScreen';
  static Route route() {
    return MaterialPageRoute(
        settings: const RouteSettings(name: routeName),
        builder: (_) => const UserScreen());
  }

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}
