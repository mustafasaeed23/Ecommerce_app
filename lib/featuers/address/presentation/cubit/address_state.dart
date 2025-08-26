import 'package:ecommerce/featuers/address/domain/entities/address_entity.dart';

abstract class AddressState {}
class AddressInitial extends AddressState {}
class AddressLoading extends AddressState {}
class AddressSuccess extends AddressState {
  final List<AddressEntity> address;
  AddressSuccess(this.address);
}
class AddressFailure extends AddressState {
  final String errorMessage;
  AddressFailure(this.errorMessage);
}
