import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/featuers/orders/presentation/cubit/orders_cubit.dart';
import 'package:ecommerce/featuers/orders/presentation/cubit/orders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class OrdersTab extends StatelessWidget {
  const OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => serviceLocator.get<OrdersCubit>()..getAllOrders(),
      child: BlocBuilder<OrdersCubit, OrdersState>(
        builder: (context, state) {
          if (state is OrdersLoading) {
            return LoadingWidget();
          } else if (state is OrdersFailure) {
            return Center(
              child: Text(
                state.errorMessage,
                style: FontsStyle.bold.copyWith(color: Colors.red),
              ),
            );
          } else if (state is OrdersSuccess) {
            var orders = state.orders;
            if (orders.isEmpty) {
              return Center(
                child: Text(
                  "No orders found.",
                  style: FontsStyle.bold.copyWith(color: AppColors.mainColor),
                ),
              );
            }
            return SafeArea(
              top: true,
              child: ListView.separated(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                itemBuilder: (_, index) => Container(
                  padding: EdgeInsets.all(12.w),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(12.r),
                    border: Border.all(
                      color: AppColors.mainColor.withOpacity(0.2),
                    ),
                  ),
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Order #${orders[index].id}",
                            style: FontsStyle.bold.copyWith(
                              color: AppColors.mainColor,
                            ),
                          ),
                          Text(
                            " ${orders[index].totalOrderPrice.toString()} EGP",
                            style: FontsStyle.medium.copyWith(
                              color: AppColors.mainColor,
                            ),
                          ),
                          Text(
                            orders[index].isDelivered ? "Delivered" : "Pending",
                            style: FontsStyle.medium.copyWith(
                              color: Colors.green,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(height: 10.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            "Items: ${orders[index].cartItems.length}",
                            style: FontsStyle.medium.copyWith(
                              color: AppColors.mainColor,
                              fontSize: 12.sp,
                            ),
                          ),
                          Text(
                            orders[index].createdAt != null
                                ? orders[index].createdAt.substring(0, 10)
                                : "",
                            style: FontsStyle.medium.copyWith(
                              color: AppColors.mainColor,
                              fontSize: 12.sp,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                separatorBuilder: (_, __) => SizedBox(height: 10.h),
                itemCount: orders.length,
              ),
            );
          } else {
            return const SizedBox();
          }
          return const SizedBox();
        },
      ),
    );
  }
}
