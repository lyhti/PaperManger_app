import '../flutter_flow/flutter_flow_theme.dart';

import 'package:flutter/material.dart';

class MainAppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  final AppBar? appBar;
  final String? subTitle;

  const MainAppBarWidget({
    @required this.appBar,
    @required this.subTitle,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      iconTheme: const IconThemeData(
        color: Colors.black,
      ),
      automaticallyImplyLeading: true,
      title: Text(
        subTitle!,
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
      elevation: 0
    );
  }

  @override
  // TODO: implement preferredSize
  Size get preferredSize => Size.fromHeight(appBar!.preferredSize.height);
}
