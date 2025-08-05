import 'package:ecommerce/core/constants/fonts_style.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constants/assets.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.mainColor,
      resizeToAvoidBottomInset: false,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 30.0.w),
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
              validator: (value) {
                return;
              },
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              headerText: "Password",
              hintText: "enter your password",
              controller: passwordController,
              obscureText: true,
              keyboardType: TextInputType.visiblePassword,
              validator: (value) {
                return;
              },
            ),
            SizedBox(height: 15.h),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Forgot Password?",
                style: FontsStyle.medium.copyWith(color: AppColors.whiteColor),
              ),
            ),
            SizedBox(height: 40.h),
            CustomButton(onPressed: () {}, buttonText: "Login"),
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
    );
  }
}
