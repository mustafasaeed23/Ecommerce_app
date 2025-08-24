import 'package:ecommerce/featuers/wishlist/data/models/wishList_response.dart';

abstract class WishlistRemoteDataSource {
  Future<WishListResponse> getUserWishList();
  Future<void> addToWishList(String productId);
}
