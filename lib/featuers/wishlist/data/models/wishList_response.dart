import 'package:ecommerce/featuers/wishlist/domain/entities/wishlist_product_entity.dart';

class WishListResponse {
  final String? status;
  final int? count;
  final List<WishListProductModel> data;

  WishListResponse({this.status, this.count, required this.data});

  factory WishListResponse.fromJson(Map<String, dynamic> json) {
    return WishListResponse(
      status: json['status'],
      count: json['count'],
      data: (json['data'] as List)
          .map<WishListProductModel>(
            (e) => WishListProductModel.fromJson(e as Map<String, dynamic>),
          )
          .toList(),
    );
  }
}

class WishListProductModel extends WishlistProductEntity {
  final int sold;
  final List<String> images;
  final int ratingsQuantity;
  final String? slug;
  final String? description;
  final int quantity;
  final double ratingsAverage;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;

  WishListProductModel({
    this.sold = 0,
    this.images = const [],
    this.ratingsQuantity = 0,
    required super.title,
    required super.price,
    required super.imageCover,
    required super.id,
    this.slug,
    this.description,
    this.quantity = 0,
    this.ratingsAverage = 0.0,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  factory WishListProductModel.fromJson(Map<String, dynamic> json) {
    const String baseUrl = "https://ecommerce.routemisr.com/Route-Academy-products/";

    return WishListProductModel(
      sold: json['sold'] is int
          ? json['sold']
          : int.tryParse(json['sold']?.toString() ?? '') ?? 0,
      images: (json['images'] as List?)
              ?.map((e) {
                final img = e.toString();
                // prepend base URL if not already a full link
                return img.startsWith('http') ? img : baseUrl + img;
              })
              .toList() ??
          [],
      ratingsQuantity: json['ratingsQuantity'] is int
          ? json['ratingsQuantity']
          : int.tryParse(json['ratingsQuantity']?.toString() ?? '') ?? 0,
      title: json['title'] ?? '',
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'] is int
          ? json['quantity']
          : int.tryParse(json['quantity']?.toString() ?? '') ?? 0,
      price: (json['price'] is num)
          ? (json['price'] as num).toDouble()
          : double.tryParse(json['price']?.toString() ?? '') ?? 0.0,
      imageCover: json['imageCover']?.toString() ?? '',
      ratingsAverage: (json['ratingsAverage'] is num)
          ? (json['ratingsAverage'] as num).toDouble()
          : double.tryParse(json['ratingsAverage']?.toString() ?? '') ?? 0.0,
      createdAt: json['createdAt']?.toString(),
      updatedAt: json['updatedAt']?.toString(),
      iV: json['__v'] is int ? json['__v'] : null,
      id: json['_id']?.toString() ?? '',
    );
  }
}

