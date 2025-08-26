import 'package:ecommerce/featuers/address/data/models/address_response.dart';

abstract class AddressRemoteDataSource {
  Future<AddressResponse> getUserAddress();
}
