import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CostomButton extends StatelessWidget {
  Widget? child;
  Color? color;
  void Function()? onTap;
  CostomButton({
    super.key,
    required this.child,
    this.onTap,
    this.color,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: SizedBox(
        height: 50,
        width: MediaQuery.of(context).size.width,
        child: Card(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10.0),
          ),
          color: color,
          child: Center(
            child: child,
          ),
        ),
      ),
    );
  }
}
