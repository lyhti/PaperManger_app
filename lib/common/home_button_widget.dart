import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../services/auth_service.dart';

class HomeButtonWidget extends StatelessWidget {
  final Color? iconColor;
  final Color? labelColor;

  const HomeButtonWidget({
    this.iconColor,
    this.labelColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      hoverElevation: 0,
      highlightElevation: 0,
      elevation: 0,
      onPressed: () {
        if (Get.find<AuthService>().tokenYn.isTrue) {
          Get.until((route) => Get.currentRoute == '/home');
          Get.offAllNamed('/home');
        } else {
          Get.offAllNamed('/login');
        }
      },
      color: Colors.transparent,
      child: Stack(
        alignment: AlignmentDirectional.bottomEnd,
        children: <Widget>[
          Icon(
            Icons.home,
            color: iconColor ?? Get.theme.hintColor,
            size: 28,
          ),
        ],
      ),
    );
  }
}
