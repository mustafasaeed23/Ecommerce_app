import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/products/domain/entities/product_entity.dart';
import 'package:ecommerce/featuers/products/domain/repositories/products_contract_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class ProductsUseCase {
  final ProductsContractRepo productsContractRepo;

  ProductsUseCase(this.productsContractRepo);

  Future<Either<Failure, List<ProductEntity>>> getProducts() async {
    return await productsContractRepo.getProducts();
  }
}
