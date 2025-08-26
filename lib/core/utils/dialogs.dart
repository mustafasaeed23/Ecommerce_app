import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/helpers/vaildations.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/featuers/orders/presentation/cubit/orders_cubit.dart';
import 'package:ecommerce/featuers/orders/presentation/cubit/orders_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:fluttertoast/fluttertoast.dart';

class Dialogs {
  static void showLoadingDialog(BuildContext context) => showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => PopScope(
      canPop: false,
      child: AlertDialog(
        content: SizedBox(
          height: MediaQuery.of(context).size.height * 0.2,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [LoadingWidget()],
          ),
        ),
      ),
    ),
  );
  static void successDialog(String message) => Fluttertoast.showToast(
    msg: message,
    toastLength: Toast.LENGTH_LONG,
    backgroundColor: Colors.green,
    fontSize: 15.r,
    gravity: ToastGravity.SNACKBAR,
    webShowClose: true,
  );
  static void customToast(
    BuildContext context,
    String message, {
    Color bg = Colors.green,
  }) {
    final overlay = Overlay.of(context);
    final entry = OverlayEntry(
      builder: (_) => Positioned(
        bottom: 50,
        left: 20,
        right: 20,
        child: Material(
          color: Colors.transparent,
          child: AnimatedContainer(
            duration: const Duration(milliseconds: 300),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(12),
              boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 8)],
            ),
            child: Row(
              children: [
                const Icon(Icons.check_circle, color: Colors.white),
                const SizedBox(width: 12),
                Expanded(
                  child: Text(
                    message,
                    style: const TextStyle(color: Colors.white, fontSize: 15),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );

    overlay.insert(entry);
    Future.delayed(const Duration(seconds: 3), () => entry.remove());
  }

  static void hideLoadingDialog(BuildContext context) => Navigator.pop(context);

  static void showMessageDialog(String message) {
    Fluttertoast.showToast(msg: message, toastLength: Toast.LENGTH_SHORT);
  }

  static void showCreateOrderDialog(BuildContext context, String cartId) {
    final TextEditingController detailsController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();
    final TextEditingController cityController = TextEditingController();
    showDialog(
      context: context,
      builder: (ctx) {
        return BlocProvider(
          create: (context) => serviceLocator.get<OrdersCubit>(),
          child: Dialog(
            backgroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16.r),
            ),
            child: BlocConsumer<OrdersCubit, OrdersState>(
              listener: (ctx, state) {
                if (state is OrderCreatingSuccess) {
                  Fluttertoast.showToast(
                    msg: "✅ Order created successfully",
                    toastLength: Toast.LENGTH_LONG,
                    backgroundColor: Colors.green,
                    fontSize: 15.r,
                    gravity: ToastGravity.SNACKBAR,
                    webShowClose: true,
                  );
                  Navigator.of(ctx).pop(); // close dialog on success
                } else if (state is OrderCreatingFailure) {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(content: Text("❌ ${state.errorMessage}")),
                  );
                  Navigator.of(ctx).pop();
                }
              },
              builder: (ctx, state) {
                final isLoading = state is OrderCreatingLoading;

                return SizedBox(
                  width: 400.w,
                  child: Padding(
                    padding: EdgeInsets.all(16.r),
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        /// Title
                        Text(
                          "Create Order",
                          style: FontsStyle.bold.copyWith(
                            fontSize: 18.r,
                            color: Colors.black,
                          ),
                        ),
                        SizedBox(height: 16.h),

                        /// Details
                        CustomTextFormField(
                          borderColor: AppColors.lightBlueColor.withOpacity(
                            0.3,
                          ),
                          headerTextColor: AppColors.mainColor,
                          headerText: "Details",
                          hintText: "Enter order details",
                          controller: detailsController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter order details';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 12.h),

                        /// Phone
                        CustomTextFormField(
                          headerTextColor: AppColors.mainColor,
                          borderColor: AppColors.lightBlueColor.withOpacity(
                            0.3,
                          ),
                          headerText: "Phone",
                          hintText: "Enter phone number",
                          controller: phoneController,
                          keyboardType: TextInputType.phone,
                          validator: Vaildations.validateMobileNumber,
                        ),
                        SizedBox(height: 12.h),

                        /// City
                        CustomTextFormField(
                          headerTextColor: AppColors.mainColor,
                          borderColor: AppColors.lightBlueColor.withOpacity(
                            0.3,
                          ),
                          headerText: "City",
                          hintText: "Enter city",
                          controller: cityController,
                          keyboardType: TextInputType.text,
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'Please enter city';
                            }
                            return null;
                          },
                        ),
                        SizedBox(height: 20.h),

                        /// Actions
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            TextButton(
                              onPressed: () => Navigator.of(ctx).pop(),
                              child: Text(
                                "Cancel",
                                style: FontsStyle.medium.copyWith(
                                  fontSize: 16.r,
                                  color: Colors.red,
                                ),
                              ),
                            ),
                            SizedBox(width: 8.w),
                            ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.mainColor,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8.r),
                                ),
                              ),
                              onPressed: isLoading
                                  ? null
                                  : () {
                                      ctx.read<OrdersCubit>().createOrder(
                                        cartId: cartId,
                                        details:
                                            detailsController.text, // details
                                        phone: phoneController.text, // phone
                                        city: cityController.text, // city
                                      );
                                    },

                              child: isLoading
                                  ? SizedBox(
                                      width: 20.r,
                                      height: 20.r,
                                      child: const CircularProgressIndicator(
                                        strokeWidth: 2,
                                        color: Colors.white,
                                      ),
                                    )
                                  : Text(
                                      "Create",
                                      style: FontsStyle.medium.copyWith(
                                        fontSize: 16.r,
                                        color: Colors.white,
                                      ),
                                    ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
