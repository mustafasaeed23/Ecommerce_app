import 'package:ecommerce/core/di/service_locator.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:ecommerce/core/theme/fonts_style.dart';
import 'package:ecommerce/core/widgets/custom_text_form_field.dart';
import 'package:ecommerce/core/widgets/loading_widget.dart';
import 'package:ecommerce/featuers/address/presentation/cubit/address_cubit.dart';
import 'package:ecommerce/featuers/address/presentation/cubit/address_state.dart';
import 'package:ecommerce/featuers/authentication/domain/entities/user_entity.dart';
import 'package:ecommerce/featuers/profile/cubit/profile_cubit.dart';
import 'package:ecommerce/featuers/profile/cubit/profile_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ProfileTab extends StatelessWidget {
  const ProfileTab({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
              serviceLocator.get<ProfileCubit>()..loadProfile(),
        ),
        BlocProvider(
          create: (context) =>
              serviceLocator.get<AddressCubit>()..getUserAddress(),
        ),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, state) {
          if (state is ProfileLoading || state is ProfileInitial) {
            LoadingWidget();
          } else if (state is ProfileError) {
            return Center(child: Text(state.message));
          } else if (state is ProfileLoaded) {
            var user = state.user;
            return SafeArea(
              top: true,
              child: SingleChildScrollView(
                padding: EdgeInsets.symmetric(horizontal: 15.w, vertical: 10.h),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Welcome,${user.name}",
                      style: FontsStyle.bold.copyWith(
                        fontSize: 18,
                        color: AppColors.mainColor,
                      ),
                    ),
                    SizedBox(height: 5.h),
                    Text(
                      user.email,
                      style: FontsStyle.medium.copyWith(
                        fontSize: 18,
                        color: AppColors.mainColor,
                      ),
                    ),
                    SizedBox(height: 20.h),

                    CustomTextFormField(
                      headerText: "Full Name",
                      headerTextColor: AppColors.mainColor,
                      fontSize: 18.r,
                      hintText: user.name,
                      textColor: AppColors.mainColor,
                      borderColor: AppColors.mainColor.withOpacity(0.3),
                      controller: TextEditingController(),
                      suffixIcon: Icon(
                        Icons.mode_edit_outline_outlined,
                        color: AppColors.mainColor,
                      ),
                      keyboardType: TextInputType.name,
                      validator: (_) => null,
                    ),
                    SizedBox(height: 15.h),

                    CustomTextFormField(
                      headerText: "Your E-mail",
                      headerTextColor: AppColors.mainColor,
                      fontSize: 18.r,
                      hintText: user.email,
                      textColor: AppColors.mainColor,
                      borderColor: AppColors.mainColor.withOpacity(0.3),
                      controller: TextEditingController(),
                      suffixIcon: Icon(
                        Icons.mode_edit_outline_outlined,
                        color: AppColors.mainColor,
                      ),
                      keyboardType: TextInputType.emailAddress,
                      validator: (_) => null,
                    ),
                    SizedBox(height: 15.h),

                    CustomTextFormField(
                      headerText: "Mobile Number",
                      headerTextColor: AppColors.mainColor,
                      fontSize: 18.r,
                      hintText: "0120 000 0000",
                      textColor: AppColors.mainColor,
                      borderColor: AppColors.mainColor.withOpacity(0.3),
                      controller: TextEditingController(),
                      suffixIcon: Icon(
                        Icons.mode_edit_outline_outlined,
                        color: AppColors.mainColor,
                      ),
                      keyboardType: TextInputType.phone,
                      validator: (_) => null,
                    ),
                    SizedBox(height: 15.h),

                    BlocConsumer<AddressCubit, AddressState>(
                      listener: (context, state) {
                        if (state is AddressFailure) {}
                      },
                      builder: (context, state) {
                        String? addressText;
                        if (state is AddressSuccess &&
                            state.address.isNotEmpty) {
                          addressText = state.address.last.city;
                        }
                        return CustomTextFormField(
                          headerText: "Your Address",
                          headerTextColor: AppColors.mainColor,
                          fontSize: 18.r,
                          hintText: addressText ?? "No Address",
                          textColor: AppColors.mainColor,
                          borderColor: AppColors.mainColor.withOpacity(0.3),
                          controller: TextEditingController(),
                          suffixIcon: Icon(
                            Icons.mode_edit_outline_outlined,
                            color: AppColors.mainColor,
                          ),
                          keyboardType: TextInputType.streetAddress,
                          validator: (_) => null,
                        );
                      },
                    ),
                  ],
                ),
              ),
            );
          }
          return SizedBox();
        },
      ),
    );
  }
}
