import 'dart:io';

import 'package:month_year_picker/month_year_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Ui {
  static GetSnackBar SuccessSnackBar({String title = 'Success', required String message}) {
    Get.log("[$title] $message");
    return GetSnackBar(
      titleText: Text(title.tr, style: Get.textTheme.headline6?.merge(TextStyle(color: Get.theme.primaryColor))),
      messageText: Text(message, style: Get.textTheme.caption?.merge(TextStyle(color: Get.theme.primaryColor))),
      snackPosition: SnackPosition.BOTTOM,
      margin: EdgeInsets.all(20),
      backgroundColor: Colors.green,
      icon: Icon(Icons.check_circle_outline, size: 32, color: Get.theme.primaryColor),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      dismissDirection: DismissDirection.horizontal,
      duration: Duration(seconds: 5),
    );
  }

  static GetSnackBar ErrorSnackBar({String title = 'Error', required String message}) {
    Get.log("[$title] $message", isError: true);
    return GetSnackBar(
      titleText: Text(title.tr, style: Get.textTheme.headline6?.merge(const TextStyle(color: Colors.white))),
      messageText: Text(message, style: Get.textTheme.caption?.merge(const TextStyle(color: Colors.white))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Colors.redAccent,
      icon: const Icon(Icons.remove_circle_outline, size: 32, color: Colors.white),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }

  static GetSnackBar defaultSnackBar({String title = '알림', required String message}) {
    Get.log("[$title] $message", isError: false);
    return GetSnackBar(
      titleText: Text(title.tr, style: Get.textTheme.headline6?.merge(TextStyle(color: Colors.black))),
      messageText: Text(message, style: Get.textTheme.caption?.merge(const TextStyle(color: Colors.black))),
      snackPosition: SnackPosition.BOTTOM,
      margin: const EdgeInsets.all(20),
      backgroundColor: Get.theme.primaryColor,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      icon: const Icon(Icons.warning_amber_rounded, size: 32, color: Colors.redAccent),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 5),
    );
  }

  static GetSnackBar notificationSnackBar({String title = 'Notification', String? message, OnTap? onTap, Widget? mainButton}) {
    Get.log("[$title] $message", isError: false);

    if (Platform.isIOS){
      // message 가 null 이면 message = title
      message ??= title;
    }

    return GetSnackBar(
      onTap: onTap,
      // mainButton: mainButton,
      // titleText: Text(title.tr, style: Get.textTheme.headline6.merge(TextStyle(color: Get.theme.hintColor))),
      messageText: Text(message ?? '-------', style: Get.textTheme.caption?.merge(TextStyle(color: Get.theme.focusColor))),
      snackPosition: SnackPosition.TOP,
      margin: EdgeInsets.all(20),
      backgroundColor: Get.theme.primaryColor,
      borderColor: Get.theme.focusColor.withOpacity(0.1),
      // icon: Icon(Icons.notifications_none, size: 32, color: Get.theme.hintColor),
      icon: Image.asset('assets/icon/icon_logo.png',fit: BoxFit.contain,height: 32),
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 18),
      borderRadius: 8,
      duration: const Duration(seconds: 7),
    );
  }

  /// Picker
  static Future datePicker(BuildContext context, Rx<DateTime> date, {DateTime? firstDate, Function? callback}) async {
    // firstDate == null 이면 firstDate = DateTime
    firstDate ??= DateTime(1970);

    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: date.value,
      firstDate: firstDate,
      lastDate: DateTime(2101),
      locale: Get.locale,
      builder: (BuildContext context, Widget? child) {
        return child!.paddingAll(10);
      },
    );

    print(picked);

    if (picked != null){
      date.value = picked;

      if (callback != null) {
        await callback();
      }
    }
  }

  /// Month Year Picker
  static Future monthPicker(BuildContext context, Rx<DateTime> date, {DateTime? firstDate, Function? callback}) async {
    // firstDate == null 이면 firstDate = DateTime
    firstDate ??= DateTime(1970);

    final picked = await showMonthYearPicker(
      context: context,
      initialDate: date.value,
      firstDate: firstDate,
      lastDate: DateTime(2101),
      locale: Get.locale,
      builder: (BuildContext context, Widget? child) {
        return child!.paddingAll(10);
      },
    );

    if (picked != null) {
      date.value = picked;

      if (callback != null) {
        await callback();
      }
    }
  }

  /// 프로젝트 공통 색상 (버튼, 로더, 탭 등)
  static Color commonColors() {
    return const Color(0xff00a59d);
  }

  static Color parseColor(String hexCode, {double? opacity}) {
    try {
      return Color(int.parse(hexCode.replaceAll("#", "0xFF"))).withOpacity(opacity ?? 1);
    } catch (e) {
      return const Color(0xFFCCCCCC).withOpacity(opacity ?? 1);
    }
  }

  /// 문서 TextField crud 에 따른 색상 변경.
  static Color colors(String crud) {
    if (crud == "none") {
      return Colors.transparent;
    } else if (crud == "crud-r") {
      return Colors.black12;
    } else {
      return Colors.yellow;
    }
  }

  /// 점검기록표 메뉴 타이틀 속성
  static Text inspectionTitleText(String title, {FontWeight? fontWeight}) {
    fontWeight ??= FontWeight.normal;

    return Text(title, style: TextStyle(fontSize: 18, fontWeight: fontWeight));
  }

  /// 점검기록표 개요 BorderSide
  static BoxDecoration boxDecoration({String? borderType, Color? borderLineColor, double? width, String? crud}) {
    borderLineColor ??= Colors.black;
    width ??= 1.0;
    crud ??= 'none';
    Border border;

    switch (borderType) {
      case "rlb":
        border = Border(
          right: BorderSide(color: borderLineColor, width: width),
          left: BorderSide(color: borderLineColor, width: width),
          bottom: BorderSide(color: borderLineColor, width: width),
        );
        break;

      case "trb":
        border = Border(
          top: BorderSide(color: borderLineColor, width: width),
          right: BorderSide(color: borderLineColor, width: width),
          bottom: BorderSide(color: borderLineColor, width: width),
        );
        break;

      case "tlb":
        border = Border(
          top: BorderSide(color: borderLineColor, width: width),
          bottom: BorderSide(color: borderLineColor, width: width),
          left: BorderSide(color: borderLineColor, width: width)
        );
        break;

      case "tb":
        border = Border(
            top: BorderSide(color: borderLineColor, width: width),
            bottom: BorderSide(color: borderLineColor, width: width)
        );
        break;

      case "rb":
        border = Border(
          right: BorderSide(color: borderLineColor, width: width),
          bottom: BorderSide(color: borderLineColor, width: width),
        );
        break;

      default :
        border = Border.all(color: borderLineColor, width: width);
        break;
    }

    return BoxDecoration(
        border: border,
        color: Ui.colors(crud)
    );
  }
}