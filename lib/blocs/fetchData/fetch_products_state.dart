part of 'fetch_products_bloc.dart';

sealed class FetchProductsState extends Equatable {
  final List<Product> product;
  const FetchProductsState({this.product = const <Product>[]});

  @override
  List<Object> get props => [product];
}

final class FetchProductsInitial extends FetchProductsState {
  const FetchProductsInitial() : super(product: const <Product>[]);
}

class FetchProductLoaded extends FetchProductsState {
  const FetchProductLoaded(List<Product> product) : super(product: product);
  @override
  List<Object> get props => [product];
}
