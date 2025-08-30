import 'package:ecommerce/featuers/home/data/models/brand_model.dart';
import 'package:ecommerce/featuers/home/data/models/category_model.dart';
import 'package:ecommerce/featuers/products/domain/entities/product_entity.dart';

class ProductsResponse {
  final int? results;
  final Metadata? metadata;
  final List<ProductModel> data;

  ProductsResponse({this.results, this.metadata, required this.data});

  factory ProductsResponse.fromJson(Map<String, dynamic> json) {
    return ProductsResponse(
      results: json['results'],
      metadata: json['metadata'] != null
          ? Metadata.fromJson(Map<String, dynamic>.from(json['metadata']))
          : null,
      data:
          (json['data'] as List<dynamic>?)
              ?.map((e) => ProductModel.fromJson(Map<String, dynamic>.from(e)))
              .toList() ??
          [],
    );
  }
}

class Metadata {
  int? currentPage;
  int? numberOfPages;
  int? limit;
  int? nextPage;

  Metadata({this.currentPage, this.numberOfPages, this.limit, this.nextPage});

  Metadata.fromJson(Map<String, dynamic> json) {
    currentPage = json['currentPage'];
    numberOfPages = json['numberOfPages'];
    limit = json['limit'];
    nextPage = json['nextPage'];
  }
}

class ProductModel extends ProductEntity {
  List<Subcategory>? subcategory;
  String? slug;
  CategoryModel? category;
  BrandModel? brand;
  String? createdAt;
  String? updatedAt;

  ProductModel({
    required super.sold,
    required super.images,
    this.subcategory,
    required super.ratingsQuantity,
    required super.sId,
    required super.title,
    this.slug,
    required super.description,
    required super.quantity,
    required super.price,
    required super.imageCover,
    this.category,
    this.brand,
    required super.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    required super.id,
    required super.priceAfterDiscount,
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      id: json['_id']?.toString() ?? '', // use _id consistently
      sId: json['_id']?.toString() ?? '',
      title: json['title'] ?? '',
      description: json['description'] ?? '',
      quantity: json['quantity'] is int
          ? json['quantity']
          : int.tryParse(json['quantity'].toString()) ?? 0,
      price: json['price'] is int
          ? json['price']
          : int.tryParse(json['price'].toString()) ?? 0,
      priceAfterDiscount: json['priceAfterDiscount'] != null
          ? (json['priceAfterDiscount'] is int
                ? json['priceAfterDiscount']
                : int.tryParse(json['priceAfterDiscount'].toString()) ?? 0)
          : 0, // default to 0 if missing
      ratingsAverage: (json['ratingsAverage'] is num)
          ? (json['ratingsAverage'] as num).toDouble()
          : double.tryParse(json['ratingsAverage']?.toString() ?? '') ?? 0.0,
      ratingsQuantity: json['ratingsQuantity'] is int
          ? json['ratingsQuantity']
          : int.tryParse(json['ratingsQuantity'].toString()) ?? 0,
      imageCover: json['imageCover']?.toString() ?? '',
      images:
          (json['images'] as List?)?.map((e) => e.toString()).toList() ?? [],
      sold: json['sold'] is int
          ? json['sold']
          : int.tryParse(json['sold']?.toString() ?? '') ?? 0, // safe fallback
      slug: json['slug']?.toString(),
      createdAt:
          json['created_at']?.toString() ?? json['createdAt']?.toString(),
      updatedAt:
          json['updated_at']?.toString() ?? json['updatedAt']?.toString(),
      category: json['category'] != null
          ? CategoryModel.fromJson(Map<String, dynamic>.from(json['category']))
          : null,
      brand: json['brand'] != null
          ? BrandModel.fromJson(Map<String, dynamic>.from(json['brand']))
          : null,
      subcategory: (json['subcategory'] as List?)
          ?.map((e) => Subcategory.fromJson(Map<String, dynamic>.from(e)))
          .toList(),
    );
  }
}

class Subcategory {
  String? sId;
  String? name;
  String? slug;
  String? category;

  Subcategory({this.sId, this.name, this.slug, this.category});

  Subcategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
    slug = json['slug'];
    category = json['category'];
  }
}
