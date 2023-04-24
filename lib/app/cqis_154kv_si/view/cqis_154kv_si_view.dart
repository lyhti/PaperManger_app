import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controller/cqis_154kv_si_controller.dart';
import './cqis_154kv_si_botton_widget.dart';
import '../../../common/main_app_bar_widget.dart';
import '../../../common/menu_button_widget.dart';
import '../../../common/ui.dart';
import '../../../common/util.dart';
import '../../../services/global_service.dart';

class Cqis154kvSiViewWidget extends GetView<Cqis154kVSiController> {
  final global = Get.find<GlobalService>();

  Cqis154kvSiViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // 처음 페이지 진입 시, 화면 전체 Loader
    if (controller.isLoading.isTrue) {
      Util.overlayLoaderStart(context);
    }

    double tableFontSize = 14.0;

    return GetBuilder<Cqis154kVSiController>(init: Cqis154kVSiController(), builder: (controller) {
      return GestureDetector(
        onTap: () {FocusScope.of(context).unfocus();},
        child: Scaffold(
          appBar: MainAppBarWidget(appBar: AppBar(), subTitle: '154kV Sh.C 설치(철거)'),
          endDrawer: MenuButtonWidget(),
          bottomNavigationBar: Cqis154kvSiBottomWidget(),     // const 추가 시, GetBuilder 적용 안됨
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
                      child: Obx(() => Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 280,
                                      child: Ui.inspectionTitleText('시공품질점검표')
                                  ),
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rlb'),
                                      alignment: Alignment.center,
                                      height: 40,
                                      width: 280,
                                      child: Ui.inspectionTitleText('CQ-03-0290')
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rlb'),
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: 120,
                                          child: Ui.inspectionTitleText('분야')
                                      ),
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rb'),
                                          alignment: Alignment.center,
                                          height: 40,
                                          width: 160,
                                          child: Ui.inspectionTitleText('변전')
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'trb'),
                                  alignment: Alignment.center,
                                  height: 120,
                                  width: 80,
                                  child: Ui.inspectionTitleText('공종명')
                              ),
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'trb'),
                                  alignment: Alignment.center,
                                  height: 120,
                                  width: 240,
                                  child: Ui.inspectionTitleText('154kV Sh.C 설치(철거)')
                              ),
                              Column(
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'trb'),
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 100,
                                      child: Ui.inspectionTitleText('공사명')
                                  ),
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 100,
                                      child: Ui.inspectionTitleText('위치')
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Row(
                                    children: [
                                      Container(
                                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                          alignment: Alignment.center,
                                          decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'trb'),
                                          height: 60,
                                          width: 200,
                                          child: TextField(
                                            controller: controller.textController['sub_sttn_nm'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.all(5.0),
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                            ),
                                            readOnly: controller.readOnlyYn.value,
                                          ),
                                      ),
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'trb'),
                                          alignment: Alignment.center,
                                          height: 60,
                                          width: 80,
                                          child: Ui.inspectionTitleText('S/S')
                                      ),
                                      Container(
                                          padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                          alignment: Alignment.center,
                                          decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'trb'),
                                          height: 60,
                                          width: 250,
                                          child: TextField(
                                            controller: controller.textController['eqp_nm'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.all(5.0),
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                            ),
                                            readOnly: controller.readOnlyYn.value,
                                          ),
                                      ),
                                    ],
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 530,
                                      child: TextField(
                                        controller: controller.textController['location'],
                                        textAlign: TextAlign.center,
                                        style: const TextStyle(fontSize: 18),
                                        decoration: InputDecoration(
                                          contentPadding: const EdgeInsets.all(5.0),
                                          border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none),                                          
                                        ),
                                        readOnly: controller.readOnlyYn.value,
                                      ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Container(
                                decoration: const BoxDecoration(
                                  border: Border(
                                    left: BorderSide(color: Colors.black, width: 1.0),
                                    bottom: BorderSide(color: Colors.black, width: 1.0),
                                  ),
                                ),
                                alignment: Alignment.topLeft,
                                height: 350,
                                width: 615,
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        RichText(
                                          text: const TextSpan(
                                            text: '1. 기초점검 : ',
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                            children: [
                                              TextSpan(
                                                text: '상부수평±2mm, 배수홈 시공여부',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                                              ),
                                            ]
                                          ),
                                        ),

                                        const SizedBox(height: 10),
                                
                                        RichText(
                                          text: const TextSpan(
                                            text: '2. 앵커볼트길이 적정여부 : ',
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                            children: [
                                              TextSpan(
                                                text: 'Double num상부수평+5',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                                              ),
                                            ]
                                          ),
                                        ),

                                        const SizedBox(height: 10),

                                        RichText(
                                          text: const TextSpan(
                                            text: '3. 기기가대 조립상태 : ',
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                            children: [
                                              TextSpan(
                                                text: '조립도면과 일치할 것',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                                              ),
                                            ]
                                          ),
                                        ),

                                        const SizedBox(height: 10),

                                        const Text('4. 볼트취부형 크램프 적정성', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                                        const Text('   4.1 외관의 균열여부 : ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),
                                        const Text('   4.2 전선의 접촉면 : 불순물, 산화물 제거', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),
                                        const Text('   4.3 볼트길이 여유도 : 조임후 6mm', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),

                                        const SizedBox(height: 10),

                                        const Text('5. 외부일반', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                                        const Text('   5.1 녹슬음 및 파손변형 여부', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),
                                        const Text('   5.2 애자 균열 및 오손여부', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),
                                        const Text('   5.3 단자 볼트조임', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),
                                        const Text('      - 재질별, 규격별 규정 Torque[공용 13 참조] 사용', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),
                                      ]
                                    ),
                                ),
                                
                              ),
                              Container(
                                  decoration: const BoxDecoration(
                                    border: Border(
                                      right: BorderSide(color: Colors.black, width: 1.0),
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.topLeft,
                                  height: 350,
                                  width: 615,
                                  child: Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        const SizedBox(height: 10),
                                
                                        const Text('6. 절연저항 측정(외함과 단자사이)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                                        const Text('   - 1000V 2000MΩ : 1000MΩ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),

                                        const SizedBox(height: 10),

                                        RichText(
                                          text: const TextSpan(
                                            text: '7. cell 용량 측정 : ',
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                            children: [
                                              TextSpan(
                                                text: 'cell 정격올량의-5%~+10%',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                                              ),
                                            ]
                                          ),
                                        ),

                                        const SizedBox(height: 10),
                                
                                        RichText(
                                          text: const TextSpan(
                                            text: '8. cell case 팽창도 측정 : ',
                                            style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                                            children: [
                                              TextSpan(
                                                text: 'cell 규격의 편측당 20mm 이내',
                                                style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal),
                                              ),
                                            ]
                                          ),
                                        ),

                                        const SizedBox(height: 10),

                                        const Text('9. 리액터 용량 측정', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                                        const Text('   ABB제: 80.25mH 60HZ COPPER제 : 35mH 60HZ', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),

                                        const SizedBox(height: 10),

                                        const Text('10. 중성점 저항 측정', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                                        const Text('   ABB제: 50Ω±5% COPPER제: 50Ω±5%', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),

                                        const SizedBox(height: 10),

                                        const Text('11. 중성점 CT비 측정', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),),
                                        const Text('   ABB제: 50:5(unbalance CT), 100:1(NEUTRAL)', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),
                                        const Text('   COOPER제: 50:5', style: TextStyle(fontSize: 16, fontWeight: FontWeight.normal, color: Colors.black),),
                                      ],
                                    ),
                                  ),
                              ),
                            ]
                          ),
                          Row(
                            children: [
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rlb'),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 80,
                                  child: Ui.inspectionTitleText('구분')
                              ),
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rb'),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 200,
                                  child: Ui.inspectionTitleText('기준치')
                              ),
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rb'),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 150,
                                  child: Ui.inspectionTitleText('측정치')
                              ),
                              Column(
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.center,
                                      height: 30,
                                      width: 200,
                                      child: Ui.inspectionTitleText('측정')
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rb'),
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 100,
                                          child: Ui.inspectionTitleText('월일')
                                      ),
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rb'),
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 100,
                                          child: Ui.inspectionTitleText('성명')
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
                                      height: 30,
                                      width: 200,
                                      child: Ui.inspectionTitleText('Supervisor')
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rb'),
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 100,
                                          child: Ui.inspectionTitleText('성명')
                                      ),
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rb'),
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 100,
                                          child: Ui.inspectionTitleText('판정')
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
                                      height: 30,
                                      width: 300,
                                      child: Ui.inspectionTitleText('확인')
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rb'),
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 100,
                                          child: Ui.inspectionTitleText('월일')
                                      ),
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rb'),
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 100,
                                          child: Ui.inspectionTitleText('성명')
                                      ),
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rb'),
                                          alignment: Alignment.center,
                                          height: 30,
                                          width: 100,
                                          child: Ui.inspectionTitleText('판정')
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                  decoration: Ui.boxDecoration(borderType: 'rb'),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 100,
                                  child: Ui.inspectionTitleText('작업 종사자')
                              ),
                            ],
                          ),
                          Row(
                            children: [
                              Column(
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rlb'),
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 80,
                                      child: Ui.inspectionTitleText('1'),
                                  ),
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rlb'),
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 80,
                                      child: Ui.inspectionTitleText('2'),
                                  ),
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rlb'),
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 80,
                                      child: Ui.inspectionTitleText('3'),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rlb'),
                                          alignment: Alignment.center,
                                          height: 180,
                                          width: 40,
                                          child: Ui.inspectionTitleText('4'),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                              decoration: Ui.boxDecoration(borderType: 'rb'),
                                              alignment: Alignment.center,
                                              height: 60,
                                              width: 40,
                                              child: Ui.inspectionTitleText('4.1'),
                                          ),
                                          Container(
                                              decoration: Ui.boxDecoration(borderType: 'rb'),
                                              alignment: Alignment.center,
                                              height: 60,
                                              width: 40,
                                              child: Ui.inspectionTitleText('4.2'),
                                          ),
                                          Container(
                                              decoration: Ui.boxDecoration(borderType: 'rb'),
                                              alignment: Alignment.center,
                                              height: 60,
                                              width: 40,
                                              child: Ui.inspectionTitleText('4.3'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  Row(
                                    children: [
                                      Container(
                                          decoration: Ui.boxDecoration(borderType: 'rlb'),
                                          alignment: Alignment.center,
                                          height: 180,
                                          width: 40,
                                          child: Ui.inspectionTitleText('5'),
                                      ),
                                      Column(
                                        children: [
                                          Container(
                                              decoration: Ui.boxDecoration(borderType: 'rb'),
                                              alignment: Alignment.center,
                                              height: 60,
                                              width: 40,
                                              child: Ui.inspectionTitleText('5.1'),
                                          ),
                                          Container(
                                              decoration: Ui.boxDecoration(borderType: 'rb'),
                                              alignment: Alignment.center,
                                              height: 60,
                                              width: 40,
                                              child: Ui.inspectionTitleText('5.2'),
                                          ),
                                          Container(
                                              decoration: Ui.boxDecoration(borderType: 'rb'),
                                              alignment: Alignment.center,
                                              height: 60,
                                              width: 40,
                                              child: Ui.inspectionTitleText('5.3'),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rlb'),
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 80,
                                      child: Ui.inspectionTitleText('6'),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rlb'),
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 80,
                                      child: Ui.inspectionTitleText('7'),
                                  ),
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rlb'),
                                      alignment: Alignment.center,
                                      height: 60,
                                      width: 80,
                                      child: Ui.inspectionTitleText('8'),
                                  ),
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rlb'),
                                      alignment: Alignment.center,
                                      height: 80,
                                      width: 80,
                                      child: Ui.inspectionTitleText('9'),
                                  ),
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rlb'),
                                      alignment: Alignment.center,
                                      height: 80,
                                      width: 80,
                                      child: Ui.inspectionTitleText('10'),
                                  ),
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rlb'),
                                      alignment: Alignment.center,
                                      height: 120,
                                      width: 80,
                                      child: Ui.inspectionTitleText('11'),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('상부수평±2mm\n배수홈 시공'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('Double nut±5mm'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('조립도면'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('균열 여부'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('불순물, 산화물 제거'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('조임후 6mm'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('녹슴, 파손변형여부'),
                                      ),
                                  ),
                                
                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('애자균열, 오손여부'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('단자 볼트 조임'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('1000MΩ'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('cell 정격용량의\n-5%~+10%'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('cell 규격의 편측당\n20mm 이내'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('ABB제: 80.25mH 60HZ\nCOPPER제: 35mH 60HZ'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('ABB제: 50Ω±5%\nCOPPER제: 35mH 60HZ'),
                                      ),
                                  ),

                                  Container(
                                      decoration: Ui.boxDecoration(borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 120,
                                      width: 200,
                                      child: Padding(
                                        padding: const EdgeInsets.symmetric(horizontal: 8.0),
                                        child: Ui.inspectionTitleText('ABB제: 50:5(unbalance CT), 100:1(NEUTRAL)\nCOPPER제: 50:5'),
                                      ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_4-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_4-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_4-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_5-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_5-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_5-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_6'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_7'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_8'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_9'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_10'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 120,
                                      width: 150,
                                        child: TextField(
                                            controller: controller.textController['msrm_val_11'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                ],
                              ),
                              Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                      child: TextField(
                                          controller: controller.textController['msrm_md_1'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.all(5.0),
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                      ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                      child: TextField(
                                          controller: controller.textController['msrm_md_2'],
                                          textAlign: TextAlign.center,
                                          style: const TextStyle(fontSize: 18),
                                          decoration: InputDecoration(
                                              contentPadding: const EdgeInsets.all(5.0),
                                              border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                          ),
                                          readOnly: controller.readOnlyYn.value
                                      ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_4-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_4-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_4-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_5-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_5-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_5-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_6'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_7'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_8'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_9'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_10'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 120,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_md_11'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),

                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_4-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_4-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_4-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_5-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_5-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_5-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_6'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_7'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_8'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_9'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_10'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 120,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_nm_11'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),

                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_4-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_4-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_4-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_5-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_5-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_5-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_6'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_7'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_8'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_9'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_10'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 120,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_nm_11'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),

                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_4-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_4-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_4-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_5-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_5-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_5-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_6'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_7'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_8'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_9'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_10'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 120,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_spvs_eval_11'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),

                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_4-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_4-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_4-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_5-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_5-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_5-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_6'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_7'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_8'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_9'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_10'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 120,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_md_11'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),

                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_4-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_4-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_4-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_5-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_5-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_5-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_6'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_7'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_8'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_9'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_10'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 120,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_nm_11'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),

                                ],
                              ),

                              Column(
                                children: [
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_4-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_4-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_4-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_5-1'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_5-2'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_5-3'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_6'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_7'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 60,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_8'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_9'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 80,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_10'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),
                                  Container(
                                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                      decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                      alignment: Alignment.centerLeft,
                                      height: 120,
                                      width: 100,
                                        child: TextField(
                                            controller: controller.textController['msrm_cnfr_eval_11'],
                                            textAlign: TextAlign.center,
                                            style: const TextStyle(fontSize: 18),
                                            decoration: InputDecoration(
                                                contentPadding: const EdgeInsets.all(5.0),
                                                border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                            ),
                                            readOnly: controller.readOnlyYn.value
                                        ),
                                  ),

                                ],
                              ),
                              Container(
                                padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                                decoration: Ui.boxDecoration(crud: controller.crud.value, borderType: 'rb'),
                                alignment: Alignment.center,
                                height: 1000,
                                width: 100,
                                child: TextField(
                                    controller: controller.textController['worker'],
                                    textAlign: TextAlign.center,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 1,
                                    maxLines: 30,
                                    readOnly: controller.readOnlyYn.value
                                ),
                              ),
                            ],
                            
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.topLeft,
                              height: 45,
                              width: 1230,
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Ui.inspectionTitleText('※ 특기사항'),
                              ),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.topLeft,
                              height: 120,
                              width: 1230,
                              // child: Padding(
                              //   padding: const EdgeInsets.all(8.0),
                              //   child: Ui.inspectionTitleText('※ 특기사항'),
                              // ),
                              child: Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: TextField(
                                    controller: controller.textController['rmrk'],
                                    textAlign: TextAlign.start,
                                    style: const TextStyle(fontSize: 18),
                                    decoration: InputDecoration(
                                        contentPadding: const EdgeInsets.all(5.0),
                                        border: (controller.crud.value != 'crud-r' ? const OutlineInputBorder() : InputBorder.none)
                                    ),
                                    minLines: 3,
                                    maxLines: null,
                                    readOnly: controller.readOnlyYn.value
                                ),
                              ),
                          ),
                        ],
                        )
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      );
    });
  }
}
