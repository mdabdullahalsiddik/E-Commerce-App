import 'package:flutter/material.dart';

PreferredSizeWidget? costomAppbar({
  Widget? leading,
  Widget? title,
  void Function()? onTap,
  List<Widget>? actions,
  Color? color,
  required BuildContext context,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: color ?? Colors.white,
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: InkWell(
      onTap: onTap ??
          () {
            Navigator.pop(context);
          },
      child: leading ??
          const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
    ),
    title: title,
    actions: actions,
  );
}
