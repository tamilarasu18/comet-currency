import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/route_manager.dart';
import 'package:sms_autofill/sms_autofill.dart';
import '../../service/firebase_service.dart';
import '../../utils/utils.dart';
import './otp_page_view_model.dart';
import 'otp_page.dart';

class OtpPageView extends State<OtpPage> {
  late OtpPageViewModel _viewModel;
  OtpPageView() {
    _viewModel = OtpPageViewModel();
  }

  @override
  void initState() {
    if (Get.arguments != null) {
      _viewModel.phoneNumber.value = Get.arguments["phoneNumber"];
      _viewModel.verificationId.value = Get.arguments["otp"];
    }
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _viewModel.focusNode.requestFocus();
    });
    super.initState();
  }

  @override
  void dispose() {
    _viewModel.focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: body(),
    ));
  }

  Widget body() {
    return Column(
      children: [
        Flexible(flex: 1, child: topSection()),
        Flexible(flex: 2, child: bottomSection()),
      ],
    );
  }

  Widget topSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          !_viewModel.focusNode.hasFocus
              ? InkWell(
                  onTap: () {
                    Get.back();
                  },
                  child: Container(
                      padding: const EdgeInsets.all(4),
                      decoration:
                          BoxDecoration(border: Border.all(color: Colors.grey)),
                      child: const Icon(
                        Icons.keyboard_backspace,
                        color: Colors.white,
                      )),
                )
              : Container(),
          const Spacer(),
          const Text(
            'MEMBERSHIP APPLICATION',
            style:
                TextStyle(color: Colors.grey, fontSize: 12, letterSpacing: 2),
          ),
          const SizedBox(
            height: 8,
          ),
          Text('enter the OTP sent to\n${_viewModel.phoneNumber.value}',
              style: const TextStyle(color: Colors.white, fontSize: 24))
        ],
      ),
    );
  }

  Widget bottomSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              fetchOtpSectin(),
              const SizedBox(
                height: 12,
              ),
              resendOtp()
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              contentSection(),
              const SizedBox(
                height: 18,
              ),
              proceedButton(),
            ],
          )
        ],
      ),
    );
  }

  Widget fetchOtpSectin() {
    return SizedBox(
      width: MediaQuery.of(context).size.width * 60 / 100,
      height: MediaQuery.of(context).size.height * 7 / 100,
      child: PinFieldAutoFill(
        focusNode: _viewModel.focusNode,
        codeLength: 6,
        currentCode: _viewModel.code.value,
        cursor: Cursor(width: 2, height: 20, color: Colors.black),
        decoration: BoxLooseDecoration(
          strokeColorBuilder: FixedColorBuilder(Colors.black.withOpacity(0.3)),
          bgColorBuilder: const FixedColorBuilder(Colors.white),
          textStyle: const TextStyle(fontSize: 20, color: Colors.black),
          gapSpace: 6,
          radius: Radius.zero,
        ),
        onCodeChanged: (code) {
          _viewModel.code.value = code ?? '';
          _viewModel.enableButton();
          if (code != null && code.length == 6) {
            FocusScope.of(context).unfocus();
          }
        },
      ),
    );
  }

  Widget resendOtp() {
    return Text.rich(
      TextSpan(
        children: [
          const TextSpan(
            text: "didn't receive OTP? ",
            style: TextStyle(fontSize: 14, color: Colors.grey),
          ),
          TextSpan(
            text: 'Resend OTP',
            recognizer: TapGestureRecognizer()
              ..onTap = () {
                FirebaseAuthentication()
                    .verifyAndSendOtp(_viewModel.phoneNumber.value, true);
                Utils().toastMessage('Resending otp', Colors.green);
              },
            style: const TextStyle(
                fontSize: 14,
                color: Colors.black,
                decoration: TextDecoration.underline),
          ),
        ],
      ),
    );
  }

  Widget contentSection() {
    return Text.rich(TextSpan(
      children: [
        const TextSpan(
          text:
              "by proceeding, you are indicating that you have read and agree to our\n",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        TextSpan(
          text: 'terms of use',
          recognizer: TapGestureRecognizer()..onTap = () {},
          style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.underline),
        ),
        const TextSpan(
          text: " & ",
          style: TextStyle(fontSize: 14, color: Colors.grey),
        ),
        TextSpan(
          text: 'Privacy policy',
          recognizer: TapGestureRecognizer()..onTap = () {},
          style: const TextStyle(
              fontSize: 14,
              color: Colors.black,
              decoration: TextDecoration.underline),
        ),
      ],
    ));
  }

  Widget proceedButton() {
    return InkWell(
      onTap: () async {
        if (_viewModel.enableButton()) {
          FirebaseAuthentication().verifyotp(
              _viewModel.verificationId.value, _viewModel.code.value);
        }
      },
      child: Container(
        color: _viewModel.enableButton() ? Colors.black : Colors.grey[600],
        padding: const EdgeInsets.all(18),
        width: MediaQuery.of(context).size.width * 34 / 100,
        child: Row(
          children: [
            Text(
              'Proceed',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[200],
                  fontWeight: FontWeight.w500),
            ),
            const SizedBox(
              width: 6,
            ),
            Icon(
              Icons.trending_flat,
              color: Colors.grey[200],
            )
          ],
        ),
      ),
    );
  }
}
