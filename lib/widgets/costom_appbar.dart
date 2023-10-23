import 'package:flutter/material.dart';

PreferredSizeWidget? costomAppbar({
  Widget? leading,
  Widget? title,
  void Function()? onTap,
  List<Widget>? actions,
}) {
  return AppBar(
    elevation: 0,
    backgroundColor: Colors.white,
    centerTitle: true,
    automaticallyImplyLeading: false,
    leading: InkWell(
      onTap: onTap,
      child: leading ?? const Icon(
              Icons.arrow_back,
              color: Colors.black,
            ),
    ),
    title: title,
    actions: actions,
  );
}
