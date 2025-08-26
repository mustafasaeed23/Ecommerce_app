import 'package:ecommerce/core/cubit/search_cubit.dart';
import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/widgets/search_widget.dart';
import 'package:ecommerce/featuers/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce/featuers/home/presentation/cubit/home_state.dart';
import 'package:ecommerce/featuers/home/presentation/widgets/banners_widget.dart';
import 'package:ecommerce/featuers/home/presentation/widgets/brands_section.dart';
import 'package:ecommerce/featuers/home/presentation/widgets/categories_section.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as context;

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final homeCubit = serviceLocator.get<HomeCubit>();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      top: true,
      child: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SearchWidget(),
              SizedBox(height: 20.h),
              BannersCarousel(
                assets: const [Assets.banner1, Assets.banner2, Assets.banner3],
                height: 170.h,
                borderRadius: 15,
                viewportFraction: 1,
                autoPlay: false,

                autoPlayInterval: Duration(seconds: 4),
              ),
              SizedBox(height: 20.h),
              Row(
                children: [
                  Text(
                    "Categories",
                    style: FontsStyle.semiBold.copyWith(
                      fontSize: 18.r,
                      color: AppColors.mainColor,
                    ),
                  ),
                  Spacer(),
                  InkWell(
                    onTap: () =>
                        Navigator.pushNamed(context, Routes.categoriesScreen),
                    child: Text(
                      "See all",
                      style: FontsStyle.regular.copyWith(
                        fontSize: 14.r,
                        color: AppColors.mainColor,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10.h),
              CategoriesSection(),
              SizedBox(height: 20.h),
              Text(
                "Brands",
                style: FontsStyle.semiBold.copyWith(
                  fontSize: 18.r,
                  color: AppColors.mainColor,
                ),
              ),
              BrandsSection(),
              SizedBox(height: 20.h),
            ],
          ),
        ),
      ),
    );
  }
}
