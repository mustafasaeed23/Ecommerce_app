import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/cart/domain/entities/cart_entity.dart';

abstract class CartContractRepo {
  Future<Either<Failure, CartEntity>> getCart();

  Future<Either<Failure, void>> addToCart(String productId);

  Future<Either<Failure, CartEntity>> updateCart(
    String productId,
    int quantity,
  );

  Future<Either<Failure, CartEntity>> deleteFromCart(String productId);
}
