import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/orders/domain/repositories/orders_contract_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class CreateOrderUseCase {
  final OrdersContractRepo ordersContractRepo;

  CreateOrderUseCase(this.ordersContractRepo);

  Future<Either<Failure, Unit>> call({
    required String cartId,
    required String details,
    required String phone,
    required String city,
  }) async {
    return await ordersContractRepo.createOrder(
      cartId: cartId,
      details: details,
      phone: phone,
      city: city,
    );
  }
}
