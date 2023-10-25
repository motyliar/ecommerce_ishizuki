// ignore_for_file: must_be_immutable

part of 'slider_bloc.dart';

sealed class SliderEvent extends Equatable {
  const SliderEvent();

  @override
  List<Object?> get props => [];
}

class SliderIncrementEvent extends SliderEvent {
  final int index;
  SliderIncrementEvent({this.index = 0});
  @override
  List<Object?> get props => [index];
}

class SliderDecrementEvent extends SliderEvent {
  final int index;
  SliderDecrementEvent({this.index = 0});
  @override
  List<Object?> get props => [index];
}

class SliderInitialEvent extends SliderEvent {}

class SliderLoadingEvent extends SliderEvent {
  final List<String> images;
  int index;
  SliderLoadingEvent({this.images = const <String>[], this.index = 0});
  @override
  List<Object?> get props => [images];
}
