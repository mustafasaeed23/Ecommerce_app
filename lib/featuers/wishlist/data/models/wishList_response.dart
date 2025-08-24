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
      data: json['data']
          .map<WishListProductModel>((e) => WishListProductModel.fromJson(e))
          .toList(),
    );
  }
}

class WishListProductModel extends WishlistProductEntity {
  final int? sold;
  final List<String>? images;
  final int? ratingsQuantity;
  final String? slug;
  final String? description;
  final int? quantity;

  final double? ratingsAverage;
  final String? createdAt;
  final String? updatedAt;
  final int? iV;

  WishListProductModel({
    this.sold,
    this.images,
    this.ratingsQuantity,
    required super.title,
    required super.price,
    required super.imageCover,
    required super.id,
    this.slug,
    this.description,
    this.quantity,
    this.ratingsAverage,
    this.createdAt,
    this.updatedAt,
    this.iV,
  });

  factory WishListProductModel.fromJson(Map<String, dynamic> json) {
    return WishListProductModel(
      sold: json['sold'],
      images: json['images'].cast<String>(),
      ratingsQuantity: json['ratingsQuantity'],
      title: json['title'],
      slug: json['slug'],
      description: json['description'],
      quantity: json['quantity'],
      price: json['price'],
      imageCover: json['imageCover'],
      ratingsAverage: json['ratingsAverage'],
      createdAt: json['createdAt'],
      updatedAt: json['updatedAt'],
      iV: json['__v'],
      id: json['_id'],
    );
  }
}
