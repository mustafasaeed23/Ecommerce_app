import 'package:ecommerce/featuers/cart/domain/entities/cart_entity.dart';

abstract class CartState {}

class CartInitial extends CartState {}

// Get Cart States
class CartLoading extends CartState {}

class CartLoaded extends CartState {}

class CartError extends CartState {
  final String message;
  CartError(this.message);
}

// Add To Cart States
class AddToCartLoading extends CartState {}

class AddToCartSuccess extends CartState {}

class AddToCartError extends CartState {
  final String message;
  AddToCartError(this.message);
}

// Update Cart States
class UpdateCartLoading extends CartState {}

class UpdateCartSuccess extends CartState {}

class UpdateCartError extends CartState {
  final String message;
  UpdateCartError(this.message);
}

// Delete From Cart States
class DeleteItemLoading extends CartState {}

class DeleteItemSuccess extends CartState {}

class DeleteItemError extends CartState {
  final String message;
  DeleteItemError(this.message);
}
