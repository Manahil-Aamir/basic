import 'package:flutter/material.dart';

extension WidgetExtension on Widget{
  Widget click( {required Function()? onTap}){
    return InkWell(
      highlightColor: Colors.transparent,
      splashColor: Colors.transparent,
      onTap: onTap,
      child: this,
    );
  }
}