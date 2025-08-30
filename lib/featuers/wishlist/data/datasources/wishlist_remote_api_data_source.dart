import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_constants.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/featuers/wishlist/data/datasources/wishlist_remote_data_source.dart';
import 'package:ecommerce/featuers/wishlist/data/models/remove_from_wishList_response.dart';
import 'package:ecommerce/featuers/wishlist/data/models/wishList_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishlistRemoteDataSource)
class WishlistRemoteApiDataSource implements WishlistRemoteDataSource {
  final Dio dio;

  WishlistRemoteApiDataSource(this.dio);
  @override
  Future<WishListResponse> getUserWishList() async {
    try {
      final response = await dio.get(ApiConstants.wishlistEndPoint);
      return WishListResponse.fromJson(response.data);
    } catch (exception) {
      throw RemoteException("Failed To get WishList");
    }
  }

  @override
  Future<void> addToWishList(String productId) async {
    try {
      await dio.post(
        ApiConstants.wishlistEndPoint,
        data: {"productId": productId},
      );
    } catch (_) {
      throw RemoteException("Failed To Add To WishList");
    }
  }

  @override
  Future<RemoveFromWishListResponse> removeFromWishList(
    String productId,
  ) async {
    try {
      final response = await dio.delete(
        "${ApiConstants.wishlistEndPoint}/$productId",
      );
      return RemoveFromWishListResponse.fromJson(response.data);
    } catch (_) {
      throw RemoteException("Failed To delete from WishList");
    }
  }
}
