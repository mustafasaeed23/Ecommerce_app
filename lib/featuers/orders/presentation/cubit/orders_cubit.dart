import 'package:bloc/bloc.dart';
import 'package:ecommerce/featuers/orders/domain/usecases/create_order_use_case.dart';
import 'package:ecommerce/featuers/orders/domain/usecases/get_all_orders_use_case.dart';
import 'package:ecommerce/featuers/orders/presentation/cubit/orders_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.getAllOrdersUseCase, this.createOrderUseCase)
    : super(OrdersInitial());

  final GetAllOrdersUseCase getAllOrdersUseCase;
  final CreateOrderUseCase createOrderUseCase;

  Future<void> getAllOrders() async {
    emit(OrdersLoading());
    final result = await getAllOrdersUseCase();
    result.fold(
      (failure) => emit(OrdersFailure(failure.message)),
      (orders) => emit(OrdersSuccess(orders)),
    );
  }

  Future<void> createOrder({
    required String cartId,
    required String details,
    required String phone,
    required String city,
  }) async {
    emit(OrderCreatingLoading());
    final result = await createOrderUseCase(
      cartId: cartId,
      details: details,
      phone: phone,
      city: city,
    );
    result.fold((failure) {
      emit(OrderCreatingFailure(failure.message));
      print("error ${failure.message}");
    }, (_) => emit(OrderCreatingSuccess()));
  }
}
