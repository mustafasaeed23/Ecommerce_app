import 'package:ecommerce/core/constants/assets.dart';
import 'package:ecommerce/core/constants/fonts_style.dart';
import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/helpers/vaildations.dart';
import 'package:ecommerce/core/routes/routes.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/widgets/custom_button.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/featuers/authentication/data/models/register_request.dart';
import 'package:ecommerce/featuers/authentication/presentation/cubit/auth_cubit.dart';
import 'package:ecommerce/featuers/authentication/presentation/cubit/auth_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/utils/dialogs.dart';

class RegisterScreen extends StatelessWidget {
  RegisterScreen({super.key});
  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final formKey = GlobalKey<FormState>();
  final authCubit = serviceLocator.get<AuthCubit>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.mainColor,
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 20.0.h, vertical: 30.0.w),
        child: Form(
          key: formKey,
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
                validator: Vaildations.validateName,
              ),
              SizedBox(height: 20.h),
              CustomTextFormField(
                headerText: "Mobile Number",
                hintText: "enter your mobile number",
                controller: mobileNumberController,
                keyboardType: TextInputType.phone,
                validator: Vaildations.validateMobileNumber,
              ),

              SizedBox(height: 20.h),
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
              BlocListener<AuthCubit, AuthState>(
                bloc: authCubit,
                listener: (_, state) {
                  if (state is RegisterLoading) {
                    Dialogs.showLoadingDialog(context);
                  } else if (state is RegisterSuccess) {
                    Dialogs.hideLoadingDialog(context);
                    Dialogs.customToast(context, "Register Success");
                    Navigator.pushNamed(context, Routes.homeScreen);
                  } else if (state is RegisterError) {
                    Dialogs.hideLoadingDialog(context);
                    Dialogs.showMessageDialog(state.message);
                  }
                },
                child: CustomButton(
                  onPressed: () {
                    if (formKey.currentState!.validate() == true) {
                      authCubit.register(
                        RegisterRequest(
                          fullName: fullNameController.text,
                          email: emailController.text,
                          password: passwordController.text,
                          mobileNumber: mobileNumberController.text,
                        ),
                      );
                      print("register");
                      // Navigator.pushNamed(context, Routes.homeScreen);
                    }
                  },
                  buttonText: "Sign Up",
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
