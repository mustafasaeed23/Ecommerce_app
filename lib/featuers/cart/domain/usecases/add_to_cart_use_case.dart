import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/cart/domain/repositories/cart_contract_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddToCartUseCase {
  final CartContractRepo cartContractRepo;

  AddToCartUseCase(this.cartContractRepo);

  Future<Either<Failure, void>> call(String productId) =>
      cartContractRepo.addToCart(productId);
}
