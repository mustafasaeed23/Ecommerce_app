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

  @override
  Future<OrderModel> createOrder({
    required String cartId,
    required String details,
    required String phone,
    required String city,
  }) async {
    try {
      final response = await dio.post(
        "${ApiConstants.createOrderEndPoint}/$cartId",
        data: {
          "shippingAddress": {"details": details, "phone": phone, "city": city},
        },
      );

      if (response.data["status"] != "success") {
        throw RemoteException(
          response.data["message"] ?? "Failed to create order",
        );
      }

      return OrderModel.fromJson(response.data["data"]);
    } catch (exception) {
      throw RemoteException("Failed to create Order");
    }
  }
}
