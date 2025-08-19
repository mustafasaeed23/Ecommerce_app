import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/home/data/datasources/home_remote_api_data_source.dart';
import 'package:ecommerce/featuers/home/data/datasources/home_remote_data_source.dart';
import 'package:ecommerce/featuers/home/domain/entities/brand_entity.dart';
import 'package:ecommerce/featuers/home/domain/entities/category_entity.dart';
import 'package:ecommerce/featuers/home/domain/repositories/home_contract_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeContractRepo)
class HomeImplyRepo implements HomeContractRepo {
  final HomeRemoteDataSource homeRemoteDataSource;

  HomeImplyRepo(this.homeRemoteDataSource);
  @override
  Future<Either<Failure, List<CategoryEntity>>> getCategories() async {
    try {
      final response = await homeRemoteDataSource.getCategories();
      return Right(response.data);
    } on RemoteException catch (e) {
      print("repo error");
      return Left(Failure(e.message));
    }
  }

  @override
  Future<Either<Failure, List<BrandEntity>>> getBrands() async {
    try {
      final response = await homeRemoteDataSource.getBrands();
      return Right(response.data);
    } on RemoteException catch (e) {
      return Left(Failure(e.message));
    }
  }
}
