import 'package:ecommerce/core/constants/assets.dart';
import 'package:ecommerce/core/constants/fonts_style.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 30.0.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(height: 20.h),
            Center(child: Image.asset(Assets.logo)),
            SizedBox(height: 50.h),
            CustomTextFormField(
              headerText: "Full Name",
              hintText: "enter your full name",
              controller: fullNameController,
              keyboardType: TextInputType.name,
              validator: (value) {
                return;
              },
            ),
            SizedBox(height: 20.h),
            CustomTextFormField(
              headerText: "Mobile Number",
              hintText: "enter your mobile number",
              controller: mobileNumberController,
              keyboardType: TextInputType.phone,
              validator: (value) {
                return;
              },
            ),

            SizedBox(height: 20.h),
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
            SizedBox(height: 30.h),
            InkWell(
              hoverColor: Colors.transparent,
              focusColor: Colors.transparent,
              splashColor: Colors.transparent,
              onTap: () {
                Navigator.pushNamed(context, Routes.loginScreen);
              },
              child: Text(
                "Already have an account? Login",
                style: FontsStyle.semiBold.copyWith(color: Colors.white),
              ),
            ),
            SizedBox(height: 30.h),
            CustomButton(onPressed: () {}, buttonText: "Sign Up"),
          ],
        ),
      ),
    );
  }
}
