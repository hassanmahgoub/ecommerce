// ignore_for_file: file_names

import 'package:ecommerce/controller/onBoarding_controller.dart';
import 'package:ecommerce/data/datasource/static/static.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

// ignore: camel_case_types
class onBoarding extends GetView<OnBoardingControllerImp> {
  const onBoarding({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OnBoardingControllerImp());
    // ignore: non_constant_identifier_names
    final ScreenSize = MediaQuery.of(context).size;
    return Scaffold(
        body: Column(children: [
      Expanded(
        child: PageView.builder(
          controller: controller.pageController,
            onPageChanged: (val) {
              controller.onPageChanged(val);
              print(val); 
            },
            itemCount: onBoardingList.length,
            itemBuilder: (context, i) {
              return Column(
                children: [
                  const SizedBox(height: 100),
                  Text(
                    onBoardingList[i].title!,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  Image.asset(
                    onBoardingList[i].image!,
                    height: 200,
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  Text(
                    onBoardingList[i].body!,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                        fontSize: 20, fontWeight: FontWeight.w400),
                  )
                ],
              );
            }),
      ),
      GetBuilder<OnBoardingControllerImp>(
        builder: (controller) =>
        Row(
          mainAxisAlignment: MainAxisAlignment.center, children: [
          ...List.generate(
              onBoardingList.length,
              (index) => AnimatedContainer(
                    margin: const EdgeInsets.only(right: 10),
                    duration: const Duration(milliseconds: 500),
                    width: controller.currentPage == index? 30 : 8,
                    height: 8,
                    decoration: BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.circular(10)),
                  ))
        ]),
      ),
      const SizedBox(
        height: 200,
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: GestureDetector(
          onTap: () {
            controller.next();
          },
          child: Container(
            height: 45,
            width: ScreenSize.width,
            decoration: BoxDecoration(
                color: Colors.blue, borderRadius: BorderRadius.circular(10)),
            child: const Center(
                child: Text(
              'Continue',
              style: TextStyle(
                  color: Colors.white, fontSize: 20, fontWeight: FontWeight.bold),
            )),
          ),
        ),
      ),
      MaterialButton(
        onPressed: () {
          
        },
        child: const Text('Skip'),
      ),
      const SizedBox(
        height: 50,
      ),
    ]));
  }
}
