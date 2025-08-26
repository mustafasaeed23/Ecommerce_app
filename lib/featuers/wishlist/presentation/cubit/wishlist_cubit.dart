import 'package:bloc/bloc.dart';
import 'package:ecommerce/featuers/wishlist/domain/entities/wishlist_product_entity.dart';
import 'package:ecommerce/featuers/wishlist/domain/usecases/add_to_wishlist_use_case.dart';
import 'package:ecommerce/featuers/wishlist/domain/usecases/get_user_wishlist_use_case.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this.getUserWishlistUseCase, this.addToWishListUseCase)
    : super(WishlistInitial());

  final GetUserWishlistUseCase getUserWishlistUseCase;
  final AddToWishlistUseCase addToWishListUseCase;
  List<WishlistProductEntity> wishlistProductEntity = [];

  Future<void> getUserWishlist() async {
    emit(WishlistLoading());
    final result = await getUserWishlistUseCase.getUserWishlist();
    result.fold((l) => emit(WishlistError(l.message)), (wishlist) {
      wishlistProductEntity = wishlist;
      emit(WishlistLoaded()); // UI reads cubit.wishlistProductEntity
    });
  }

  Future<void> addToWishlist(String productId) async {
    emit(AddToWishListLoading());
    final result = await addToWishListUseCase(productId);
    result.fold((l) => emit(AddToWishListError(l.message)), (_) async {
      final refreshed = await getUserWishlistUseCase.getUserWishlist();
      refreshed.fold((l) => emit(AddToWishListError(l.message)), (wishlist) {
        wishlistProductEntity = wishlist;
        emit(WishlistLoaded());
        emit(AddToWishListSuccess());
      });
    });
  }
}
