import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/featuers/orders/presentation/screens/orders_tab.dart';
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
        body: const TabBarView(children: [ProfileTab(), OrdersTab()]),
      ),
    );
  }
}
