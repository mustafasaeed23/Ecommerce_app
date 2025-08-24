import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_constants.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/featuers/orders/data/datasources/orders_remote_data_source.dart';
import 'package:ecommerce/featuers/orders/data/models/order_model.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: OrdersRemoteDataSource)
class OrdersRemoteApiDataSource implements OrdersRemoteDataSource {
  final Dio dio;
  OrdersRemoteApiDataSource(this.dio);
  @override
  Future<List<OrderModel>> getUserOrders() async {
    try {
      final response = await dio.get(
        "${ApiConstants.ordersEndPoint}/68a1335fafda7386fac3e7e9",
      );
      return response.data
          .map<OrderModel>((e) => OrderModel.fromJson(e))
          .toList();
    } catch (exception) {
      throw RemoteException("Failed To get Orders");
    }
  }
}
