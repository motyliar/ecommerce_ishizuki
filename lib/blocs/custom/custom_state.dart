part of 'custom_bloc.dart';

enum CustomStatus {
  name,
  email,
  long,
  width,
  height,
  description,
  initial,
  error,
  photo
}

class CustomState extends Equatable {
  final Custom customData;
  final TextFieldStatus status;
  final File? file;

  const CustomState({
    required this.customData,
    this.status = TextFieldStatus.initial,
    this.file,
  });

  CustomState copyWith({
    Custom? customData,
    TextFieldStatus? status,
    File? file,
  }) {
    return CustomState(
      customData: customData ?? this.customData,
      status: status ?? this.status,
      file: file ?? this.file,
    );
  }

  @override
  List<Object?> get props => [
        customData,
        status,
        file,
      ];
}

final class CustomInitial extends CustomState {
  const CustomInitial()
      : super(
          customData: const Custom(productKind: 'Rock'),
          status: TextFieldStatus.initial,
        );
}

class CustomError extends CustomState {
  CustomError(Custom customData, TextFieldStatus status)
      : super(customData: customData, status: status);
  @override
  List<Object> get props => [customData, status];
}
