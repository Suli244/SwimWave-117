import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
    this.width = double.infinity,
    this.height = 60,
    this.padding = 14.0,
    required this.color,
    this.textColor = Colors.white,
    this.isNotFullColor,
    this.isFullFilled = true,
    this.radius = 15.0,
    this.isLoading = false,
    this.textStyle,
    this.text,
    required this.onPress,
    this.child,
    this.widthBorder,
    this.colorBorder,
  });

  final double? width;
  final double? widthBorder;
  final double height;
  final double padding;
  final Color color;
  final Color? colorBorder;
  final Color textColor;
  final Color? isNotFullColor;
  final bool isFullFilled;
  final double radius;
  final bool isLoading;
  final TextStyle? textStyle;
  final String? text;
  final Function() onPress;
  final Widget? child;

  @override
  Widget build(BuildContext context) {
    return CupertinoButton(
      padding: EdgeInsets.zero,
      onPressed: isLoading ? null : onPress,
      child: Container(
        alignment: Alignment.center,
        height: height,
        width: width,
        padding: EdgeInsets.all(padding),
        decoration: BoxDecoration(
          color: isFullFilled ? color : isNotFullColor,
          borderRadius: BorderRadius.circular(radius),
          border: Border.all(
            width: widthBorder ?? 1,
            color: colorBorder ?? color,
          ),
        ),
        child: Text(
          text!,
          textAlign: TextAlign.center,
          style: textStyle,
        ),
      ),
    );
  }
}
