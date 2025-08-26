import 'package:bloc/bloc.dart';
import 'package:ecommerce/featuers/address/domain/usecases/get_user_address_use_case.dart';
import 'package:ecommerce/featuers/address/presentation/cubit/address_state.dart';
import 'package:injectable/injectable.dart';

@injectable
class AddressCubit extends Cubit<AddressState> {
  AddressCubit(this.getUserAddressUseCase) : super(AddressInitial());

  final GetUserAddressUseCase getUserAddressUseCase;
  Future<void> getUserAddress() async {
    emit(AddressLoading());
    final result = await getUserAddressUseCase();
    result.fold(
      (l) => emit(AddressFailure(l.message)),
      (r) => emit(AddressSuccess(r)),
    );
  }
}
