import 'package:ecommerce/core/utils/converts.dart';
import 'package:ecommerce/featuers/home/domain/entities/brand_entity.dart';

class BrandModel extends BrandEntity {
  final String? slug;
  final String? createdAt;
  final String? updatedAt;

  const BrandModel({
    required super.id,
    required super.name,
    required super.image,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory BrandModel.fromJson(Map<String, dynamic> json) {
    return BrandModel(
      id: asString(json['id']),              // force to String
      name: asString(json['name']),
      image: asString(json['image']),
      slug: asStringN(json['slug'] ?? json['Slug']),
      createdAt: asStringN(json['created_at'] ?? json['createdAt']),
      updatedAt: asStringN(json['updated_at'] ?? json['updatedAt']),
    );
  }


}
