import 'package:basic/modules/home/controller/home_controller.dart';
import 'package:basic/modules/home/widgets/customcategory.dart';
import 'package:basic/modules/login/widgets/customcircle.dart';
import 'package:basic/shared/routes/extensions/widget_extensions/widget_extension.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        primary: true,
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            children: [
              SizedBox(
                height: Get.height * 0.24,
                child: Stack(
                  children: [
                    const CustomCircle(
                      radius: 340,
                      filled: true,
                      top: -170,
                      right: -170,
                      colors: [
                        Color.fromARGB(255, 77, 255, 255),
                        Color.fromARGB(255, 180, 247, 247)
                      ],
                    ),
                    const CustomCircle(
                      radius: 250,
                      filled: true,
                      top: -125,
                      right: -125,
                      colors: [
                        Color.fromARGB(255, 98, 34, 166),
                        Color.fromARGB(255, 121, 87, 156)
                      ],
                    ),
                    const CustomCircle(
                      radius: 160,
                      filled: true,
                      top: -80,
                      right: -80,
                      colors: [
                        Color.fromARGB(255, 2, 82, 91),
                        Color.fromARGB(255, 48, 106, 112),
                      ],
                    ),
                    Positioned(
                      top: 70,
                      left: 20,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width / 2,
                        child: const Text(
                          "Let's set the schedule easily",
                          style: TextStyle(
                            color: Color(0xFF1E293B),
                            fontSize: 24,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.30,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              startingText('Select Date'),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 5, 0, 8),
                child: GetBuilder<HomeController>(builder: (_) {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      controller.button(1, '22', 'Fr'),
                      controller.button(2, '23', 'Sa'),
                      controller.button(3, '24', 'Su'),
                      controller.button(4, 'Other', 'Date'),
                    ],
                  );
                }),
              ),
              SizedBox(height: 12.0.h),
              GetBuilder<HomeController>(builder: (_) {
                return Column(
                  children: [
                    startingText('Select Time'),
                    Container(
                      height: 100.h,
                      decoration: const BoxDecoration(
                        color: Color(0xFFF1F5F9),
                        borderRadius: BorderRadius.all(Radius.circular(8)),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'From',
                                  style: TextStyle(
                                    color: Color(0xFF94A3B8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height:
                                        1.5, // Adjusted for better vertical alignment
                                    letterSpacing: 0.30,
                                  ),
                                ),
                                const SizedBox(
                                    height:
                                        5), // Added spacing between the texts
                                Text(
                                  controller.showTime(controller.start),
                                  style: const TextStyle(
                                    color: Color(0xFF1E293B),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    height:
                                        1.5, // Adjusted for better vertical alignment
                                    letterSpacing: 0.30,
                                  ),
                                ).click(
                                  onTap: () {
                                    controller.selectTime(
                                        context, controller.start, true);
                                  },
                                )
                              ],
                            ),
                            const Icon(Icons.arrow_forward,
                                color: Colors.black),
                            Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const Text(
                                  'To',
                                  style: TextStyle(
                                    color: Color(0xFF94A3B8),
                                    fontSize: 12,
                                    fontWeight: FontWeight.w500,
                                    height: 1.5,
                                    letterSpacing: 0.30,
                                  ),
                                ),
                                const SizedBox(height: 5),
                                Text(
                                  controller.showTime(controller.end),
                                  style: const TextStyle(
                                    color: Color(0xFF1E293B),
                                    fontSize: 24,
                                    fontWeight: FontWeight.w800,
                                    height: 1.5,
                                    letterSpacing: 0.30,
                                  ),
                                ).click(
                                  onTap: () {
                                    controller.selectTime(
                                        context, controller.end, false);
                                  },
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                );
              }),
              SizedBox(height: 12.0.h),
              startingText('Category'),
              Row(
                children: [
                  Expanded(
                    child: GetBuilder<HomeController>(
                      builder: (controller) {
                        return Wrap(
                          spacing: 12.0,
                          runSpacing: 9.0,
                          children: [
                            ...controller.categories.map((category) {
                              return CustomCategory(category: category);
                            }),
                            SizedBox(
                              height: 20,
                              width: 20,
                              child: const Icon(
                                Icons.add_circle_outline_sharp,
                                color: Colors.blue,
                              ).click(
                                onTap: () {
                                  controller.showAddCategoryDialog(context);
                                },
                              ),
                            ),
                          ],
                        );
                      },
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8.0),
              startingText("Note"),
              Container(
                height: 80.h,
                decoration: BoxDecoration(
                  color: const Color(0xFFF1F5F9),
                  borderRadius: BorderRadius.circular(8),
                ),
                child: const Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: TextField(
                    decoration: InputDecoration(
                      hintText: 'Enter your text here',
                      border: InputBorder.none,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20.0.h),
              Container(
                width: 327,
                height: 56,
                decoration: ShapeDecoration(
                  gradient: const LinearGradient(
                      begin: Alignment(-1.00, 0.00),
                      end: Alignment(1, 0),
                      colors: [
                        Color.fromARGB(255, 54, 108, 113),
                        Color.fromARGB(255, 2, 82, 91),
                      ]),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(29),
                  ),
                ),
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.transparent,
                  ),
                  child: const Center(
                    child: Text('Save',
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w400,
                            fontSize: 22)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Row startingText(String text) {
    return Row(
      children: [
        Text(text,
            style: const TextStyle(
              color: Color(0xFF1E293B),
              fontSize: 18,
              fontWeight: FontWeight.w500,
            )),
      ],
    );
  }
}
