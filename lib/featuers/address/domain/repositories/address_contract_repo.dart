import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/address/domain/entities/address_entity.dart';

abstract class AddressContractRepo {
  Future<Either<Failure, List<AddressEntity>>> getUserAddress();
}
