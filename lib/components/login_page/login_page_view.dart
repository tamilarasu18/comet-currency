import 'package:comet_currency/service/firebase_service.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import './login_page_view_model.dart';
import 'login_page.dart';

class LoginPageView extends State<LoginPage> {
  late LoginPageViewModel _viewModel;
  LoginPageView() {
    _viewModel = LoginPageViewModel();
  }

  @override
  void initState() {
    _viewModel.controller.text = ' ';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: body(),
    ));
  }

  Widget body() {
    return Obx(() => Column(
          children: [
            Flexible(flex: 1, child: topSection()),
            Flexible(flex: 2, child: bottomSection()),
          ],
        ));
  }

  Widget topSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      width: double.infinity,
      color: Colors.black,
      child: const Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'MEMBERSHIP APPLICATION',
            style:
                TextStyle(color: Colors.grey, fontSize: 12, letterSpacing: 2),
          ),
          SizedBox(
            height: 18,
          ),
          Text('tell us your \nmobile number',
              style: TextStyle(color: Colors.white, fontSize: 24))
        ],
      ),
    );
  }

  Widget bottomSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            children: [
              textField(),
              const SizedBox(
                height: 14,
              ),
              termsAndCondition(),
            ],
          ),
          proceedButton()
        ],
      ),
    );
  }

  Widget textField() {
    return TextFormField(
      controller: _viewModel.controller,
      onChanged: (val) {
        _viewModel.enableButton();
      },
      keyboardType: TextInputType.number,
      inputFormatters: <TextInputFormatter>[
        FilteringTextInputFormatter.digitsOnly,
        LengthLimitingTextInputFormatter(10)
      ],
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.bold, fontSize: 20),
      cursorColor: Colors.black,
      decoration: const InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.grey),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.grey),
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.zero,
            borderSide: BorderSide(color: Colors.grey),
          ),
          contentPadding: EdgeInsets.fromLTRB(20, 20, 20, 20),
          labelText: 'MOBILE NUMBER',
          labelStyle: TextStyle(color: Colors.grey, letterSpacing: 2)),
    );
  }

  Widget termsAndCondition() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        InkWell(
          onTap: () {
            _viewModel.isChecked.value = !_viewModel.isChecked.value;
            _viewModel.enableButton();
          },
          child: Container(
            margin: const EdgeInsets.only(top: 6),
            width: 28,
            height: 28,
            decoration: BoxDecoration(
                color: _viewModel.isChecked.value ? Colors.black : Colors.white,
                border: Border.all(color: Colors.black)),
            alignment: AlignmentDirectional.center,
            child: _viewModel.isChecked.value
                ? const Icon(
                    Icons.done,
                    size: 13,
                    color: Colors.white,
                  )
                : Container(),
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
            child: Text.rich(
          TextSpan(
            children: [
              const TextSpan(
                text: "allow CRED to access your credit information from ",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              TextSpan(
                text: 'RBI approved bureaus.',
                recognizer: TapGestureRecognizer()
                  ..onTap = () {
                    // Get.offAllNamed(
                    //     '/${pageName.registration_page.toShortString()}');
                  },
                style: const TextStyle(
                    fontSize: 14,
                    color: Colors.black,
                    decoration: TextDecoration.underline),
              ),
              const TextSpan(
                text: " this does not impact your credit score.",
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
            ],
          ),
        ))
      ],
    );
  }

  Widget proceedButton() {
    return InkWell(
      onTap: () async {
        if (_viewModel.enableButton()) {
          FirebaseAuthentication()
              .verifyAndSendOtp(_viewModel.controller.text.trim(),false);
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
