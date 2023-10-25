part of 'delivery_cubit.dart';

class DeliveryState extends Equatable {
  final String pricesValue;
  final int pricesIndex;
  final bool weight;
  const DeliveryState(
      {this.pricesValue = 'EU', this.pricesIndex = 0, this.weight = true});

  DeliveryState copyWith(
      {String? pricesValue, int? pricesIndex, bool? weight}) {
    return DeliveryState(
        pricesValue: pricesValue ?? this.pricesValue,
        pricesIndex: pricesIndex ?? this.pricesIndex,
        weight: weight ?? this.weight);
  }

  @override
  List<Object> get props => [pricesValue, pricesIndex, weight];
}

final class DeliveryInitial extends DeliveryState {
  const DeliveryInitial()
      : super(pricesValue: 'EU', pricesIndex: 0, weight: true);
}
