part of 'galery_bloc.dart';

sealed class GaleryEvent extends Equatable {
  const GaleryEvent();

  @override
  List<Object?> get props => [];
}

class GaleryLoadingEvent extends GaleryEvent {
  final List<String> image;
  final int index;
  const GaleryLoadingEvent({required this.image, required this.index});
  @override
  List<Object?> get props => [image, index];
}

class GaleryUpdate extends GaleryEvent {
  final List<String> image;
  final int maxIndex;
  const GaleryUpdate({this.image = const <String>[], this.maxIndex = 0});
  @override
  List<Object?> get props => [image, maxIndex];
}

class IncrementGaleryIndex extends GaleryEvent {}

class DecrementGaleryIndex extends GaleryEvent {}
