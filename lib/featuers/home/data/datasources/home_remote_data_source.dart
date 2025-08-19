import 'package:ecommerce/featuers/home/data/models/brands_response.dart';
import 'package:ecommerce/featuers/home/data/models/categories_response.dart';

abstract class HomeRemoteDataSource {
  Future<CategoriesResponse> getCategories();
  Future<BrandsResponse> getBrands();
}
