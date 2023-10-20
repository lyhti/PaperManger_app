import 'dart:io';

import '../../../../../services/global_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../empty_view.dart';
import '../../controller/rsk_asmt_pwrt_ovhd_srvy_controller.dart';

class RskAsmtPwrtOvhdSrvyTable01ViewWidget extends GetView<RskAsmtPwrtOvhdSrvyController> {
  final global = Get.find<GlobalService>();

  RskAsmtPwrtOvhdSrvyTable01ViewWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (controller.isLoading.isFalse) {
      return SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Obx(() => Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(controller.tab1Title.value),
                    ],
                  ),

                  const SizedBox(height: 20,),

                  Row(
                    children: [

                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                color: Colors.grey,
                                border: Border.all(),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('작업공정', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
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
                              height: 60,
                              width: 200,
                              child: const Text('원(재)료', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Colors.black, width: 1.0),
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('가공송전선로 건설\n- 측량시행'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('측량기'),
                          ),
                        ],
                      ),

                      Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 1.0),
                              right: BorderSide(color: Colors.black, width: 1.0),
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 120,
                          width: 600,
                          child: const Text('① 작업공정 안전보건정보', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                      ),

                      Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                color: Colors.grey,
                                border: Border(
                                  top: BorderSide(color: Colors.black, width: 1.0),
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 150,
                              child: const Text('사업소명\n(부서명)', style: TextStyle(fontWeight: FontWeight.bold),),
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
                              height: 60,
                              width: 150,
                              child: const Text('작업참여\n근로자수', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  top: BorderSide(color: Colors.black, width: 1.0),
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 400,
                              child: const Text(''),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 400,
                              child: const Text(''),
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
                              right: BorderSide(color: Colors.black, width: 1.0),
                              left: BorderSide(color: Colors.black, width: 1.0),
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 120,
                          width: 200,
                          child: const Text('작업공정 순서도\n(활동내용)', style: TextStyle(fontWeight: FontWeight.bold),),
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
                          height: 120,
                          width: 120,
                          child: const Text('투입인원\n(공종/인)', style: TextStyle(fontWeight: FontWeight.bold),),
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
                              height: 60,
                              width: 340,
                              child: const Text('기계ㆍ기구ㆍ설비', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),

                          Row(
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
                                  height: 60,
                                  width: 240,
                                  child: const Text('기계ㆍ기구ㆍ설비명', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                  height: 60,
                                  width: 100,
                                  child: const Text('수량', style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
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
                              height: 60,
                              width: 340,
                              child: const Text('유해화학물질', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),

                          Row(
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
                                  height: 60,
                                  width: 170,
                                  child: const Text('화학물질명\n(취급/노출자)', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                  height: 60,
                                  width: 170,
                                  child: const Text('취급량/일\n(취급시간)', style: TextStyle(fontWeight: FontWeight.bold),),
                              ),
                            ],
                          ),

                        ],
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
                          height: 120,
                          width: 550,
                          child: const Text('안전보건상 잠재 위험요인 검토항목\n(노동자 구성, 작업환경, 장비, 교육 등)', style: TextStyle(fontWeight: FontWeight.bold),),
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
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('경과지 도상검토'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('지장수목 제거'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('철탑부지 측량'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('말뚝박기'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('중심종단측량'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('평면측량'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('소유권 조사'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('도면 작성'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('경과지 지장물 조사'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 200,
                              child: const Text('검측시행'),
                          ),

                        ],
                      ),

                      Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 120,
                              child: const Text('작업 / 1인'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 120,
                              child: const Text('작업 / 2인'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 120,
                              child: const Text('작업 / 2인'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 120,
                              child: const Text('작업 / 2인'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 120,
                              child: const Text('작업 / 2인'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 120,
                              child: const Text('작업 / 2인'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 120,
                              child: const Text('작업 / 1인'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 120,
                              child: const Text('작업 / 1인'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 120,
                              child: const Text('작업 / 1인'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 120,
                              child: const Text('작업 / 2인'),
                          ),
                        ],
                      ),

                      Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: 60,
                              width: 240,
                              child: const Text('ㆍ 1:25,000 지형도\nㆍ 1:5,000 지형도'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: 60,
                              width: 240,
                              child: const Text('ㆍ 톱, 낫\nㆍ 로프'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: 60,
                              width: 240,
                              child: const Text('ㆍ 광파 측량기\nㆍ 스태프(Staff)'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: 60,
                              width: 240,
                              child: const Text('ㆍ 표지말뚝\nㆍ 해머'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: 60,
                              width: 240,
                              child: const Text('ㆍ 광파 측량기\nㆍ 스태프(Staff)'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: 60,
                              width: 240,
                              child: const Text('ㆍ 광파 측량기\nㆍ 스태프(Staff)'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 240,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: 60,
                              width: 240,
                              child: const Text('ㆍ 컴퓨터(CAD)'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 240,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: 60,
                              width: 240,
                              child: const Text('ㆍ 광파 측량기\nㆍ 스태프(Staff)'),
                          ),

                        ],
                      ),

                      Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 100,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 100,
                              child: const Text('1\n1'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 100,
                              child: const Text('1\n1'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 100,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 100,
                              child: const Text('1\n1'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 100,
                              child: const Text('1\n1'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 100,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 100,
                              child: const Text('1'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 100,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 100,
                              child: const Text('1\n1'),
                          ),

                        ],
                      ),

                      Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),

                        ],
                      ),

                      Column(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 60,
                              width: 170,
                              child: const Text('-'),
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
                          height: 600,
                          width: 550,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text('○ 근로자 구성 및 경력특성'),

                              Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 50),
                                child: Row(
                                  children: [
                                    Column(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(color: Colors.black, width: 1.0),
                                                left: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 180,
                                            child: const Text('여성근로자'),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                left: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 180,
                                            child: const Text('고령근로자'),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                left: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 180,
                                            child: const Text('미성년 근로자'),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                left: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 180,
                                            child: const Text('외국인 근로자'),
                                        ),
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(color: Colors.black, width: 1.0),
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 40,
                                            child: const Text('□'),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 40,
                                            child: const Text('□'),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 40,
                                            child: const Text('□'),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 40,
                                            child: const Text('□'),
                                        ),
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 180,
                                            child: const Text('1년 미만 미숙련자'),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 180,
                                            child: const Text('비정규직 근로자'),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 180,
                                            child: const Text('일용직 근로자'),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 180,
                                            child: const Text('지체장애 근로자'),
                                        ),
                                      ],
                                    ),

                                    Column(
                                      children: [
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                top: BorderSide(color: Colors.black, width: 1.0),
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 40,
                                            child: const Text('□'),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 40,
                                            child: const Text('□'),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 40,
                                            child: const Text('□'),
                                        ),
                                        Container(
                                            decoration: const BoxDecoration(
                                              border: Border(
                                                right: BorderSide(color: Colors.black, width: 1.0),
                                                bottom: BorderSide(color: Colors.black, width: 1.0),
                                              ),
                                            ),
                                            alignment: Alignment.center,
                                            height: 40,
                                            width: 40,
                                            child: const Text('□'),
                                        ),
                                      ],
                                    ),

                                    // Container(
                                    //     decoration: BoxDecoration(
                                    //       border: Border.all(),
                                    //     ),
                                    //     alignment: Alignment.center,
                                    //     height: 150,
                                    //     width: 180,
                                    //     child: const Text('-'),
                                    // ),
                                    // Container(
                                    //     decoration: BoxDecoration(
                                    //       border: Border.all(),
                                    //     ),
                                    //     alignment: Alignment.center,
                                    //     height: 150,
                                    //     width: 40,
                                    //     child: const Text('-'),
                                    // ),
                                    // Container(
                                    //     decoration: BoxDecoration(
                                    //       border: Border.all(),
                                    //     ),
                                    //     alignment: Alignment.center,
                                    //     height: 150,
                                    //     width: 180,
                                    //     child: const Text('-'),
                                    // ),
                                    // Container(
                                    //     decoration: BoxDecoration(
                                    //       border: Border.all(),
                                    //     ),
                                    //     alignment: Alignment.center,
                                    //     height: 150,
                                    //     width: 40,
                                    //     child: const Text('-'),
                                    // ),
                                  ],
                                ),
                              ),

                              const Text('○ 교대작업 유무(유 □, 무 □)'),
                              const Text('○ 잦은 작업자 교체, 이직(유 □, 무 □)'),
                              const Text('○ 작업 위치의 빈번한 변경, 이동(유 □, 무 □)'),
                              const Text('○ 1인 단독작업 유뮤(유 □, 무 □)'),
                              const Text('○ 야간작업(유 □, 무 □)'),
                              const Text('○ 작업중 의사소통 가능여부(유 □, 무 □)'),
                              const Text('○ 운반수단(기계 □, 인력 □)'),
                              const Text('○ 중량물 인력취급시 단위중량 및 취급형태'),
                              const Text('(들기 □, 밀기 □, 끌기 □)'),
                              const Text('○ 작업환경측정 (조명, 소음, 유해 기체 등) 측정유무'),
                              const Text('(측정 □, 미측정 □, 해당무 □)'),
                              const Text('○ 밀폐공간, 고소작업, 고열발생 해당(유 □, 무 □)'),
                              const Text('○ 작업지역내 외부인 접근 가능성(유 □, 무 □)'),
                              const Text('○ 작업 특별안전교육 필요성(유 □, 무 □)'),
                            ]
                          ),
                      ),

                    ],
                  ),
                ],
              )),
            ),
          ),
        ),
      );
    } else {
      return const EmptyViewWidget();
    }
  }
}