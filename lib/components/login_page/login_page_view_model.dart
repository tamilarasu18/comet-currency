import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class LoginPageViewModel extends GetxController {
  RxBool isChecked = false.obs;
  TextEditingController controller = TextEditingController();

  bool enableButton() {
    return controller.text.trim().length == 10 && isChecked.value == true;
  }
}
