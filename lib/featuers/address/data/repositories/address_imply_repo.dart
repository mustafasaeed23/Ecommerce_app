import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/address/data/datasources/address_remote_data_source.dart';
import 'package:ecommerce/featuers/address/domain/entities/address_entity.dart';
import 'package:ecommerce/featuers/address/domain/repositories/address_contract_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AddressContractRepo)
class AddressImplyRepo implements AddressContractRepo {
  final AddressRemoteDataSource addressRemoteDataSource;
  AddressImplyRepo(this.addressRemoteDataSource);
  @override
  Future<Either<Failure, List<AddressEntity>>> getUserAddress() async {
    try {
      final response = await addressRemoteDataSource.getUserAddress();
      return Right(response.data!);
    } on RemoteException catch (e) {
      return Left(Failure("Failed to get user address: ${e.message}"));
    }
  }
}
