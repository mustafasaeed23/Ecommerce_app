import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/products/data/datasources/products_remote_api_data_source.dart';
import 'package:ecommerce/featuers/products/domain/entities/product_entity.dart';
import 'package:ecommerce/featuers/products/domain/repositories/products_contract_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: ProductsContractRepo)
class ProductsImplyRepo implements ProductsContractRepo {
  final ProductsRemoteApiDataSource productsRemoteApiDataSource;
  ProductsImplyRepo(this.productsRemoteApiDataSource);
  @override
  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    try {
      final response = await productsRemoteApiDataSource.getProducts();
      return Right(response.data);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
