import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/home/domain/entities/brand_entity.dart';
import 'package:ecommerce/featuers/home/domain/entities/category_entity.dart';

abstract class HomeContractRepo {
  Future<Either<Failure, List<CategoryEntity>>> getCategories();
  Future<Either<Failure, List<BrandEntity>>> getBrands();
}
