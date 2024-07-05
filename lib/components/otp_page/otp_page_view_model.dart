import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';

class OtpPageViewModel extends GetxController {
  RxString code = "".obs;
  RxString phoneNumber = "".obs;
  RxString verificationId = "".obs;
  FocusNode focusNode = FocusNode();

  bool enableButton(){
    return code.value.length == 6;
  }
}
