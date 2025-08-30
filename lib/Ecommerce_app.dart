import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/cubit/search_cubit.dart';
import 'package:ecommerce/core/routes/app_router.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/app_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class EcommerceApp extends StatefulWidget {
  const EcommerceApp({
    super.key,
    required this.appRouter,
    required this.isLoggedIn,
  });
  final AppRouter appRouter;
  final bool isLoggedIn;

  @override
  State<EcommerceApp> createState() => _EcommerceAppState();
}

class _EcommerceAppState extends State<EcommerceApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => child!,
      splitScreenMode: true,
      minTextAdapt: true,
      child: BlocProvider(
        create: (context) => SearchCubit(),
        child: MaterialApp(
          title: 'Ecommerce',
          debugShowCheckedModeBanner: false,
          onGenerateRoute: widget.appRouter.genegratedRoute,
          initialRoute: widget.isLoggedIn
              ? Routes.homeScreen
              : Routes.loginScreen,
          navigatorKey: Constants.navigatorKey,
          theme: AppTheme.lightTheme,
        ),
      ),
    );
  }
}
