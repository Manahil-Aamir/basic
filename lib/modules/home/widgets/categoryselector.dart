import 'package:basic/modules/home/class/category.dart';
import 'package:basic/modules/home/controller/home_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';

class CategorySelector extends StatefulWidget {
  const CategorySelector({Key? key}) : super(key: key);

  @override
  State<CategorySelector> createState() => _CategorySelectorState();
}

class _CategorySelectorState extends State<CategorySelector> {
   
  TextEditingController nameController = TextEditingController();
  Color selectedColor = const Color.fromARGB(255, 77, 255, 255);
    
  Widget build(BuildContext context) {
 return    AlertDialog(
          title: const Text("Add Category",
              style: TextStyle(
                  color: Color.fromARGB(255, 2, 82, 91),
                  fontWeight: FontWeight.w500)),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              TextField(
                controller: nameController,
                decoration: const InputDecoration(
                    labelText: "Category Name",
                    labelStyle: TextStyle(
                      color: Color.fromARGB(255, 48, 106, 112),
                    )),
              ),
              const SizedBox(height: 20),
              // You can use a package like flutter_colorpicker for color picking
              GestureDetector(
                onTap: () async {
                  Color? pickedColor = await showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text("Pick a color",
                            style: TextStyle(
                                color: Color.fromARGB(255, 2, 82, 91),
                                fontWeight: FontWeight.w400)),
                        content: SingleChildScrollView(
                          child: ColorPicker(
                            pickerColor: selectedColor,
                            onColorChanged: (Color color) {
                              selectedColor = color;
                            },
                          ),
                        ),
                        actions: <Widget>[
                          ElevatedButton(
                            child: const Text("Select",
                                style: TextStyle(
                                    color: Color.fromARGB(255, 98, 34, 166))),
                            onPressed: () {
                              Navigator.of(context).pop(selectedColor);
                            },
                          ),
                        ],
                      );
                    },
                  );

                  if (pickedColor != null) {
                    selectedColor = pickedColor;
                  }
                },
                child: Container(
                  width: 100,
                  height: 50,
                  color: selectedColor,
                  child: const Center(child: Text("Pick Color")),
                ),
              ),
            ],
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text("Cancel",
                  style: TextStyle(color: Color.fromARGB(255, 98, 34, 166))),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty) {
                  Category newCategory = Category(
                    name: nameController.text,
                    color: selectedColor,
                  );
                  Get.find<HomeController>().addCategory(newCategory);
                  Navigator.of(context).pop();
                }
              },
              child: const Text(
                "Add",
                style: TextStyle(color: Color.fromARGB(255, 98, 34, 166)),
              ),
            ),
          ],
      );
      
    
  }
  

}