import 'package:bloc/bloc.dart';
import 'package:ecommerce/featuers/wishlist/domain/entities/wishlist_product_entity.dart';
import 'package:ecommerce/featuers/wishlist/domain/usecases/add_to_wishlist_use_case.dart';
import 'package:ecommerce/featuers/wishlist/domain/usecases/get_user_wishlist_use_case.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class WishlistCubit extends Cubit<WishlistState> {
  WishlistCubit(this._getUserWishlistUseCase, this._addToWishlistUseCase)
    : super(WishlistInitial());

  final GetUserWishlistUseCase _getUserWishlistUseCase;
  final AddToWishlistUseCase _addToWishlistUseCase;

  List<WishlistProductEntity> wishlistProducts = [];

  Future<void> getUserWishlist() async {
    emit(WishlistLoading());
    final result = await _getUserWishlistUseCase.getUserWishlist();
    result.fold((failure) => emit(WishlistError(failure.message)), (wishlist) {
      wishlistProducts = wishlist;
      emit(WishlistLoaded(List.from(wishlistProducts)));
    });
  }

  Future<void> addToWishlist(String productId) async {
    emit(AddToWishListLoading());
    final result = await _addToWishlistUseCase(productId);

    result.fold((failure) => emit(AddToWishListError(failure.message)), (
      _,
    ) async {
      // refresh wishlist
      await getUserWishlist();
    });
  }
}
