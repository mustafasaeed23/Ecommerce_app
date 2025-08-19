import 'package:dio/dio.dart';
import 'package:ecommerce/core/api/api_constants.dart';
import 'package:ecommerce/core/errors/expections.dart';
import 'package:ecommerce/featuers/home/data/datasources/home_remote_data_source.dart';
import 'package:ecommerce/featuers/home/data/models/brands_response.dart';
import 'package:ecommerce/featuers/home/data/models/categories_response.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: HomeRemoteDataSource)
class HomeRemoteApiDataSource implements HomeRemoteDataSource {
  final Dio _dio;

  HomeRemoteApiDataSource(this._dio);
  @override
  Future<CategoriesResponse> getCategories() async {
    try {
      final res = await _dio.get(ApiConstants.categoriesEndPoint);

      // Make sure status code is valid
      if (res.statusCode == null ||
          res.statusCode! < 200 ||
          res.statusCode! >= 300) {
        throw RemoteException(
          "Categories request failed (status: ${res.statusCode})",
        );
      }

      // Parse response safely
      final data = res.data;
      if (data is Map<String, dynamic>) {
        return CategoriesResponse.fromJson(data);
      } else {
        throw RemoteException("Unexpected response format for categories");
      }
    } on DioException catch (e) {
      final status = e.response?.statusCode;
      final body = e.response?.data;
      final msg = (body is Map && body['message'] is String)
          ? body['message']
          : e.message ?? "Network error";

      throw RemoteException("Categories request error: $msg");
    } catch (e) {
      throw RemoteException("Categories parse error: $e");
    }
  }

  @override
  Future<BrandsResponse> getBrands() async {
    try {
      final response = await _dio.get(ApiConstants.brandsEndPoint);
      return BrandsResponse.fromJson(response.data);
    } catch (e) {
      throw RemoteException("Failed To get Brands");
    }
  }
}
