import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/customer/bindings/customer_binding.dart';
import '../modules/home/customer/views/customer_view.dart';
import '../modules/home/dealer/bindings/dealer_binding.dart';
import '../modules/home/dealer/views/dealer_view.dart';
import '../modules/home/views/home_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    GetPage(
      name: _Paths.HOME,
      page: () => HomeView(),
      binding: HomeBinding(),
      children: [
        GetPage(
          name: _Paths.DEALER,
          page: () => DealerView(),
          binding: DealerBinding(),
        ),
        GetPage(
          name: _Paths.CUSTOMER,
          page: () => CustomerView(),
          binding: CustomerBinding(),
        ),
      ],
    ),
    GetPage(
      name: _Paths.SIGNIN,
      page: () => SigninView(),
      binding: SigninBinding(),
    ),
  ];
}
