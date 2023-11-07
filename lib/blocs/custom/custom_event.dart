part of 'custom_bloc.dart';

sealed class CustomEvent extends Equatable {
  const CustomEvent();

  @override
  List<Object> get props => [];
}

class ChangeCustomStatusEvent extends CustomEvent {
  final TextFieldEnum enumStatus;
  const ChangeCustomStatusEvent({required this.enumStatus});

  @override
  List<Object> get props => [enumStatus];
}

class ChangeCustomValueEvent extends CustomEvent {
  final String value;
  const ChangeCustomValueEvent({required this.value});

  @override
  List<Object> get props => [value];
}

class GetKindOfRockEvent extends CustomEvent {
  final String value;
  const GetKindOfRockEvent({required this.value});
  @override
  List<Object> get props => [value];
}

class LoadPictrueEvent extends CustomEvent {}

class SendCustomEmailEvent extends CustomEvent {}

class PrintValues extends CustomEvent {}
