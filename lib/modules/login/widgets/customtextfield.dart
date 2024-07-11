import 'package:basic/shared/routes/extensions/widget_extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TextFieldWidget extends StatelessWidget {
  final TextEditingController controller;
  final String labelText;
  final String? hintText;
  final bool? obscure;
  final double? height;
  final Color? backgroundColor;
  final Color? foregroundColor;
  final Color? labelColor;
  final OutlineInputBorder? border;
  final EdgeInsetsGeometry? padding;
  final EdgeInsetsGeometry? contentPadding;
  final Color? borderColor;
  final double? borderRadius;
  final double? borderWidth;
  final TextInputType? keyboardtype;
  final int? maxlines;
  final Icon? icon;
  final VoidCallback? onPressed;
  final bool? isDense;

  const TextFieldWidget({
    Key? key,
    required this.controller,
    required this.labelText,
    this.hintText,
    this.obscure,
    this.height,
    this.backgroundColor,
    this.foregroundColor,
    this.labelColor,
    this.border,
    this.padding,
    this.contentPadding,
    this.borderColor,
    this.borderWidth,
    this.borderRadius,
    this.keyboardtype,
    this.maxlines,
    this.icon,
    this.onPressed, this.isDense,
  }) : super(key: key);

  OutlineInputBorder copyWithBorder(){
    return OutlineInputBorder(
      borderSide: BorderSide(
        color: borderColor ?? Colors.grey[600]!,
        width: borderWidth ?? 3.0,
      ),
      borderRadius: BorderRadius.circular(borderRadius ?? 3.0),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height ?? 80.h,
      padding: padding ??  const EdgeInsets.all(8.0),
      child: TextField(
        controller: controller,
        keyboardType: keyboardtype,
        maxLines:  (obscure != null && obscure == true) ? 1: maxlines,
        obscureText: obscure ?? false,
        decoration: InputDecoration(
          isDense: isDense ?? false,
          labelText: labelText,
          hintText: hintText ?? '',
          labelStyle: TextStyle(
            color: labelColor ?? Colors.black,
          ),
          filled: true,
          fillColor: backgroundColor ?? Colors.white,
          border: copyWithBorder(),
          enabledBorder: copyWithBorder(),
          focusedBorder: copyWithBorder(),
          contentPadding: contentPadding ?? const EdgeInsets.symmetric(horizontal: 16.0),
          suffixIcon: icon?.click(onTap: onPressed!),
        ),
        style: TextStyle(color: foregroundColor ?? Colors.black),
    
      ),
      
    );
  }
}

