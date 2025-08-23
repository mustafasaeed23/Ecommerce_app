// import 'package:ecommerce/core/di/service_locator.dart';
// import 'package:ecommerce/core/widgets/loading_widget.dart';
// import 'package:ecommerce/featuers/cart/presentation/cubit/cart_cubit.dart';
// import 'package:ecommerce/featuers/cart/presentation/cubit/cart_state.dart';
// import 'package:ecommerce/featuers/cart/presentation/widgets/cart_item_widget.dart';
// import 'package:ecommerce/featuers/cart/presentation/widgets/check_out_widget.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';

// class CartList extends StatelessWidget {
//   const CartList({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return BlocBuilder<CartCubit, CartState>(
//       builder: (context, state) {
//         if (state is CartLoading) {
//           return LoadingWidget();
//         } else if (state is CartLoaded) {
//           if (cubit.cartEntity.products.isEmpty) {
//             return Center(child: Text("Cart is empty"));
//           }
//           return Column(
//             children: [
//               Expanded(
//                 child: ListView.separated(
//                   scrollDirection: Axis.vertical,
//                   shrinkWrap: true,
//                   physics: BouncingScrollPhysics(),
//                   itemBuilder: (context, index) {
//                     return CartItemWidget(
//                       cartItemEntity: cubit.cartEntity.products[index],
//                       cartCubit: cubit,
//                     );
//                   },
//                   separatorBuilder: (context, index) => SizedBox(height: 12.h),
//                   itemCount: cubit.cartEntity.products.length,
//                 ),
//               ),
//               CheckOutWidget(
//                 totalPrice: cubit.cartEntity.totalCartPrice.toString(),
//               ),
//             ],
//           );
//         } else if (state is CartError) {
//           return Center(child: Text(state.message));
//         } else {
//           return Container();
//         }
//       },
//     );
//   }
// }
