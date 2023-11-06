import 'package:bloc/bloc.dart';
import 'package:ecommerce_ishizuki/config/network/network_helper.dart';
import 'package:equatable/equatable.dart';

part 'network_event.dart';
part 'network_state.dart';

class NetworkBloc extends Bloc<NetworkEvent, NetworkState> {
  NetworkBloc._() : super(NetworkInitial()) {
    on<NetworkObserverEvent>(_observer);
    on<NetworkNotifyEvent>(_notify);
  }
  static final NetworkBloc _instance = NetworkBloc._();
  factory NetworkBloc() => _instance;

  _observer(NetworkObserverEvent event, emit) {
    NetworkHelper.networkObserver();
  }

  _notify(NetworkNotifyEvent event, emit) {
    event.isConnected ? emit(NetworkConnected()) : emit(NetworkDisconnected());
  }
}
