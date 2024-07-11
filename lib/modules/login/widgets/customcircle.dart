import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomCircle extends StatelessWidget {
  final double? top;
  final double? left;
  final double? bottom;
  final double? right;
  final double radius;
  final List<Color>? colors;
  final bool filled;
  final Color? borderColor;
  final double? borderWidth;

  const CustomCircle({
    super.key,
    this.top,
    this.left,
    this.bottom,
    this.right,
    required this.radius,
    this.colors,
    required this.filled,
    this.borderColor,
    this.borderWidth,
  });

  @override
  Widget build(BuildContext context) {
    return Positioned(
      top: top,
      left: left,
      bottom: bottom,
      right: right,
      child: Container(
        width: radius.w,
        height: radius.h,
        decoration: filled
            ? BoxDecoration(
                gradient: LinearGradient(
                  colors: colors ??
                      const [
                        Color.fromARGB(255, 77, 255, 255),
                        Color.fromARGB(255, 2, 82, 91),
                      ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                ),
                shape: BoxShape.circle,
              )
            : BoxDecoration(
                border: Border.all(
                  color: borderColor ?? const Color.fromARGB(255, 2, 82, 91),
                  width: borderWidth ?? 2.0.w,
                ),
                shape: BoxShape.circle,
              ),
      ),
    );
  }
}
