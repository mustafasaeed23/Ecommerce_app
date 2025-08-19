import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/products/domain/entities/product_entity.dart';

abstract class ProductsContractRepo {
  Future<Either<Failure, List<ProductEntity>>> getProducts();
}
