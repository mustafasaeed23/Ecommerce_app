import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/home/domain/entities/category_entity.dart';
import 'package:ecommerce/featuers/home/domain/repositories/home_contract_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CategoriesUseCase {
  final HomeContractRepo homeContractRepo;

  CategoriesUseCase(this.homeContractRepo);

  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    return await homeContractRepo.getCategories();
  }
}
