import 'package:bloc/bloc.dart';
import 'package:ecommerce_ishizuki/common/utils/utils.dart';
import 'package:ecommerce_ishizuki/models/models_export.dart';
import 'package:ecommerce_ishizuki/repository/serverAPI/products_repository.dart';
import 'package:equatable/equatable.dart';

part 'fetch_products_event.dart';
part 'fetch_products_state.dart';

class FetchProductsBloc extends Bloc<FetchProductsEvent, FetchProductsState> {
  final ProductRepository _productRepository;
  FetchProductsBloc(this._productRepository)
      : super(const FetchProductsInitial()) {
    on<LoadingProductEvent>(_loadProducts);
  }

  _loadProducts(
      LoadingProductEvent event, Emitter<FetchProductsState> emit) async {
    emit(const FetchProductsInitial());

    try {
      final products = await _productRepository.getData();
      emit(FetchProductLoaded(products));
    } catch (error) {
      Utils.printDebugError(errorMessage: error.toString());
    }
  }
}
