import 'package:ecommerce/featuers/orders/data/models/order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getUserOrders();
  Future<OrderModel> createOrder({
    required String cartId,
    required String details,
    required String phone,
    required String city,
  });
}
