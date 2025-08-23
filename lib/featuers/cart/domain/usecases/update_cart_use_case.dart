import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce/featuers/cart/domain/repositories/cart_contract_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateCartUseCase {
  final CartContractRepo cartContractRepo;

  UpdateCartUseCase(this.cartContractRepo);

  Future<Either<Failure, CartEntity>> call(String productId, int quantity) =>
      cartContractRepo.updateCart(productId, quantity);
}
