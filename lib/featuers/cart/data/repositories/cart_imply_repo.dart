import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/cart/data/datasources/cart_remote_data_source.dart';
import 'package:ecommerce/featuers/cart/domain/entities/cart_entity.dart';
import 'package:ecommerce/featuers/cart/domain/repositories/cart_contract_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CartContractRepo)
class CartImplyRepo implements CartContractRepo {
  final CartRemoteDataSource cartRemoteDataSource;

  CartImplyRepo(this.cartRemoteDataSource);

  @override
  Future<Either<Failure, CartEntity>> getCart() async {
    try {
      final response = await cartRemoteDataSource.getCart();
      print("response ${response.data}");
      return Right(response.data);
    } on RemoteException catch (err) {
      print("error ${err.message}");
      return Left(Failure(err.message));
    }
  }

  @override
  Future<Either<Failure, void>> addToCart(String productId) async {
    try {
      await cartRemoteDataSource.addToCart(productId);
      return const Right(null);
    } on RemoteException catch (err) {
      return Left(Failure(err.message));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> updateCart(
    String productId,
    int quantity,
  ) async {
    try {
      final response = await cartRemoteDataSource.updateCart(
        productId,
        quantity,
      );
      return Right(response.data);
    } on RemoteException catch (err) {
      return Left(Failure(err.message));
    }
  }

  @override
  Future<Either<Failure, CartEntity>> deleteFromCart(String productId) async {
    try {
      final response = await cartRemoteDataSource.deleteFromCart(productId);
      return Right(response.data);
    } on RemoteException catch (err) {
      return Left(Failure(err.message));
    }
  }
}
