import 'package:basic/modules/home/class/category.dart';
import 'package:basic/shared/routes/extensions/widget_extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:basic/modules/home/controller/home_controller.dart';
import 'package:get/get.dart';

// ignore: must_be_immutable


class CustomCategory extends StatelessWidget {
  final Category category;
  final HomeController controller = Get.put(HomeController());

  CustomCategory({
    Key? key,
    required this.category,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 20.0.h,
      decoration: BoxDecoration(
        color: category.color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min, // Ensure row takes minimum space necessary
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(12, 0, 0, 0),
            child: Row(
              children: [
                CircleAvatar(
                  backgroundColor: category.color,
                  radius: 7.0,
                ),
                const SizedBox(width: 8.0),
                Text(
                  category.name,
                  style: const TextStyle(fontWeight: FontWeight.w800),
                ),
                 Icon(Icons.cancel_outlined, size: 15.0).click(onTap:(){ controller.removeCategory(category);}),
              ],
            ),
          ),
         
        ],
      ),
    );
  }
}