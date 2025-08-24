import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/wishlist/data/models/wishList_response.dart';
import 'package:ecommerce/featuers/wishlist/domain/entities/wishlist_product_entity.dart';

abstract class WishlistContractRepo {
  Future<Either<Failure, List<WishlistProductEntity>>> getUserWishList();
  Future<Either<Failure, Unit>> addToWishList(String productId);
}
