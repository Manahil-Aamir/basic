import 'package:basic/modules/home/bindings/home_bindings.dart';
import 'package:basic/modules/home/view/home_view.dart';
import 'package:basic/modules/login/bindings/login_bindings.dart';
import 'package:basic/modules/login/view/login_page.dart';
import 'package:get/get.dart';

class Routes {
  Routes._();
  static const login = '/Login';
  static const home = '/Home';
}

class Pages {
  Pages._();
  static final allPages = [
    GetPage(name: Routes.login, page: () => LoginPage(),binding: LoginBindings()), 
    GetPage(name: Routes.home, page: () => const HomeView(),binding: HomeBinding()), 

  ]; 
}