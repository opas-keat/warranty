import 'package:get/get.dart';

import '../modules/register/bindings/register_binding.dart';
import '../modules/register/views/register_view.dart';
import '../modules/register_result/bindings/register_result_binding.dart';
import '../modules/register_result/views/register_result_view.dart';

part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.SIGNIN;

  static final routes = [
    // GetPage(
    //   name: _Paths.HOME,
    //   page: () => const HomeView(),
    //   binding: HomeBinding(),
    //   children: [
    //     GetPage(
    //       name: _Paths.DEALER,
    //       page: () => const DealerView(),
    //       binding: DealerBinding(),
    //     ),
    //     GetPage(
    //       name: _Paths.WARRANTY,
    //       page: () => const WarrantyView(),
    //       binding: WarrantyBinding(),
    //     ),
    //     GetPage(
    //       name: _Paths.CONFIG,
    //       page: () => const ConfigView(),
    //       binding: ConfigBinding(),
    //     ),
    //   ],
    // ),
    // GetPage(
    //   name: _Paths.SIGNIN,
    //   page: () => SigninView(),
    //   binding: SigninBinding(),
    // ),
    // GetPage(
    //   name: '${_Paths.CUSTOMER}/:dealerId',
    //   page: () => CustomerView(),
    //   binding: CustomerBinding(),
    // ),
    GetPage(
      // name: _Paths.REGISTER,
      name: '${_Paths.REGISTER}/:dealerId',
      page: () => RegisterView(),
      binding: RegisterBinding(),
    ),
    GetPage(
      name: '${_Paths.REGISTER_RESULT}/:warrantyId',
      page: () => RegisterResultView(),
      binding: RegisterResultBinding(),
    ),
  ];
}
