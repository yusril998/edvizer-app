import 'package:flutter/material.dart';
import 'package:get/get.dart';

class DialogUtils {
  static showConfirmDialog({
    required String message,
    Function()? onTapYa,
    Function()? onTapNo,
  }) {
    Get.dialog(
      AlertDialog(
        title: Text('Konfirmasi'),
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: onTapNo ?? () => hideDialog(),
            child: Text('Tidak'),
          ),
          TextButton(
            onPressed: onTapYa ?? () => hideDialog(),
            child: Text('Ya'),
          ),
        ],
      ),
    );
  }

  static Future<void> hideDialog() async {
    if (Get.isDialogOpen!) Get.back();
  }
}
