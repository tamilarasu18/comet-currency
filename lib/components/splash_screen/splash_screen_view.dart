import 'package:comet_currency/assets.dart';
import 'package:comet_currency/components/splash_screen/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../routers/app_routers.dart';
import '../../store/read_store.dart';
import 'splash_screen_view_model.dart';

class SplashScreenView extends State<SplashScreen> {
  late SplashScreenViewModel _viewModel;
  SplashScreenView() {
    _viewModel = SplashScreenViewModel();
  }

  @override
  void initState() {
    _viewModel.userData = ReadStore().readUserData();
    Future.delayed(const Duration(seconds: 2), () {
      if (_viewModel.userData != null) {
        Get.offNamed(AppRoutes.landingPage);
      } else {
        Get.offNamed(AppRoutes.loginPage);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: Center(child: Image.asset(ImageAssets.credLogo)),
    ));
  }
}
