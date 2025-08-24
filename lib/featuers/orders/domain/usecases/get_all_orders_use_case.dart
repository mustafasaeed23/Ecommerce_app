import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/orders/domain/entities/order_entity.dart';
import 'package:ecommerce/featuers/orders/domain/repositories/orders_contract_repo.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetAllOrdersUseCase {
  final OrdersContractRepo ordersContractRepo;
  GetAllOrdersUseCase(this.ordersContractRepo);

  Future<Either<Failure, List<OrderEntity>>> call() async {
    return await ordersContractRepo.getUserOrders();
  }
}