import 'package:bloc/bloc.dart';
import 'package:ecommerce/featuers/orders/domain/usecases/get_all_orders_use_case.dart';
import 'package:ecommerce/featuers/orders/presentation/cubit/orders_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class OrdersCubit extends Cubit<OrdersState> {
  OrdersCubit(this.getAllOrdersUseCase) : super(OrdersInitial());

  final GetAllOrdersUseCase getAllOrdersUseCase;

  Future<void> getAllOrders() async {
    emit(OrdersLoading());
    final result = await getAllOrdersUseCase();
    result.fold(
      (failure) => emit(OrdersFailure(failure.message)),
      (orders) => emit(OrdersSuccess(orders)),
    );
  }
}
