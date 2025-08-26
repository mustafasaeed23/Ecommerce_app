import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_constants.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/featuers/address/data/datasources/address_remote_data_source.dart';
import 'package:ecommerce/featuers/address/data/models/address_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AddressRemoteDataSource)
class AddressRemoteApiDataSource implements AddressRemoteDataSource {
  final Dio dio;
  AddressRemoteApiDataSource(this.dio);
  @override
  Future<AddressResponse> getUserAddress() async {
    try {
      final response = await dio.get(ApiConstants.addressesEndPoint);
      return AddressResponse.fromJson(response.data);
    } on RemoteException catch (e) {
      throw RemoteException("Failed to get user address: ${e.message}");
    }
  }
}
