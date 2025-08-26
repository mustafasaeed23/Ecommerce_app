import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/address/domain/entities/address_entity.dart';
import 'package:ecommerce/featuers/address/domain/repositories/address_contract_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetUserAddressUseCase {
  final AddressContractRepo addressContractRepo;
  GetUserAddressUseCase(this.addressContractRepo);

  Future<Either<Failure, List<AddressEntity>>> call() async {
    return await addressContractRepo.getUserAddress();
  }
}
