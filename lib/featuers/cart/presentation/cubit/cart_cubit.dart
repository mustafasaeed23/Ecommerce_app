import 'package:bloc/bloc.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/utils/dialogs.dart';
import 'package:ecommerce/featuers/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce/featuers/cart/domain/usecases/add_to_cart_use_case.dart';
import 'package:ecommerce/featuers/cart/domain/usecases/delete_item_use_case.dart';
import 'package:ecommerce/featuers/cart/domain/usecases/get_cart_use_case.dart';
import 'package:ecommerce/featuers/cart/domain/usecases/update_cart_use_case.dart';
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_state.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@injectable
class CartCubit extends Cubit<CartState> {
  CartCubit(
    this.getCartUseCase,
    this.addToCartUseCase,
    this.updateCartUseCase,
    this.deleteItemUseCase,
  ) : super(CartInitial());

  final GetCartUseCase getCartUseCase;
  final AddToCartUseCase addToCartUseCase;
  final UpdateCartUseCase updateCartUseCase;
  final DeleteItemUseCase deleteItemUseCase;
  late CartEntity cartEntity;

  Future<void> getCart() async {
    emit(CartLoading());
    final result = await getCartUseCase();
    result.fold(
      (failure) {
        emit(CartError(failure.message));
        print("error ${failure.message}");
      },
      (getUserCart) {
        cartEntity = getUserCart;
        emit(CartLoaded());
      },
    );
  }

  Future<void> addToCart(String productId) async {
    emit(AddToCartLoading());
    final result = await addToCartUseCase.call(productId);
    result.fold((failure) => emit(AddToCartError(failure.message)), (_) {
      emit(AddToCartSuccess());
    });
  }

  Future<void> updateCart(String productId, int quantity) async {
    emit(UpdateCartLoading());
    final result = await updateCartUseCase.call(productId, quantity);
    result.fold((failure) => emit(UpdateCartError(failure.message)), (
      updatedCart,
    ) {
      cartEntity = updatedCart;
      emit(UpdateCartSuccess());
    });
  }

  Future<void> deleteItem(String productId) async {
    emit(DeleteItemLoading());
    final result = await deleteItemUseCase.call(productId);
    result.fold((failure) => emit(DeleteItemError(failure.message)), (
      deletedItem,
    ) {
      cartEntity = deletedItem;
      emit(DeleteItemSuccess());
    });
  }
}
