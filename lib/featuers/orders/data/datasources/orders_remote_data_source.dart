import 'package:ecommerce/featuers/orders/data/models/order_model.dart';

abstract class OrdersRemoteDataSource {
  Future<List<OrderModel>> getUserOrders();
}
