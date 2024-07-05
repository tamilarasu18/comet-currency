import 'package:comet_currency/routers/app_routers.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';
import './permission_page_view_model.dart';
import 'permission_page.dart';

class PermissionPageView extends State<PermissionPage> {
  late PermissionPageViewModel _viewModel;
  PermissionPageView() {
    _viewModel = PermissionPageViewModel();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      backgroundColor: Colors.black,
      body: body(),
    ));
  }

  Widget body() {
    return Column(
      children: [
        topSection(),
        const Spacer(),
        bottomSection(),
      ],
    );
  }

  Widget topSection() {
    return InkWell(
      onTap: () {
        Get.toNamed(AppRoutes.landingPage);
      },
      child: Container(
        padding: const EdgeInsets.only(top: 12,right: 18),
        alignment: Alignment.centerRight,
        child: Container(
          decoration: const BoxDecoration(
              border:
                  Border(bottom: BorderSide(color: Colors.grey, width: 1.5))),
          child: const Text(
            'skip for now',
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
        ),
      ),
    );
  }

  Widget bottomSection() {
    return Container(
      padding: const EdgeInsets.all(24),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'GRAND ACCESS',
            style:
                TextStyle(color: Colors.grey, fontSize: 12, letterSpacing: 2),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            'we need the following permission to proceed',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 6 / 100,
          ),
          permissionCard(
              Icons.notifications_outlined,
              'push notification permission',
              'to notify you about rewards and bill payment remainders on time'),
          const SizedBox(
            height: 20,
          ),
          permissionCard(Icons.location_on_outlined, 'location permission',
              'to show you rewards & alerts exclusive to your location'),
          const SizedBox(
            height: 20,
          ),
          proceedButton()
        ],
      ),
    );
  }

  Widget permissionCard(IconData icon, String title, String content) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Container(
          padding: const EdgeInsets.all(4),
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(50), color: Colors.grey[700]),
          child: Icon(
            icon,
            color: Colors.grey[400],
            size: 16,
          ),
        ),
        const SizedBox(
          width: 12,
        ),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                title,
                style: const TextStyle(
                    color: Colors.white, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 6,
              ),
              Text(
                content,
                style: const TextStyle(color: Colors.grey, fontSize: 12),
              )
            ],
          ),
        )
      ],
    );
  }

  Widget proceedButton() {
    return InkWell(
      onTap: () async {
        PermissionStatus notification = await Permission.notification.request();
        PermissionStatus location = await Permission.location.request();
        if (location.isGranted && notification.isGranted) {
          Get.offAllNamed(AppRoutes.landingPage);
        }
      },
      child: Container(
        color: Colors.white,
        padding: const EdgeInsets.all(18),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Proceed',
              style: TextStyle(
                  fontSize: 16,
                  color: Colors.black,
                  fontWeight: FontWeight.w500),
            ),
            SizedBox(
              width: 6,
            ),
            Icon(
              Icons.trending_flat,
              color: Colors.black,
            )
          ],
        ),
      ),
    );
  }
}
