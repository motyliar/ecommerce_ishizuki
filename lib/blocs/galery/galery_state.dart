// ignore_for_file: must_be_immutable

part of 'galery_bloc.dart';

sealed class GaleryState extends Equatable {
  const GaleryState();

  @override
  List<Object?> get props => [];
}

final class GaleryInitial extends GaleryState {}

class GaleryLoaded extends GaleryState {
  List<String> image;
  int index;
  int maxIndex;
  bool isStart;
  bool isEnd;
  GaleryLoaded(
      {this.image = const <String>[],
      this.index = 0,
      this.maxIndex = 0,
      this.isEnd = true,
      this.isStart = true});

  GaleryLoaded copyWith(
      {List<String>? image,
      int? index,
      int? maxIndex,
      bool? isStart,
      bool? isEnd}) {
    return GaleryLoaded(
        image: image ?? this.image,
        index: index ?? this.index,
        maxIndex: maxIndex ?? this.maxIndex,
        isStart: isStart ?? this.isStart,
        isEnd: isEnd ?? this.isEnd);
  }

  @override
  List<Object?> get props => [image, index, maxIndex, isEnd, isStart];
}
