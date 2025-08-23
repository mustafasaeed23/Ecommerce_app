import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/featuers/authentication/presentation/screens/login_screen.dart';
import 'package:ecommerce/featuers/authentication/presentation/screens/register_screen.dart';
import 'package:ecommerce/featuers/cart/presentation/cubit/cart_cubit.dart';
import 'package:ecommerce/featuers/cart/presentation/screens/cart_screen.dart';
import 'package:ecommerce/featuers/categories/presentation/screens/sub_categories_screen.dart';
import 'package:ecommerce/featuers/home/presentation/screens/home_screen.dart';
import 'package:ecommerce/featuers/products/presentation/screens/product_details_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:page_transition/page_transition.dart';

class AppRouter {
  Route genegratedRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.registerScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: RegisterScreen(),
        );

      case Routes.loginScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: LoginScreen(),
        );
      case Routes.homeScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: HomeScreen(),
        );
      case Routes.categoriesScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: CategoriesPage(),
        );
      case Routes.productDetailsScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: BlocProvider(
            create: (context) => serviceLocator.get<CartCubit>(),
            child: ProductDetailsScreen(),
          ),
          settings: settings,
        );
      case Routes.cartScreen:
        return PageTransition(
          type: PageTransitionType.fade,
          child: CartScreen(),
          settings: settings,
        );

      default:
        return MaterialPageRoute(builder: (_) => HomeScreen());
    }
  }
}
