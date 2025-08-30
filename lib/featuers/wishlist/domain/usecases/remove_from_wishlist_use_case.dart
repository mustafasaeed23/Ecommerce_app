import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/wishlist/data/models/remove_from_wishList_response.dart';
import 'package:ecommerce/featuers/wishlist/domain/repositories/wishlist_contract_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class RemoveFromWishlistUseCase {
  final WishlistContractRepo repository;
  RemoveFromWishlistUseCase(this.repository);

  Future<Either<Failure, RemoveFromWishListResponse>> call(
    String productId,
  ) async {
    return await repository.removeFromWishList(productId);
  }
}
