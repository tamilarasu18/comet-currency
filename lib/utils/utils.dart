import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Utils {
  toastMessage(String message, Color bgColors) {
    Get.snackbar(
      '',
      message,
      colorText: Colors.white,
      backgroundColor: bgColors,
      borderRadius: 0,
      margin: EdgeInsets.zero,
      titleText: Container(),
      messageText: Center(
        child: Text(
          message,
          style: const TextStyle(
              fontSize: 14, fontWeight: FontWeight.w500, color: Colors.white),
        ),
      ),
    );
  }
}
