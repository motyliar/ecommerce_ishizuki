part of 'fetch_products_bloc.dart';

sealed class FetchProductsEvent extends Equatable {
  const FetchProductsEvent();

  @override
  List<Object> get props => [];
}

class LoadingProductEvent extends FetchProductsEvent {}
