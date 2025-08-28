import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/theme/assets.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/featuers/home/presentation/cubit/home_cubit.dart';
import 'package:ecommerce/featuers/home/presentation/widgets/custom_buttom_nav_bar.dart';
import 'package:ecommerce/featuers/home/presentation/widgets/home_tab.dart';
import 'package:ecommerce/featuers/layout/cubit/nav_bar_cubit.dart';
import 'package:ecommerce/featuers/layout/cubit/nav_bar_state.dart';
import 'package:ecommerce/featuers/products/presentation/screens/products_screen.dart';
import 'package:ecommerce/featuers/profile/presentation/screens/account_screen.dart';
import 'package:ecommerce/featuers/wishlist/presentation/cubit/wishlist_cubit.dart';
import 'package:ecommerce/featuers/wishlist/presentation/screens/wishList_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (_) => NavBarCubit()),
        BlocProvider(
          create: (context) =>
              serviceLocator.get<WishlistCubit>()..getUserWishlist(),
        ),
      ],
      child: BlocBuilder<NavBarCubit, NavBarState>(
        builder: (context, state) {
          return Scaffold(
            // extendBody: true,
            backgroundColor: Colors.white,
            body: IndexedStack(
              sizing: StackFit.expand,
              clipBehavior: Clip.none,
              index: state.selectedIndex,
              children: [
                const HomeTab(),
                const ProductsScreen(),
                const WishlistScreen(),
                const AccountScreen(),
              ],
            ),
            bottomNavigationBar: CustomBottomNavBar(
              currentIndex: state.selectedIndex,
              onTap: (i) => context.read<NavBarCubit>().setTab(i),
              svgIcons: const [
                Assets.homeIcon,
                Assets.categoriesIcon,
                Assets.heartIcon,
                Assets.personIcon,
              ],
              backgroundColor: AppColors.mainColor,
              activeColor: AppColors.mainColor,
              inactiveColor: Colors.white,
              height: 70.h,
              borderRadius: 22.r,
              // margin: EdgeInsets.fromLTRB(12.w, 0, 12.w, 12.h),
              // padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 12.h),
              showLabels: false,
            ),
          );
        },
      ),
    );
  }
}
