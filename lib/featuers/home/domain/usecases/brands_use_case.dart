import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/home/domain/entities/brand_entity.dart';
import 'package:ecommerce/featuers/home/domain/repositories/home_contract_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton 
class BrandsUseCase {
  final HomeContractRepo homeContractRepo;

  BrandsUseCase(this.homeContractRepo);

  Future<Either<Failure, List<BrandEntity>>> getBrands() async {
    return await homeContractRepo.getBrands();
  }
}
