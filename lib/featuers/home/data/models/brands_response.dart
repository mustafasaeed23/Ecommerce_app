import 'package:ecommerce/core/utils/coverts.dart';
import 'package:ecommerce/featuers/home/data/models/brand_model.dart';

class BrandsResponse {
  final int? results;
  final Metadata? metadata;
  final List<BrandModel> data;

  BrandsResponse({this.results, this.metadata, required this.data});

  factory BrandsResponse.fromJson(dynamic json) {
    if (json is List) {
      final list = json.cast<dynamic>();
      return BrandsResponse(
        results: list.length,
        metadata: null,
        data: list
            .map(
              (e) => BrandModel.fromJson(
                (e is Map<String, dynamic>)
                    ? e
                    : Map<String, dynamic>.from(e as Map),
              ),
            )
            .toList(),
      );
    }

    final map = json as Map<String, dynamic>;
    final rawList =
        map['data'] ?? map['items'] ?? map['result'] ?? map['rows'] ?? const [];
    final list = (rawList is List) ? rawList : const <dynamic>[];

    return BrandsResponse(
      results: (map['results'] is int) ? map['results'] as int : list.length,
      metadata: (map['metadata'] is Map<String, dynamic>)
          ? Metadata.fromJson(map['metadata'] as Map<String, dynamic>)
          : null,
      data: list
          .map(
            (e) => BrandModel.fromJson(
              (e is Map<String, dynamic>)
                  ? e
                  : Map<String, dynamic>.from(e as Map),
            ),
          )
          .toList(),
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
    currentPage = asInt(json['currentPage']);
    numberOfPages = asInt(json['numberOfPages']);
    limit = asInt(json['limit']);
    nextPage = asInt(json['nextPage']);
  }
}
