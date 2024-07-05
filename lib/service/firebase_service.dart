import 'dart:convert';

import 'package:comet_currency/routers/app_routers.dart';
import 'package:comet_currency/store/write_store.dart';
import 'package:comet_currency/utils/utils.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FirebaseAuthentication {
  verifyAndSendOtp(String phoneNumber, bool resend) async {
    await FirebaseAuth.instance.verifyPhoneNumber(
      phoneNumber: '+91$phoneNumber',
      verificationCompleted: (PhoneAuthCredential credential) {},
      verificationFailed: (FirebaseAuthException e) {},
      codeSent: (String verificationId, int? resendToken) {
        if (!resend) {
          Get.toNamed(AppRoutes.otpPage,
              arguments: {'phoneNumber': phoneNumber, 'otp': verificationId});
        }
      },
      codeAutoRetrievalTimeout: (String verificationId) {},
    );
  }

  verifyotp(String verificationId, String otp) async {
    try {
      PhoneAuthCredential credential = PhoneAuthProvider.credential(
          verificationId: verificationId, smsCode: otp);
      UserCredential userCredential =
          await FirebaseAuth.instance.signInWithCredential(credential);
      if (userCredential.user != null) {
        WriteStore().writeUserData(userCredential.user!.phoneNumber);
        Get.offAllNamed(AppRoutes.permissionPage);
      } else {
        Utils().toastMessage('Please enter a valid OTP', Colors.red);
      }
    } catch (e) {
      Utils().toastMessage('Please enter a valid OTP', Colors.red);
    }
  }
}
