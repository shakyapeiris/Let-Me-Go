import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Widget child;
  final Color? backgroundColor;
  const Button({
    Key? key,
    required this.onPressed,
    required this.padding,
    required this.margin,
    required this.child,
    required this.backgroundColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        alignment: Alignment.center,
        height: 50.0,
        width: 300.0,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(50.0),
          color: backgroundColor,
        ),
        padding: padding,
        margin: margin,
        child: child,
      ),
    );
  }
}
