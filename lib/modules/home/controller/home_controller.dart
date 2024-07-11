import 'package:basic/modules/home/class/category.dart';
import 'package:basic/modules/home/widgets/categoryselector.dart';
import 'package:basic/modules/home/widgets/custombutton.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  int val = 0;
  List<Category> categories = [
    Category(name: 'Meeting', color: Colors.yellow[700]!),
    Category(name: 'Hangout', color: Colors.green),
    Category(name: 'Cooking', color: Colors.red),
    Category(name: 'Weekend', color: Colors.grey[700]!),
    Category(name: 'Work', color: Colors.purpleAccent),
  ];
  TimeOfDay start = TimeOfDay.now();
  TimeOfDay end = TimeOfDay(
    hour: (TimeOfDay.now().hour + 1) % 24,
    minute: TimeOfDay.now().minute,
  );

  void updateval(int i) {
    if (val != i) {
      val = i;
    } else {
      val = 0;
    }
    update();
  }

  void addCategory(Category category) {
    categories.add(category);
    print(categories.length);
    update();
  }

  void removeCategory(Category category) {
    print('Before removal: ${categories.map((cat) => cat.name).toList()}');
    categories.removeWhere((cat) => cat == category);
    print('After removal: ${categories.map((cat) => cat.name).toList()}');
    print('Removed category: ${category.name}');
    update();
  }


  CustomButton button(int i, String text, String subtext) {
    return (i != val)
        ? CustomButton(
            onPressed: () {
              updateval(i);
            },
            text: text,
            subText: subtext,
          )
        : CustomButton(
            onPressed: () {
              updateval(i);
            },
            color: const Color.fromARGB(255, 98, 34, 166),
            textColor: Colors.white,
            text: text,
            subText: subtext,
          );
  }

  String showTime(TimeOfDay time) {
    return "${time.hour.toString().padLeft(2, '0')}:${time.minute.toString().padLeft(2, '0')}";
  }

  Future<void> selectTime(
      BuildContext context, TimeOfDay time, bool starting) async {
    final TimeOfDay? picked = await showTimePicker(
      context: context,
      initialTime: time,
      builder: (BuildContext context, Widget? child) {
        return MediaQuery(
          data: MediaQuery.of(context).copyWith(alwaysUse24HourFormat: true),
          child: Theme(
            data: Theme.of(context).copyWith(
              colorScheme: const ColorScheme.light(
                primary: Color.fromARGB(255, 48, 106, 112),
                onPrimary: Colors.white,
                onSurface: Colors.black,
              ),
              textButtonTheme: TextButtonThemeData(
                style: TextButton.styleFrom(
                  foregroundColor: const Color.fromARGB(255, 98, 34, 166),
                ),
              ),
            ),
            child: child!,
          ),
        );
      },
    );
    if (picked != null && picked != time) {
      if (starting && picked.hour <= end.hour && picked.minute <= end.minute) {
        start = picked;
        update();
      } else if (!starting &&
          picked.hour >= start.hour &&
          picked.minute >= start.minute) {
        end = picked;
        update();
      }
    }
  }

  void showAddCategoryDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (BuildContext context) =>  CategorySelector(),
    );
  }
}
