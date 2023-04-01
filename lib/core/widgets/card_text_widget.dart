import 'package:flutter/material.dart';

// ignore: must_be_immutable
class CustomCardText extends StatelessWidget {
  CustomCardText({super.key, required this.text, this.overFlow = true});
  String text;
  bool? overFlow;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: Theme.of(context).textTheme.bodyMedium,
      overflow: overFlow! ? TextOverflow.ellipsis : null,
      maxLines: 3,
    );
  }
}
