import '../controller/IntroController.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntroView extends GetView<IntroController> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  IntroView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          color: Colors.white,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: const [
                // Image.asset(
                //   'assets/icon/logo.png',
                //   width: 110,
                //   fit: BoxFit.contain,
                // ),
                // const SizedBox(
                //   height: 32,
                // ),
                Text(
                  'Paper Manager',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w500,
                  ),
                ),
                SizedBox(
                  height: 32,
                ),
              Text(
                  '문서관리시스템',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 30,
                    fontFamily: 'NotoSansKR',
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: const Padding(
        padding: EdgeInsets.only(bottom: 20),
        child: Text(
          '© DTSsoft Corp. All rights reserved.',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Color(0xffaaaaaa),
            fontSize: 12,
            fontFamily: 'NotoSansKR',
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
