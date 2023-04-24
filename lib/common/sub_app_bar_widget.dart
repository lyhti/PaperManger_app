import './util.dart';
import '../flutter_flow/flutter_flow_theme.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SubAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final AppBar? appBar;
  final String? subTitle;
  final TabBar? tabBar;

  const SubAppBarWidget({
    @required this.appBar,
    @required this.subTitle,
    this.tabBar,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      leading: IconButton(
        icon: Icon(Icons.arrow_back_ios, color: Get.theme.hintColor),
        onPressed: () {
          Util.print('뒤로가기');
          Get.back();
        },
      ),
      automaticallyImplyLeading: true,
      title: Text(
        subTitle!,
        textAlign: TextAlign.center,
        style: FlutterFlowTheme.of(context).bodyText1.override(
          fontFamily: 'Noto Sans',
          color: Colors.black,
          fontSize: 18,
          fontWeight: FontWeight.w600,
        ),
      ),
      // actions: [
      //   HomeButtonWidget(
      //     iconColor: Colors.black,
      //     labelColor: Get.theme.hintColor,
      //   )
      // ],
      centerTitle: true,
      elevation: 0,
      bottom: tabBar,
      shape: tabBar != null ? const Border(bottom: BorderSide(color: Color(0xffd6d6d6))) : null,
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar!.preferredSize.height);
}
