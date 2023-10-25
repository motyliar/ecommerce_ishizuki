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
  final CustomStatus status;
  final File? file;
  final List<int> base64image;

  const CustomState(
      {required this.customData,
      this.status = CustomStatus.initial,
      this.file,
      this.base64image = const []});

  CustomState copyWith(
      {Custom? customData,
      CustomStatus? status,
      File? file,
      List<int>? base64image}) {
    return CustomState(
        customData: customData ?? this.customData,
        status: status ?? this.status,
        file: file ?? this.file,
        base64image: base64image ?? this.base64image);
  }

  @override
  List<Object?> get props => [customData, status, file, base64image];
}

final class CustomInitial extends CustomState {
  const CustomInitial()
      : super(
            customData: const Custom(productKind: 'Rock'),
            status: CustomStatus.initial,
            base64image: const []);
}

class CustomError extends CustomState {
  CustomError(Custom customData, CustomStatus status)
      : super(customData: customData, status: status);
  @override
  List<Object> get props => [customData, status];
}
