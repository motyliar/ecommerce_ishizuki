part of 'network_bloc.dart';

sealed class NetworkEvent extends Equatable {
  const NetworkEvent();

  @override
  List<Object> get props => [];
}

class NetworkObserverEvent extends NetworkEvent {}

class NetworkNotifyEvent extends NetworkEvent {
  final bool isConnected;
  const NetworkNotifyEvent({this.isConnected = false});
  @override
  List<Object> get props => [isConnected];
}
