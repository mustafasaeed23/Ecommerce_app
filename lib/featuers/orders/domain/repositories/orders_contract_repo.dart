import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/orders/domain/entities/order_entity.dart';

abstract class OrdersContractRepo {
  Future<Either<Failure, List<OrderEntity>>> getUserOrders();
  Future<Either<Failure, Unit>> createOrder({
    required String cartId,
    required String details,
    required String phone,
    required String city,
  });
}
