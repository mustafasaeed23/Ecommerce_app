import 'package:ecommerce/Ecommerce_app.dart';
import 'package:ecommerce/core/bloc_observer.dart';
import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/routes/app_router.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/featuers/authentication/data/datasources/local/auth_local_data_source.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

Future<void> main() async {
  // Ensure Flutter engine is initialized
  final widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  // Preserve splash until initialization is done
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);

  // Configure DI
  await configureDependencies();
  final authLocal = serviceLocator.get<AuthLocalDataSource>();
  String? token;
  try {
    token = authLocal.getToken();
  } catch (_) {
    token = null;
  }

  // Setup Bloc observer
  Bloc.observer = MyBlocObserver();

  // Remove splash once app is ready
  FlutterNativeSplash.remove();

  // Run the app
  runApp(EcommerceApp(isLoggedIn: token != null, appRouter: AppRouter()));
}
