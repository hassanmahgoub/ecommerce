import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../core/constant/route.dart';
import '../data/datasource/static/static.dart';

abstract class OnBoardingController extends GetxController {
  int currentPage = 0;
  next();
  onPageChanged(int index);
}

class OnBoardingControllerImp extends OnBoardingController {
  late PageController pageController;

  @override
   int currentPage = 0;

  @override
  next() {
    currentPage++;

    if (currentPage > onBoardingList.length -1) {
       Get.offAllNamed(AppRoute.login) ; 
    } else {
      pageController.animateToPage(currentPage,
          duration: const Duration(milliseconds: 900), curve: Curves.easeInOut);
    }
  }

  @override
  onPageChanged(int index) {
    currentPage = index;
    update();
  }

  @override
  void onInit() {
    pageController = PageController();
    super.onInit();
  }
}