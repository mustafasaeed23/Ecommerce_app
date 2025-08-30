import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/wishlist/data/datasources/wishlist_remote_data_source.dart';
import 'package:ecommerce/featuers/wishlist/data/models/remove_from_wishList_response.dart';
import 'package:ecommerce/featuers/wishlist/data/models/wishList_response.dart';
import 'package:ecommerce/featuers/wishlist/domain/entities/wishlist_product_entity.dart';
import 'package:ecommerce/featuers/wishlist/domain/repositories/wishlist_contract_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: WishlistContractRepo)
class WishlistImplyRepo implements WishlistContractRepo {
  final WishlistRemoteDataSource wishlistRemoteDataSource;

  WishlistImplyRepo(this.wishlistRemoteDataSource);
  @override
  Future<Either<Failure, List<WishlistProductEntity>>> getUserWishList() async {
    try {
      final response = await wishlistRemoteDataSource.getUserWishList();
      return Right(response.data);
    } on RemoteException catch (err) {
      return Left(Failure(err.message));
    }
  }

  @override
  Future<Either<Failure, Unit>> addToWishList(String productId) async {
    try {
      await wishlistRemoteDataSource.addToWishList(productId);
      return const Right(unit);
    } on RemoteException catch (err) {
      return Left(Failure(err.message));
    }
  }

  @override
  Future<Either<Failure, RemoveFromWishListResponse>> removeFromWishList(
    String productId,
  ) async {
    try {
      final result = await wishlistRemoteDataSource.removeFromWishList(
        productId,
      );
      return Right(result);
    } on RemoteException catch (err) {
      return Left(Failure(err.message));
    }
  }
}
