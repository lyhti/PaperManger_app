import './util.dart';
import '../app/home/controller/HomeController.dart';
import '../app/auth/controller/LoginController.dart';
import '../services/auth_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MenuButtonWidget extends StatelessWidget {
  final auth = Get.find<AuthService>();
  final controller = Get.find<HomeController>();

  MenuButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    LoginController loginController = LoginController();
    return Drawer(
      // backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
      child: ListView(
        padding: EdgeInsets.zero,
        children: <Widget>[
          // 프로젝트에 assets 폴더 생성 후 이미지 2개 넣기
          // pubspec.yaml 파일에 assets 주석에 이미지 추가하기
          UserAccountsDrawerHeader(
            currentAccountPicture: const CircleAvatar(
              // 현재 계정 이미지 set
              backgroundImage: AssetImage('assets/profile.png'),
              backgroundColor: Colors.white,
            ),
            otherAccountsPictures: const <Widget>[
              // 다른 계정 이미지[] set
              // CircleAvatar(
              //   backgroundColor: Colors.white,
              //   backgroundImage: AssetImage('assets/profile.png'),
              // ),
              // CircleAvatar(
              //   backgroundColor: Colors.white,
              //   backgroundImage: AssetImage('assets/profile3.gif'),
              // )
            ],
            // accountName: Text(userName),
            // accountEmail: Text(email),
            accountName: Text(controller.auth.user.value.userNm.toString()),
            accountEmail: Text(controller.auth.user.value.email.toString()),
            // onDetailsPressed: () {
            //   print('arrow is clicked');
            // },
            decoration: BoxDecoration(
                color: Colors.blue[200],
                borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(40.0),
                    bottomRight: Radius.circular(40.0))),
          ),
          ListTile(
            leading: Icon(
              Icons.home,
              color: Colors.grey[850],
            ),
            title: const Text('Home'),
            onTap: () {
              Get.offNamed('/home');
            },
            // trailing: Icon(Icons.add),
          ),
          // ListTile(
          //   leading: Icon(
          //     Icons.menu,
          //     color: Colors.grey[850],
          //   ),
          //   title: const Text('문서 조회'),
          //   onTap: () {
          //     Get.offNamed('/docList');
          //   },
          //   trailing: Icon(Icons.add),
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.menu,
          //     color: Colors.grey[850],
          //   ),
          //   title: Text('메뉴 02'),
          //   onTap: () {
          //     print('Setting is clicked');
          //   },
          //   trailing: Icon(Icons.add),
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.menu,
          //     color: Colors.grey[850],
          //   ),
          //   title: Text('메뉴 03'),
          //   onTap: () {
          //     print('Setting is clicked');
          //   },
          //   trailing: Icon(Icons.add),
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.menu,
          //     color: Colors.grey[850],
          //   ),
          //   title: Text('메뉴 04'),
          //   onTap: () {
          //     print('Setting is clicked');
          //   },
          //   trailing: Icon(Icons.add),
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.settings,
          //     color: Colors.grey[850],
          //   ),
          //   title: Text('Setting'),
          //   onTap: () {
          //     print('Setting is clicked');
          //   },
          // ),
          // ListTile(
          //   leading: Icon(
          //     Icons.question_answer,
          //     color: Colors.grey[850],
          //   ),
          //   title: Text('Q&A'),
          //   onTap: () {
          //     print('Q&A is clicked');
          //   },
          // ),
          ListTile(
            leading: Icon(
              Icons.lock,
              color: Colors.grey[850],
            ),
            title: const Text('Log Out'),
            onTap: () async {
              Util.confirm('로그아웃 하시겠습니까?', callback: () async {
                await loginController.logOut();
                Util.alert("로그아웃 되었습니다.", callback: () async {
                  Get.offAllNamed('/login');
                });
              });
            },
          ),
        ],
      ),
    );
  }
}
