import 'package:flutter/material.dart';

class CustomAppBar extends AppBar {
  CustomAppBar({
    super.key,
    Function()? onBack,
    String? title = 'Students Employment Services',
    super.actions,
    super.bottom,
    leading,
  }) : super(
          elevation: 0,
          leading: onBack != null
              ? Center(
                  child: IconButton(
                    icon: const Icon(Icons.arrow_back_rounded),
                    onPressed: onBack,
                    iconSize: 24,
                  ),
                )
              : leading,
          centerTitle: true,
          title: Text(title!),
        );
}
