import 'package:bloc/bloc.dart';
import 'package:ecommerce/featuers/products/domain/usecases/products_use_case.dart';
import 'package:ecommerce/featuers/products/presentation/cubit/products_state.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  ProductsCubit(this.productsUseCase) : super(ProductsInitial());

  final ProductsUseCase productsUseCase;

  Future<void> getProducts() async {
    emit(ProductsLoading());
    final result = await productsUseCase.getProducts();
    result.fold(
      (failure) {
        emit(ProductsError(failure.message));
      },
      (products) {
        emit(ProductsSuccess(products));
      },
    );
  }
}
