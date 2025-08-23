import 'package:ecommerce/core/widgets/search_widget.dart';
import 'package:ecommerce/featuers/wishlist/presentation/widgets/wishList_item_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class WishlistScreen extends StatelessWidget {
  const WishlistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 15.0.w, vertical: 10.h),
        child: Column(
          children: [
            SearchWidget(),
            SizedBox(height: 15.h),
            Expanded(
              child: ListView.separated(
                itemBuilder: (context, index) {
                  return WishlistItemWidget();
                },
                separatorBuilder: (context, index) => SizedBox(height: 15.h),
                itemCount: 3,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
