import 'package:ecommerce/featuers/address/data/models/address_model.dart';

class AddressResponse {
  final int? results;
  final String? status;
  final List<AddressModel>? data;

  AddressResponse({this.results, this.status, this.data});

  factory AddressResponse.fromJson(Map<String, dynamic> json) {
    return AddressResponse(
      results: json['results'],
      status: json['status'],
      data: (json['data'] as List<dynamic>?)
          ?.map((item) => AddressModel.fromJson(item))
          .toList(),
    );
  }
}



