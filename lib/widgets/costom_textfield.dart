import 'package:ecommace/statics/all_colors.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostomTextField extends StatefulWidget {
  bool? obscureText;
  void Function(String)? onChanged;
  String? hintText;
  Widget? suffixIcon;
  Widget? prefixIcon;
  String? Function(String?)? validator;
  TextEditingController? controller;
  CostomTextField({
    super.key,
    this.obscureText,
    this.onChanged,
    required this.hintText,
    this.suffixIcon,
    this.prefixIcon,
    this.validator,
    this.controller,
  });

  @override
  State<CostomTextField> createState() => _CostomTextFieldState();
}

class _CostomTextFieldState extends State<CostomTextField> {
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: widget.controller,
      validator: widget.validator,
      obscureText: widget.obscureText ?? false,
      onChanged: widget.onChanged,
      decoration: InputDecoration(
        suffixIcon: widget.suffixIcon,
        prefixIcon: widget.prefixIcon,
        hintText: widget.hintText,
        hintStyle: const TextStyle(
          color: Colors.black,
        ),
        fillColor: AllColors.primarycolor.withOpacity(.1),
        filled: true,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AllColors.primarycolor,
            width: 0,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(
            color: AllColors.primarycolor,
            width: 2,
          ),
        ),
      ),
    );
  }
}
