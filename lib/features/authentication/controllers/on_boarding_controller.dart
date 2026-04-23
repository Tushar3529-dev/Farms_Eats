
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:software_lab/features/authentication/screens/Login/login_screen.dart';

class OnBoardingController extends GetxController {
  static OnBoardingController get instance => Get.find();

  // Variables
  final pagecontroller = PageController();
  Rx<int> currentPageIndex = 0.obs;

  // Update Current Index when page Scroll
  void updatePageIndicator(index) => currentPageIndex.value = index;

  // Jump to the specific dot selected page
  void dotNavigationClick(index) {
    currentPageIndex.value = index;
    pagecontroller.jumpToPage(index);
  }

  // Update Current Index & Jump to next Page
  void nextPage() {
    if (currentPageIndex.value == 2) {
      Get.offAll(() => const LoginScreen());
    } else {
      int page = currentPageIndex.value + 1;
      pagecontroller.jumpToPage(page);
    }
  }

  // Update Current Index & Jump to the last Page
  void skipPage() {
    currentPageIndex.value = 2;
    pagecontroller.jumpToPage(2);
  }
}
