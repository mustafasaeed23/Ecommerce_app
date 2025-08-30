import 'package:ecommerce/featuers/wishlist/data/models/remove_from_wishList_response.dart';
import 'package:ecommerce/featuers/wishlist/data/models/wishList_response.dart';

abstract class WishlistRemoteDataSource {
  Future<WishListResponse> getUserWishList();
  Future<void> addToWishList(String productId);
  Future<RemoveFromWishListResponse> removeFromWishList(String productId);
}
