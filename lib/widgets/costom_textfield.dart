import 'package:ecommace/statics/all_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostomTextField extends StatelessWidget {
  bool? obscureText;
  void Function(String)? onChanged;
  String? hintText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  CostomTextField({
    super.key,
    this.obscureText,
    this.onChanged,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: obscureText ?? false,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: TextStyle(color: AllColors.blackColor),
        fillColor: AllColors.primarycolor.withOpacity(.1),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AllColors.primarycolor, width: 0),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide(color: AllColors.primarycolor, width: 2),
        ),
      ),
    );
  }
}
