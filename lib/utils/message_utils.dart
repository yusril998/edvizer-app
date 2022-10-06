import 'package:edvizer_app/constants/app_colors.dart';
import 'package:edvizer_app/constants/app_sizes.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MessageUtils {
  static general({required String text}) {
    Get.showSnackbar(GetSnackBar(
      message: "$text",
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.all(Sizes.s20),
      borderRadius: 10,
      duration: Duration(seconds: 2),
      backgroundColor: AppColor.black,
      snackPosition: SnackPosition.BOTTOM,
    ));
  }

  static success({required String text}) {
    Get.showSnackbar(GetSnackBar(
      message: "$text",
      isDismissible: true,
      snackStyle: SnackStyle.FLOATING,
      margin: EdgeInsets.all(Sizes.s20),
      borderRadius: 10,
      duration: Duration(seconds: 2),
      backgroundColor: AppColor.grey,
      snackPosition: SnackPosition.BOTTOM,
    ));
  }
}
