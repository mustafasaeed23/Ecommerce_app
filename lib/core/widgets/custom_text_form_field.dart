import 'package:ecommerce/core/constants/fonts_style.dart';
import 'package:ecommerce/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormField extends StatefulWidget {
  const CustomTextFormField({
    super.key,
    required this.headerText,
    required this.hintText,
    required this.controller,
    required this.keyboardType,
    required this.validator,
    this.obscureText = false,
    this.onChanged,
  });

  final String headerText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final bool obscureText;
  final Function(String)? onChanged;

  @override
  State<CustomTextFormField> createState() => _CustomTextFormFieldState();
}

class _CustomTextFormFieldState extends State<CustomTextFormField> {
  late bool isObscured;

  @override
  void initState() {
    super.initState();
    isObscured = widget.obscureText;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.headerText,
          style: FontsStyle.semiBold.copyWith(color: AppColors.whiteColor),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 52.h,
          width: double.infinity,
          child: TextFormField(
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            obscureText: isObscured,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              hintText: widget.hintText,
              hintStyle: FontsStyle.light.copyWith(color: Colors.grey),
              contentPadding: const EdgeInsets.symmetric(
                horizontal: 20,
                vertical: 15,
              ),
              suffixIcon: widget.obscureText
                  ? IconButton(
                      icon: Icon(
                        isObscured ? Icons.visibility_off : Icons.visibility,
                        color: Colors.grey,
                      ),
                      onPressed: () => setState(() => isObscured = !isObscured),
                    )
                  : null,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: BorderSide.none,
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
