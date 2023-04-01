import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget with PreferredSizeWidget {
  Widget? leading;
  String? title;
  bool centerTitle;
  List<Widget>? actions;
  Color backgroundColor;
  bool titleStyle;
  TextStyle? textFonts;
  CustomAppBar(
      {super.key,
      this.titleStyle = false,
      this.actions,
      this.centerTitle = false,
      this.leading,
      this.title,
      this.backgroundColor = Colors.transparent,
      this.textFonts});
  @override
  Widget build(BuildContext context) {
    return AppBar(
      leading: leading,
      backgroundColor: backgroundColor,
      elevation: 0,
      title: Text(title ?? '',
          style: titleStyle
              ? Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.white)
              : Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: Colors.black)),
      centerTitle: centerTitle,
      actions: actions,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(60);
}
