import 'package:ecommerce/core/theme/fonts_style.dart';
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
    this.borderColor,
    this.textColor,
    this.readOnly,
    this.suffixIcon,
    this.headerTextColor,
    this.fontSize
  });

  final String headerText;
  final String hintText;
  final TextEditingController controller;
  final TextInputType keyboardType;
  final String? Function(String?) validator;
  final bool obscureText;
  final Function(String)? onChanged;
  final Color? borderColor;
  final Color? textColor;
  final Color? headerTextColor;
  final double? fontSize;
  final bool? readOnly;
  final Widget? suffixIcon;

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
          style: FontsStyle.semiBold.copyWith(
            color: widget.headerTextColor ?? AppColors.whiteColor,
            fontSize: widget.fontSize,
          ),
        ),
        SizedBox(height: 10.h),
        SizedBox(
          height: 52.h,
          width: double.infinity,
          child: TextFormField(
            readOnly: widget.readOnly ?? false,
            controller: widget.controller,
            keyboardType: widget.keyboardType,
            validator: widget.validator,
            obscureText: isObscured,
            onChanged: widget.onChanged,
            decoration: InputDecoration(
              filled: true,
              fillColor: AppColors.whiteColor,
              hintText: widget.hintText,
              hintStyle: FontsStyle.light.copyWith(
                color: widget.textColor ?? Colors.grey,
              ),
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
                  : widget.suffixIcon,
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: BorderSide(
                  color: widget.borderColor ?? Colors.transparent,
                ),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.red),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15.r),
                borderSide: const BorderSide(color: Colors.red),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
