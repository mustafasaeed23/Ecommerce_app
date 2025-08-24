import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/wishlist/data/models/wishList_response.dart';
import 'package:ecommerce/featuers/wishlist/domain/entities/wishlist_product_entity.dart';
import 'package:ecommerce/featuers/wishlist/domain/repositories/wishlist_contract_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserWishlistUseCase {
  final WishlistContractRepo wishlistContractRepo;

  GetUserWishlistUseCase(this.wishlistContractRepo);

 Future<Either<Failure, List<WishlistProductEntity>>> getUserWishlist() =>
      wishlistContractRepo.getUserWishList();
}
