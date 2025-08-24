import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/featuers/profile/presentation/widgets/profile_tab.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AccountScreen extends StatelessWidget {
  const AccountScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          centerTitle: true,
          title: Text(
            'Account',
            style: FontsStyle.bold.copyWith(color: AppColors.mainColor),
          ),
          backgroundColor: Colors.white,
          elevation: 0,
          bottom: PreferredSize(
            preferredSize: Size.fromHeight(48.h),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 15.w),
              child: Align(
                alignment: Alignment.centerLeft,
                child: TabBar(
                  labelPadding: EdgeInsets.zero,
                  indicatorColor: AppColors.mainColor,
                  labelColor: AppColors.mainColor,
                  indicatorSize: TabBarIndicatorSize.tab,
                  unselectedLabelColor: AppColors.mainColor.withOpacity(0.5),
                  tabs: [
                    Tab(
                      child: Text(
                        'Profile',
                        style: FontsStyle.medium.copyWith(fontSize: 15.r),
                      ),
                    ),
                    Tab(
                      child: Text(
                        'Orders',
                        style: FontsStyle.medium.copyWith(fontSize: 15.r),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        body: const TabBarView(children: [ProfileTab(), _OrdersTab()]),
      ),
    );
  }
}

class _OrdersTab extends StatelessWidget {
  const _OrdersTab({super.key});

  @override
  Widget build(BuildContext context) {
    // Replace with your BlocBuilder for real orders
    return SafeArea(
      top: true,
      child: ListView.separated(
        padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
        itemBuilder: (_, i) => Container(
          padding: EdgeInsets.all(12.w),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(color: AppColors.mainColor.withOpacity(0.2)),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "#ORD-00${i + 1}",
                style: FontsStyle.bold.copyWith(color: AppColors.mainColor),
              ),
              Text(
                "EGP ${(i + 1) * 250}",
                style: FontsStyle.medium.copyWith(color: AppColors.mainColor),
              ),
              Text(
                "Delivered",
                style: FontsStyle.medium.copyWith(
                  color: Colors.green,
                  fontSize: 12.sp,
                ),
              ),
            ],
          ),
        ),
        separatorBuilder: (_, __) => SizedBox(height: 10.h),
        itemCount: 8,
      ),
    );
  }
}
