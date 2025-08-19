import 'package:ecommerce/featuers/home/domain/entities/brand_entity.dart';
import 'package:ecommerce/featuers/home/domain/entities/category_entity.dart';

abstract class HomeState {}

class HomeInitial extends HomeState {}

class CategoriesLoading extends HomeState {}

class CategoriesLoaded extends HomeState {
  final List<CategoryEntity> categories;

  CategoriesLoaded(this.categories);
}

class CategoriesError extends HomeState {
  final String message;

  CategoriesError(this.message);
}

class BrandsLoading extends HomeState {}

class BrandsLoaded extends HomeState {
  final List<BrandEntity> brands;

  BrandsLoaded(this.brands);
}

class BrandsError extends HomeState {
  final String message;

  BrandsError(this.message);
}
