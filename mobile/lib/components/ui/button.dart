import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final void Function()? onPressed;
  final EdgeInsetsGeometry padding;
  final EdgeInsetsGeometry margin;
  final Widget child;
  const Button({
    Key? key,
    required this.onPressed,
    required this.padding,
    required this.margin,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onPressed,
        child: Container(
          padding: padding,
          margin: margin,
          child: child,
        ),
      ),
    );
  }
}
