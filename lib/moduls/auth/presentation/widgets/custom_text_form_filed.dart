import 'package:coder/core/constansts/context_extensions.dart';
import 'package:coder/core/theme/app_Theme.dart';
import 'package:coder/core/theme/app_colors.dart';
import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final Color? fillColor;
  final double? height;
  final double? width;
  final String? hintText;
  final String? labelText;
  final TextEditingController? controller;
  final Widget? suffix;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final String? errorMessage;
  final TextStyle? hintStyle;
  final bool obscureText;

  CustomTextField({
    this.fillColor,
    this.height,
    this.width,
    this.hintText,
    this.labelText,
    this.controller,
    this.suffix,
    this.keyboardType,
    this.validator,
    this.errorMessage,
    required this.hintStyle,
    required this.obscureText,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      child: Padding(
        padding: EdgeInsets.only(bottom: context.propHeight(30)), // Adjust the padding as needed
        child: TextFormField(
          keyboardType: keyboardType,
          controller: controller,
          validator: validator,
          obscureText: obscureText,
          style: AppTheme().theme.textTheme.labelMedium?.copyWith(
            color: AppColors.primaryTextColor,
            fontSize: context.propHeight(40),
            fontFamily:  'Poppins',
            fontWeight: FontWeight.w500
          ),
          decoration: InputDecoration(
            errorStyle: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Colors.red,
            ),
            fillColor: fillColor,
            filled: true,
            hintText: hintText,
            hintStyle: hintStyle,
            labelText: labelText,
            suffixIcon: suffix,
            errorBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
              borderSide: BorderSide(color: Colors.red, width: 1.0),
            ),
            border: UnderlineInputBorder(
              borderRadius: BorderRadius.circular(10.0),
            ),
          ),
        ),
      ),
    );
  }
}
