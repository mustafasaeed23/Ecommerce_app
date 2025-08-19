import 'package:ecommerce/Ecommerce_app.dart';
import 'package:ecommerce/core/bloc_observer.dart';
import 'package:ecommerce/core/constants/constants.dart';
import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/routes/app_router.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

// navigatorKey
//  final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await configureDependencies();

  Bloc.observer = MyBlocObserver();
  runApp(EcommerceApp(appRouter: AppRouter()));
}
