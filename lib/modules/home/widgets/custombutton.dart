import 'package:basic/shared/routes/extensions/widget_extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  
  final String text;
  final String subText;
  final Color? color;
  final Color? textColor;
  final VoidCallback onPressed;

  const CustomButton({super.key, 
    required this.text,
    required this.subText,
    this.color,
    this.textColor,
    required this.onPressed,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 120.h,
      width: 74.w,
      decoration: BoxDecoration(
        color: color ?? const Color(0xFFF1F5F9),
        borderRadius: const BorderRadius.all(Radius.circular(8)),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            text ?? 'Other',
            style: TextStyle(
              color: textColor ?? Colors.grey[800],
              fontWeight: FontWeight.w600,
              fontSize: 20.sp,
            ),
          ),
          SizedBox(height: 4.h),
          Text(
            subText ?? 'Date',
            style: TextStyle(
              color: textColor ?? Colors.grey[800],
              fontSize: 14.sp,
            ),
          ),
        ],
      ),
    ).click(onTap: onPressed);
  }
}
