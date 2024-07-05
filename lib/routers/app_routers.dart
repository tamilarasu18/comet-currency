import 'package:comet_currency/components/landing_page/landing_page.dart';
import 'package:comet_currency/components/otp_page/otp_page.dart';
import 'package:comet_currency/components/permission_page/permission_page.dart';
import 'package:get/get.dart';

import '../components/login_page/login_page.dart';

class AppRoutes {
  static const String loginPage = '/login_page';
  static const String otpPage = '/otp_page';
  static const String permissionPage = '/permission_page';
  static const String landingPage = '/landing_page';

  static List<GetPage> pages = [
    GetPage(
      name: loginPage,
      page: () => const LoginPage(),
    ),
     GetPage(
      name: otpPage,
      page: () => const OtpPage(),
    ),
    GetPage(
      name: permissionPage,
      page: () => const PermissionPage(),
    ),
     GetPage(
      name: landingPage,
      page: () => const LandingPage(),
    ),
  ];
}
