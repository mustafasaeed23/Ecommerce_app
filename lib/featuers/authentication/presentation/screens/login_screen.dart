import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/helpers/vaildations.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/featuers/authentication/data/models/login_request.dart';
import 'package:ecommerce/featuers/authentication/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/featuers/authentication/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/theme/assets.dart';
import '../../../../core/utils/dialogs.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final formKey = GlobalKey<FormState>();
  final authCubit = serviceLocator.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 30.0.w),
        child: Form(
          key: formKey,
          child: Column(
            // mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 60.h),
              Center(child: Image.asset(Assets.logo)),
              SizedBox(height: 50.h),
              Text(
                "Welcome Back",
                style: FontsStyle.bold.copyWith(
                  fontSize: 25.r,
                  color: Colors.white,
                ),
              ),
              // SizedBox(height: 10.h),
              Text(
                "Sign in to continue",
                style: FontsStyle.medium.copyWith(
                  fontSize: 15.r,
                  color: Colors.white,
                ),
              ),
              SizedBox(height: 50.h),
              CustomTextFormField(
                headerText: "E-mail Address",
                hintText: "enter your e-mail address",
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                validator: Vaildations.validateEmail,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                headerText: "Password",
                hintText: "enter your password",
                controller: passwordController,
                obscureText: true,
                keyboardType: TextInputType.visiblePassword,
                validator: Vaildations.validatePassword,
              ),
              SizedBox(height: 15.h),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "Forgot Password?",
                  style: FontsStyle.medium.copyWith(
                    color: AppColors.whiteColor,
                  ),
                ),
              ),
              SizedBox(height: 40.h),
              BlocListener<AuthCubit, AuthState>(
                bloc: authCubit,
                listener: (context, state) {
                  if (state is LoginLoading) {
                    Dialogs.showLoadingDialog(context);
                  } else if (state is LoginSuccess) {
                    Dialogs.hideLoadingDialog(context);
                    Dialogs.customToast(context, "Login Success");
                    Navigator.pushNamed(context, Routes.homeScreen);
                  } else if (state is LoginError) {
                    Dialogs.hideLoadingDialog(context);
                    Dialogs.showMessageDialog(state.message);
                  }
                },
                child: CustomButton(
                  onPressed: () {
                    if (formKey.currentState?.validate() == true) {
                      authCubit.login(
                        LoginRequest(
                          email: emailController.text,
                          password: passwordController.text,
                        ),
                      );
                      print("login");
                      Navigator.pushNamed(context, Routes.homeScreen);
                    }
                  },
                  buttonText: "Login",
                ),
              ),
              SizedBox(height: 25.h),
              Center(
                child: InkWell(
                  splashColor: Colors.transparent,
                  highlightColor: Colors.transparent,
                  focusColor: Colors.transparent,
                  onTap: () {
                    Navigator.pushNamed(context, Routes.registerScreen);
                  },
                  child: Text(
                    "Don't have an account? Sign Up",
                    style: FontsStyle.semiBold.copyWith(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
