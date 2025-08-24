import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/wishlist/domain/repositories/wishlist_contract_repo.dart';
import 'package:injectable/injectable.dart';


@lazySingleton
class AddToWishlistUseCase {
  final WishlistContractRepo wishlistContractRepo;

  AddToWishlistUseCase(this.wishlistContractRepo);
  Future<Either<Failure, Unit>> call(String productId) =>
      wishlistContractRepo.addToWishList(productId);
}
