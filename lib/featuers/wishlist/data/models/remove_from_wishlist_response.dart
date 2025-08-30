// ignore: file_names
class RemoveFromWishListResponse {
  String? status;
  String? message;
  List<String>? data;

  RemoveFromWishListResponse({this.status, this.message, this.data});

  RemoveFromWishListResponse.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    data = json['data'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['data'] = this.data;
    return data;
  }
}