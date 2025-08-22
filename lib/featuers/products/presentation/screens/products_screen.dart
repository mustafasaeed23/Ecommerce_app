import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/widgets/search_widget.dart';
import 'package:ecommerce/featuers/products/presentation/widgets/product_item_widget.dart';
import 'package:ecommerce/featuers/products/presentation/widgets/products_list_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: Padding(
        padding: EdgeInsetsGeometry.symmetric(horizontal: 15.w, vertical: 10.h),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SearchWidget(),
              SizedBox(height: 20.h),
              ProductsListWidget(),
            ],
          ),
        ),
      ),
    );
  }
}
