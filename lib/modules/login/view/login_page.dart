import 'package:basic/modules/login/controller/login_controller.dart';
import 'package:basic/modules/login/widgets/customcircle.dart';
import 'package:basic/modules/login/widgets/customtextfield.dart';
import 'package:basic/shared/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class LoginPage extends GetView<LoginController> {


  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: GestureDetector(
        onTap: () {
          FocusManager.instance.primaryFocus?.unfocus();
        },
        child: SingleChildScrollView(
          primary: true,
          child: SizedBox(
            height: Get.height,
            child: Stack(
              children: [
                const CustomCircle(
                    radius: 320, filled: true, top: -60, left: -60),
                const CustomCircle(
                    radius: 270, filled: false, top: -60, left: 23),
                const CustomCircle(radius: 80, filled: true, top: 30),
                const CustomCircle(
                    radius: 50, filled: true, top: 150, left: 40),
                const Positioned(
                    left: 100,
                    top: 85,
                    child: Text('LOGIN',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 30,
                          color: Colors.white,
                        ))),
                GetBuilder<LoginController>(
                  builder: (_) {
                    return Center(
                      child: Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15.h, horizontal: 5.w),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            TextFieldWidget(
                                controller: controller.usernameController,
                                labelText: 'Username',
                                hintText: 'Sara',
                                labelColor: const Color.fromARGB(255, 2, 82, 91),
                                foregroundColor:
                                    const Color.fromARGB(255, 2, 82, 91),
                                height: 60.h,
                                contentPadding:
                                    const EdgeInsets.fromLTRB(8.0, 3.0, 0, 3.0),
                                borderColor: const Color.fromARGB(255, 2, 82, 91),
                                borderWidth: 2),
                            TextFieldWidget(
                              controller: controller.passwordController,
                              labelText: 'Password',
                              obscure: controller.pwobscure,
                              labelColor: const Color.fromARGB(255, 2, 82, 91),
                              foregroundColor: const Color.fromARGB(255, 2, 82, 91),
                              height: 60.h,
                              contentPadding:
                                  const EdgeInsets.fromLTRB(8.0, 3.0, 0, 3.0),
                              borderColor: const Color.fromARGB(255, 2, 82, 91),
                              borderWidth: 2,
                              icon: const Icon(Icons.remove_red_eye_outlined),
                              onPressed: () {
                                controller.toggle();
                              },
                            ),
                            20.verticalSpace,
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Forget Password?',
                                style: TextStyle(
                                  color: Color.fromARGB(255, 2, 82, 91),
                                ),
                              ),
                            ),
                            20.verticalSpace,
                            ElevatedButton(
                              onPressed: () {
                                Get.toNamed(Routes.home);
                              },
                              style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(255, 2, 82, 91),
                                padding: const EdgeInsets.symmetric(
                                    vertical: 12, horizontal: 24),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              child: const Text(
                                'LOGIN',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
                  }
                ),
                const CustomCircle(
                    radius: 270, filled: false, bottom: -40, right: -40),
                const CustomCircle(
                  radius: 225,
                  filled: false,
                  bottom: -40,
                  right: -40,
                  borderColor: Color.fromARGB(255, 77, 255, 255),
                ),
                const CustomCircle(
                    radius: 180, filled: false, bottom: -40, right: -40),
                const CustomCircle(
                  radius: 135,
                  filled: false,
                  bottom: -40,
                  right: -40,
                  borderColor: Color.fromARGB(255, 77, 255, 255),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
