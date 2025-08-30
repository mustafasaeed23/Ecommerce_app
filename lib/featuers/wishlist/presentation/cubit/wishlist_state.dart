import 'package:ecommerce/featuers/wishlist/domain/entities/wishlist_product_entity.dart';

abstract class WishlistState {}

class WishlistInitial extends WishlistState {}

class WishlistLoading extends WishlistState {}

class WishlistError extends WishlistState {
  final String message;
  WishlistError(this.message);
}

class WishlistLoaded extends WishlistState {
  final List<WishlistProductEntity> wishlistProducts;
  WishlistLoaded(this.wishlistProducts);
}

class AddToWishListLoading extends WishlistState {}

class AddToWishListError extends WishlistState {
  final String message;
  AddToWishListError(this.message);
}

class AddToWishListSuccess extends WishlistState {}

class RemoveFromWishListLoading extends WishlistState {}

class RemoveFromWishListError extends WishlistState {
  final String message;
  RemoveFromWishListError(this.message);
}

class RemoveFromWishListSuccess extends WishlistState {
  final String message;
  RemoveFromWishListSuccess(this.message);
}
