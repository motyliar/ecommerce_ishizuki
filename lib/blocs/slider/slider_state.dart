// ignore_for_file: must_be_immutable

part of 'slider_bloc.dart';

class SliderState extends Equatable {
  const SliderState();

  @override
  List<Object?> get props => [];
}

class SliderInitial extends SliderState {}

class SliderLoadedState extends SliderState {
  List<String> image;
  int index;
  bool isStart;
  bool isEnd;
  SliderLoadedState(
      {this.image = const <String>[],
      this.index = 0,
      this.isStart = true,
      this.isEnd = true});

  SliderLoadedState copyWith(
      {List<String>? image, int? index, bool? isStart, bool? isEnd}) {
    return SliderLoadedState(
        image: image ?? this.image,
        index: index ?? this.index,
        isStart: isStart ?? this.isStart,
        isEnd: isEnd ?? this.isEnd);
  }

  @override
  List<Object?> get props => [image, index, isStart, isEnd];
}
