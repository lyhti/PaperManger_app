import '../../../../../services/global_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../empty_view.dart';
import '../../controller/rsk_asmt_pwrt_ovhd_srvy_controller.dart';

class RskAsmtPwrtOvhdSrvyTable02ViewWidget extends GetView<RskAsmtPwrtOvhdSrvyController> {
  final global = Get.find<GlobalService>();

  RskAsmtPwrtOvhdSrvyTable02ViewWidget({Key? key}) : super(key: key);

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
                      Text(controller.tab2Title.value),
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
                              width: 100,
                              child: const Text('평가대상\n공정(작업)명', style: TextStyle(fontWeight: FontWeight.bold),),
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
                              width: 100,
                              child: const Text('평가일시', style: TextStyle(fontWeight: FontWeight.bold),),
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
                              child: const Text('2019. 9.30'),
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
                          width: 720,
                          child: const Text('② 위험성평가 추정·결정', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
                      ),

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
                          height: 120,
                          width: 100,
                          child: const Text('위험성\n평가\n참여자', style: TextStyle(fontWeight: FontWeight.bold),),
                      ),

                      Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              top: BorderSide(color: Colors.black, width: 1.0),
                              right: BorderSide(color: Colors.black, width: 1.0),
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          height: 120,
                          width: 430,
                          child: const Text('(사업소) 차장 -\n(본 사) 차장 -'),
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
                              right: BorderSide(color: Colors.black, width: 1.0),
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 120,
                          width: 100,
                          child: const Text('작업내용', style: TextStyle(fontWeight: FontWeight.bold),),
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
                          width: 50,
                          child: const Text('평가\n구분', style: TextStyle(fontWeight: FontWeight.bold),),
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
                          width: 300,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('유해·위험요인 파악', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('추락, 낙하물, 충돌, 끼임·넘어짐, 접촉, 노출 /', style: TextStyle(fontSize: 12),),
                              Text('생물, 화학, 근골격, 정신', style: TextStyle(fontSize: 12),),
                            ],
                          ),
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
                          width: 150,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('사고발생시', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('피해(예상)자', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('(위험노출자)', style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
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
                          width: 270,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: const [
                              Text('현재의', style: TextStyle(fontWeight: FontWeight.bold),),
                              Text('안전보건조치', style: TextStyle(fontWeight: FontWeight.bold),),
                            ],
                          ),
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
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('현재 위험성', style: TextStyle(fontWeight: FontWeight.bold),),
                                  Text('추정·결정', style: TextStyle(fontWeight: FontWeight.bold),),
                                ],
                              ),
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
                                  width: 50,
                                  child: const Text('가능성', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                  width: 50,
                                  child: const Text('중대성', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                  width: 50,
                                  child: const Text('위험성', style: TextStyle(fontWeight: FontWeight.bold),),
                              ),

                            ],
                          ),
                        ],
                      ),

                      Column(
                        children: [
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
                                  width: 380,
                                  child: const Text('위험성 감소대책 (위험성 ≥ 9)', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                  child: const Text('대책실행 후 위험성 추정', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                      bottom: BorderSide(color: Colors.black, width: 1.0),
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: 60,
                                  width: 280,
                                  child: const Text('추가 조치방안', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                  child: const Text('RISK 코드', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                  width: 50,
                                  child: const Text('가능성', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                  width: 50,
                                  child: const Text('중대성', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                  width: 50,
                                  child: const Text('위험성', style: TextStyle(fontWeight: FontWeight.bold),),
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
                            border: Border(
                              left: BorderSide(color: Colors.black, width: 1.0),
                              right: BorderSide(color: Colors.black, width: 1.0),
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 120,
                          width: 100,
                          child: const Text('지장수목 제거'),
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.black, width: 1.0),
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 120,
                          width: 50,
                          child: const Text('사람(A)'),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black, width: 1.0),
                            bottom: BorderSide(color: Colors.black, width: 1.0),
                          ),
                        ),
                        alignment: Alignment.center,
                        height: 120,
                        width: 300,
                        child: RichText(
                          text: const TextSpan(
                            text: '· 안전모, 보호장갑, 안전화 미착용으로 신체찔림, ',
                            style: TextStyle(color: Colors.black),
                            children: <TextSpan> [
                              TextSpan(text: '전기톱 사용우려 ', style: TextStyle(color: Colors.blue)),
                              TextSpan(text: '및 유해 동식물 상해')
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
                          alignment: Alignment.center,
                          height: 120,
                          width: 150,
                          child: const Text('작업자'),
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.black, width: 1.0),
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 120,
                          width: 270,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children:  const [
                              Text('· 개인보호구 사용'),
                              Text('· 전기톱 사용등에 대한 사전 안전교육 시행', style: TextStyle(color: Colors.blue),),
                              Text('· 지장수목 제거후 측량시행'),
                              Text('· 백반 및 각반 등에 의한 사전예방', style: TextStyle(color: Colors.blue),),
                            ],
                          ),
                      ),

                      Row(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('2'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('2'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('4'),
                          ),
                        ]
                      ),

                      Row(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 280,
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
                              height: 120,
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
                              height: 120,
                              width: 50,
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
                              height: 120,
                              width: 50,
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
                              height: 120,
                              width: 50,
                              child: const Text('-'),
                          ),
                        ],
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
                                  left: BorderSide(color: Colors.black, width: 1.0),
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 480,
                              width: 100,
                              child: const Text('철탑부지 측량'),
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
                              height: 360,
                              width: 50,
                              child: const Text('환경(B)'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('설비(C)'),
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
                            height: 120,
                            width: 300,
                            child: RichText(
                              text: const TextSpan(
                                text: '· 평탄지 도로인접 개소 측량시 통행차량에 의한 작업자 충돌',
                                style: TextStyle(color: Colors.black),
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
                            alignment: Alignment.center,
                            height: 120,
                            width: 300,
                            child: RichText(
                              text: const TextSpan(
                                text: '· 산악지에서 급경사면 또는 우천, 야간 악천후로 실족',
                                style: TextStyle(color: Colors.black),
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
                            alignment: Alignment.center,
                            height: 120,
                            width: 300,
                            child: const Text('· 측량말뚝 인지불가로 작업자 및 일반인 보행자 걸려 넘어짐'),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black, width: 1.0),
                                bottom: BorderSide(color: Colors.black, width: 1.0),
                              ),
                            ),
                            alignment: Alignment.center,
                            height: 120,
                            width: 300,
                            child: RichText(
                              text: const TextSpan(
                                text: '· 측량기 지지대, 스타프 등 장비에 의한 인근 작업자 찔림, ',
                                style: TextStyle(color: Colors.black),
                                children: <TextSpan> [
                                  TextSpan(text: '톱 및 해머 등 관리 소홀에 따른 베임', style: TextStyle(color: Colors.blue)),
                                ]
                              ),
                            ),
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
                              height: 120,
                              width: 150,
                              child: const Text('작업자'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 150,
                              child: const Text('작업자'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 150,
                              child: const Text('작업자'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 150,
                              child: const Text('작업자'),
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
                              height: 120,
                              width: 270,
                              child: const Text('· 2인 이상 작업조 운영'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: 120,
                              width: 270,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('· 악천후시 작업 미시행'),
                                  Text('· 주변지형 확인 후 작업', style: TextStyle(color: Colors.blue)),
                                  Text('· 개인별 통신기기 휴대'),
                                ],
                              ),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: 120,
                              width: 270,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('· 말뚝에 적색표기'),
                                  Text('· 말뚝 지면위로 노출'),
                                  Text('· 필요시 보조깃발 설치'),
                                ],
                              ),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: 120,
                              width: 270,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: const [
                                  Text('· 운반시는 상시 보호덮개, 보관백에 넣어 운송'),
                                  Text('· 사용전 관리상태 점검', style: TextStyle(color: Colors.blue)),
                                ],
                              ),
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
                              height: 120,
                              width: 50,
                              child: const Text('3'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('3'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('2'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('2'),
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
                              height: 120,
                              width: 50,
                              child: const Text('3'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('3'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('2'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('2'),
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
                              height: 120,
                              width: 50,
                              child: const Text('9'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('9'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('4'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('4'),
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
                              height: 120,
                              width: 280,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('· 교통감시, 통제자 배치'),
                                  Text('· 측량자 작업조끼 착용'),
                                ],
                              ),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.centerLeft,
                              height: 120,
                              width: 280,
                              child: RichText(
                                text: const TextSpan(
                                  text: '· 산악지 통신불량 대비 별도 무선기기 휴대',
                                  style: TextStyle(color: Colors.black),
                                  children: <TextSpan> [
                                    TextSpan(text: '(비상대비) ', style: TextStyle(color: Colors.blue)),
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
                              alignment: Alignment.centerLeft,
                              height: 120,
                              width: 280,
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
                              height: 120,
                              width: 280,
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
                              height: 120,
                              width: 100,
                              child: const Text('A-1'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 100,
                              child: const Text('A-2'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
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
                              height: 120,
                              width: 100,
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
                              height: 120,
                              width: 50,
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
                              height: 120,
                              width: 50,
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
                              height: 120,
                              width: 50,
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
                              height: 120,
                              width: 50,
                              child: const Text('-'),
                          ),
                        ]
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
                              height: 120,
                              width: 50,
                              child: const Text('3'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('3'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
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
                              height: 120,
                              width: 50,
                              child: const Text('-'),
                          ),
                        ]
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
                              height: 120,
                              width: 50,
                              child: const Text('3'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('3'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
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
                              height: 120,
                              width: 50,
                              child: const Text('-'),
                          ),
                        ]
                      ),
                    ],
                  ),

                  Row(
                    children: [
                      Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              left: BorderSide(color: Colors.black, width: 1.0),
                              right: BorderSide(color: Colors.black, width: 1.0),
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 120,
                          width: 100,
                          child: const Text('경과지 지장물 조사'),
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.black, width: 1.0),
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 120,
                          width: 50,
                          child: const Text('설비(C)'),
                      ),
                      Container(
                        decoration: const BoxDecoration(
                          border: Border(
                            right: BorderSide(color: Colors.black, width: 1.0),
                            bottom: BorderSide(color: Colors.black, width: 1.0),
                          ),
                        ),
                        alignment: Alignment.center,
                        height: 120,
                        width: 300,
                        child: const Text('· 측량중 지장물 조사 필요시 지장물 관리주체와의 협조체계 미비로 위해요인 사전인지 미흡'),
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.black, width: 1.0),
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                          alignment: Alignment.center,
                          height: 120,
                          width: 150,
                          child: const Text('작업자'),
                      ),
                      Container(
                          decoration: const BoxDecoration(
                            border: Border(
                              right: BorderSide(color: Colors.black, width: 1.0),
                              bottom: BorderSide(color: Colors.black, width: 1.0),
                            ),
                          ),
                          alignment: Alignment.centerLeft,
                          height: 120,
                          width: 270,
                          child: RichText(
                            text: const TextSpan(
                              text: '· 지장물 자체조사 ',
                              style: TextStyle(color: Colors.black),
                              children: <TextSpan> [
                                TextSpan(text: '및 사전검토 시행', style: TextStyle(color: Colors.blue)),
                              ]
                            ),
                          ),
                      ),

                      Row(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('2'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('3'),
                          ),
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 50,
                              child: const Text('6'),
                          ),
                        ]
                      ),

                      Row(
                        children: [
                          Container(
                              decoration: const BoxDecoration(
                                border: Border(
                                  right: BorderSide(color: Colors.black, width: 1.0),
                                  bottom: BorderSide(color: Colors.black, width: 1.0),
                                ),
                              ),
                              alignment: Alignment.center,
                              height: 120,
                              width: 280,
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
                              height: 120,
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
                              height: 120,
                              width: 50,
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
                              height: 120,
                              width: 50,
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
                              height: 120,
                              width: 50,
                              child: const Text('-'),
                          ),
                        ],
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