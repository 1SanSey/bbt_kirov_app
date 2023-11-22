import 'package:bbt_kirov_app/common/theme/app_colors.dart';
import 'package:flutter/material.dart';

class AuthTextField extends StatelessWidget {
  final TextEditingController controller;
  final FocusNode focusNode;
  final String labelText;
  final bool obscureText;
  const AuthTextField(
      {super.key,
      required this.controller,
      required this.focusNode,
      required this.labelText,
      this.obscureText = false});

  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: AppColors.primaryColorLight,
      controller: controller,
      focusNode: focusNode,
      keyboardType: TextInputType.text,
      textCapitalization: TextCapitalization.none,
      autocorrect: false,
      obscureText: obscureText,
      textInputAction: TextInputAction.search,
      decoration: InputDecoration(
        filled: true,
        labelText: labelText,
        labelStyle: const TextStyle(color: AppColors.primaryColorLight),
        fillColor: AppColors.greyColor,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.greyColor,
            width: 1.0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: const BorderSide(
            color: AppColors.primaryColorLight,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
