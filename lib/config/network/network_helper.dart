import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:ecommerce_ishizuki/blocs/bloc_exports.dart';

class NetworkHelper {
  static void networkObserver() {
    Connectivity().onConnectivityChanged.listen((ConnectivityResult result) {
      if (result == ConnectivityResult.none) {
        NetworkBloc().add(NetworkNotifyEvent());
      } else {
        NetworkBloc().add(NetworkNotifyEvent(isConnected: true));
      }
    });
  }
}
