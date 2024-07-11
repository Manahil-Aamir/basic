import 'package:basic/shared/routes/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get_navigation/src/root/get_material_app.dart';


class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(390, 844),
      minTextAdapt: true,
      splitScreenMode: true,
      useInheritedMediaQuery: true,
      rebuildFactor: (old, data) => true,
      builder: (context, widget) {
        return GetMaterialApp(
                title: "",
                useInheritedMediaQuery: true,
                debugShowCheckedModeBanner: false,
               
                builder: (context, widget) {
                  widget ??= const Center(
                    child: Text('App Widget is null'),
                  );
                  return MediaQuery(
                    data: MediaQuery.of(context)
                        .copyWith(textScaler: const TextScaler.linear(1.0)),
                    child: widget,
                  );
                },
      
                
                initialRoute: Routes.login,
                getPages: Pages.allPages,
              );
            }
  );
  }
}
