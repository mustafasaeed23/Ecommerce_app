class ProductEntity {
  final List<String> images;
  final int ratingsQuantity;
  final String sId;
  final String title;
  final String description;
  final int quantity;
  final int price;
  final String imageCover;
  final double ratingsAverage;
  final String id;
  final int priceAfterDiscount;
  final int sold;

  ProductEntity({
    required this.images,
    required this.ratingsQuantity,
    required this.sId,
    required this.title,
    required this.description,
    required this.quantity,
    required this.price,
    required this.imageCover,
    required this.ratingsAverage,
    required this.id,
    required this.priceAfterDiscount,
    required this.sold,
  });
}
