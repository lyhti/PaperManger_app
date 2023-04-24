import 'package:flutter/material.dart';
import './pre_work_conf_bottom_widget.dart';
import '../../../common/main_app_bar_widget.dart';
import '../../../common/menu_button_widget.dart';
import '../../../common/ui.dart';

class PreWorkConferenceViewWidget extends StatelessWidget {
  const PreWorkConferenceViewWidget({Key ? key}) : super(key: key);

  final smallRowHeight = 40.0;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {FocusScope.of(context).unfocus();},
      child: Scaffold(
        appBar: MainAppBarWidget(appBar: AppBar(), subTitle: '작업전 안전회의'),
        endDrawer: MenuButtonWidget(),
        bottomNavigationBar: PreWorkConferenceBottomWidget(),     // const 추가 시, GetBuilder 적용 안됨
        body: InteractiveViewer(
          panEnabled: true,
          minScale: 1.0,
          maxScale: 4,
          child: SafeArea(
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                            decoration: BoxDecoration(
                              color: Colors.grey,
                              border: Border.all(),
                            ),
                            alignment: Alignment.center,
                            height: 60,
                            width: 1200,
                            child: Ui.inspectionTitleText('작업전[후] 안전회의 및 근로자 참여 위험성평가 후 교육일지', fontWeight: FontWeight.bold)
                        ),

                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: Ui.inspectionTitleText('공사명')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 500,
                                child: Ui.inspectionTitleText('동서울S/S 154kV 옥외철구 GIS화 공사(일반)')
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 200,
                                child: Ui.inspectionTitleText('시공회사명')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 400,
                                child: Ui.inspectionTitleText('대영종합산기㈜')
                            ),
                          ],
                        ),


                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: Ui.inspectionTitleText('일시')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 500,
                                child: Ui.inspectionTitleText('2023년 3월 31일')
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 200,
                                child: Ui.inspectionTitleText('작업책임자')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 400,
                                child: Ui.inspectionTitleText('김 용 태         (인)')
                            ),
                          ],
                        ),


                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: Ui.inspectionTitleText('작업인원')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 500,
                                child: Ui.inspectionTitleText('6명')
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 200,
                                child: Ui.inspectionTitleText('작 업 장 소')
                            ),
                            Container(
                                decoration: Ui.boxDecoration(borderType: 'rb'),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 400,
                                child: Ui.inspectionTitleText('동서울S/S')
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight * 16,
                                width: 50,
                                child: Ui.inspectionTitleText('업\n무\n분\n담')
                            ),

                            Column(
                              children: [
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 2,
                                    width: 100,
                                    child: Ui.inspectionTitleText('작업자')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 2,
                                    width: 150,
                                    child: Ui.inspectionTitleText('작업내용')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 150,
                                    child: Ui.inspectionTitleText('')
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 300,
                                    child: const Text('작업 후 신체 이상여부 확인', style: TextStyle(color: Colors.blue, fontSize: 18))
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('이상유무', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('내용', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('서명', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),
                              ],
                            ),



                            Column(
                              children: [
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 2,
                                    width: 100,
                                    child: Ui.inspectionTitleText('작업자')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: Ui.inspectionTitleText('')
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 2,
                                    width: 200,
                                    child: Ui.inspectionTitleText('작업내용')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 200,
                                    child: Ui.inspectionTitleText('')
                                ),
                              ],
                            ),

Column(
                              children: [
                                Container(
                                    decoration: Ui.boxDecoration(borderType: 'rb'),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 300,
                                    child: const Text('작업 후 신체 이상여부 확인', style: TextStyle(color: Colors.blue, fontSize: 18))
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('이상유무', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('내용', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('서명', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),

                                Row(
                                  children: [
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(무)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 50,
                                        child: const Text('(유)', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                    Container(
                                        decoration: Ui.boxDecoration(borderType: 'rb'),
                                        alignment: Alignment.center,
                                        height: smallRowHeight,
                                        width: 100,
                                        child: const Text('', style: TextStyle(color: Colors.blue, fontSize: 18))
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 40,
                                width: 600,
                                child: Ui.inspectionTitleText('작업자 PMIS Check', fontWeight: FontWeight.bold)
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: 40,
                                width: 600,
                                child: Ui.inspectionTitleText('작업책임자 : 김  용  태                    (인)')
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 300,
                                child: Ui.inspectionTitleText('Physical (신체)')
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 300,
                                child: Ui.inspectionTitleText('Mental (정신)')
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 300,
                                child: Ui.inspectionTitleText('Intelligent (지성)')
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 300,
                                child: Ui.inspectionTitleText('Sensible (감성)')
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        left: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    height: smallRowHeight,
                                    width: 300,
                                    child: const Text('· 음주 및 약물복용(수면제등) 작업전  (무) (유)', style: TextStyle(fontSize: 14),),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        left: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    height: smallRowHeight,
                                    width: 300,
                                    child: const Text('· 음주 및 약물복용(수면제등) 중식후  (무) (유)', style: TextStyle(fontSize: 14),),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        left: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    height: smallRowHeight,
                                    width: 300,
                                    child: const Text('· 신체상태(혈색 등) 이상                 (무) (우)', style: TextStyle(fontSize: 14),),
                                ),
                              ],
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: smallRowHeight * 3,
                                width: 300,
                                child: const Text('· 분담작업 시행의지      (양) (불)\n· 가정사 등 Stress 여부  (양) (불)', style: TextStyle(fontSize: 14),),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: smallRowHeight * 3,
                                width: 300,
                                child: const Text('· 분담작업 내용숙지         (양) (불)\n· 안전작업수칙 숙지         (양) (불)', style: TextStyle(fontSize: 14),),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: smallRowHeight * 3,
                                width: 300,
                                child: const Text('· 충분한 숙면 여부           (양) (불)\n· 지시사항 반응정도         (양) (불)', style: TextStyle(fontSize: 14),),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Column(
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        left: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    height: smallRowHeight,
                                    width: 900,
                                    child: const Text('※ 작업 중 발생한 안전사고등으로 인한 신체이상 발생시 담당자 등에게 즉시 통보 할 것', style: TextStyle(fontSize: 14),),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        left: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    height: smallRowHeight,
                                    width: 900,
                                    child: const Text('※ 신체상태 판단 방법 : ①음주, ②혈압, ③산소포화도 측정 / 단,  ②, ③항은 건강상태 참고 사항', style: TextStyle(fontSize: 14),),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        left: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    height: smallRowHeight,
                                    width: 900,
                                    child: const Text('    - ②, ③항의 건강에 이상이 있는 근로자는 일용직 근로자 관리카드 양식 활용 관리 시행', style: TextStyle(fontSize: 14),),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        left: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.centerLeft,
                                    height: smallRowHeight,
                                    width: 900,
                                    child: const Text('※ 작업자 PMIS Check (유) 또는 (불) 및 필수 안전조치사항 미이행 퇴거조치자 : ', style: TextStyle(fontSize: 14),),
                                ),
                              ],
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: smallRowHeight * 4,
                                width: 300,
                                child: const Text('책임감리원 :                               (인)', style: TextStyle(fontSize: 14),),
                            ),
                          ],
                        ),
                      
                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight * 14,
                                width: 50,
                                child: const Text('근\n로\n자\n참\n여\n\ \n위\n험\n성\n평\n가\n \n및\n \n교\n육', style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold)),
                            ),

                            Column(
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 2,
                                    width: 100,
                                    child: const Text('구분', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 3,
                                    width: 100,
                                    child: const Text('사람', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 3,
                                    width: 100,
                                    child: const Text('장비', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 3,
                                    width: 100,
                                    child: const Text('환경', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 3,
                                    width: 100,
                                    child: const Text('관리', style: TextStyle(fontSize: 14)),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 2,
                                    width: 375,
                                    child: const Text('유해·위험요인', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 2,
                                    width: 100,
                                    child: const Text('위험성\n(현재)', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 2,
                                    width: 375,
                                    child: const Text('위험감소 조치(방법)', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 375,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 2,
                                    width: 100,
                                    child: const Text('위험성\n(조치시)', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                              ],
                            ),

                            Column(
                              children: [
                                Container(
                                    decoration: const BoxDecoration(
                                      color: Colors.grey,
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight * 2,
                                    width: 100,
                                    child: const Text('작업여부\n(가능/불가)', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                                Container(
                                    decoration: const BoxDecoration(
                                      border: Border(
                                        right: BorderSide(color: Colors.black, width: 1.0),
                                        bottom: BorderSide(color: Colors.black, width: 1.0),
                                      ),
                                    ),
                                    alignment: Alignment.center,
                                    height: smallRowHeight,
                                    width: 100,
                                    child: const Text('', style: TextStyle(fontSize: 14)),
                                ),
                              ],
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 600,
                                child: const Text('위험성평가 및 관리 기준', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 600,
                                child: const Text('『위험성평가 후 교육』서명란', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 200,
                                child: const Text('위험성', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 400,
                                child: const Text('평 가 기 준', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('이름', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('서명', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('이름', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('서명', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('이름', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  color: Colors.grey,
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('서명', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),
 
                         Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 200,
                                child: const Text('상(20)', style: TextStyle(fontSize: 14, color: Colors.blue)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 400,
                                child: const Text('위험이 장시간 상시 존재 or 사고시 중상 이상 위험', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ),
 
                          Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 200,
                                child: const Text('중(9~16)', style: TextStyle(fontSize: 14, color: Colors.blue)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 400,
                                child: const Text('위험이 단시간 간헐적 존재 or 사고시 경상 위험', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ), 

                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 200,
                                child: const Text('하(1~8)', style: TextStyle(fontSize: 14, color: Colors.blue)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 400,
                                child: const Text('위험이 매우적음 or 사고시 타박상 이하 위험', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ), 


                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: smallRowHeight,
                                width: 600,
                                child: const Text('※ 관리기준 : 상, 중 - 작업불가 / 하 - 작업가능', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ), 


                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: smallRowHeight,
                                width: 600,
                                child: const Text('※ 현재 위험성이"하"인 경우 위험감소 조치(방법) 없이 작업가능', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ), 

                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: smallRowHeight,
                                width: 600,
                                child: const Text('※ 위험성 평가는 기 검토된 공정별 위험성평가 결과를 활용하여 작성·시행하며,', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ), 

                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: smallRowHeight,
                                width: 600,
                                child: const Text('   작업중 위험성 확인 및 조치는 본 위험성 평가의 위험감소 조치(방법)와', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ), 

 
                         Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: smallRowHeight,
                                width: 600,
                                child: const Text('   위험성 Cheak List에 준하여 시행', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ), 

                         Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: smallRowHeight,
                                width: 600,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ), 

                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: smallRowHeight,
                                width: 600,
                                child: const Text('※ 위험성 추정 : 가능성(5), 중대성(4) 곱으로 산출', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 100,
                                child: const Text('', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ), 

                        Row(
                          children: [
                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.centerLeft,
                                height: smallRowHeight,
                                width: 600,
                                child: const Text('※ 업무분담 밑부분은 수기작성, 워드작업 불가', style: TextStyle(fontSize: 14)),
                            ),

                            Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    right: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.center,
                                height: smallRowHeight,
                                width: 600,
                                child: const Text('※ 작업자는 산업재해가 발생할 급박한 위험이 있는 경우 작업을 중지하고 대피할 수 있다.', style: TextStyle(fontSize: 14)),
                            ),
                          ],
                        ), 
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}