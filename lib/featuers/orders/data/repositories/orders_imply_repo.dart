import 'package:dartz/dartz.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/core/errors/failure.dart';
import 'package:ecommerce/featuers/orders/data/datasources/orders_remote_data_source.dart';
import 'package:ecommerce/featuers/orders/domain/entities/order_entity.dart';
import 'package:ecommerce/featuers/orders/domain/repositories/orders_contract_repo.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrdersContractRepo)
class OrdersImplyRepo implements OrdersContractRepo {
  final OrdersRemoteDataSource remoteDataSource;
  OrdersImplyRepo(this.remoteDataSource);
  @override
  Future<Either<Failure, List<OrderEntity>>> getUserOrders() async {
    try {
  final result = await remoteDataSource.getUserOrders();
  return Right(result);
} on RemoteException catch (err) {
      return Left(Failure(err.message));
    }
  }
  
}