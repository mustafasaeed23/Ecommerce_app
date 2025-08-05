import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/routes/app_router.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// navigatorKey
//  final navigatorKey = GlobalKey<NavigatorState>();

void main() {
  runApp(MyApp(appRouter: AppRouter()));
}

class MyApp extends StatefulWidget {
  const MyApp({super.key, required this.appRouter});
  final AppRouter appRouter;

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(375, 812),
      builder: (context, child) => child!,
      splitScreenMode: true,
      minTextAdapt: true,
      child: MaterialApp(
        title: 'Ecommerce',
        debugShowCheckedModeBanner: false,
        onGenerateRoute: widget.appRouter.genegratedRoute,
        initialRoute: Routes.loginScreen,
        navigatorKey: Constants.navigatorKey,
      ),
    );
  }
}
