import 'package:ecommerce/core/utils/coverts.dart';
import 'package:ecommerce/featuers/home/domain/entities/category_entity.dart';

class CategoryModel extends CategoryEntity {
  final String? slug;
  final String? createdAt;
  final String? updatedAt;

   CategoryModel({
    required super.id,
    required super.name,
    required super.image,
    this.slug,
    this.createdAt,
    this.updatedAt,
  });

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: asString(json['id']),              // coerces int → "123"
      name: asString(json['name']),
      image: asString(json['image']),
      slug: asStringN(json['slug'] ?? json['Slug']),
      createdAt: asStringN(json['created_at'] ?? json['createdAt']),
      updatedAt: asStringN(json['updated_at'] ?? json['updatedAt']),
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'name': name,
        'image': image,
        'slug': slug,
        'created_at': createdAt,
        'updated_at': updatedAt,
      };
}
