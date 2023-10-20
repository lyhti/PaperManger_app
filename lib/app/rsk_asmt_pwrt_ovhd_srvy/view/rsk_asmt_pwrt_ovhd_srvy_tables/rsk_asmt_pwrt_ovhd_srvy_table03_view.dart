import '../../../../../services/global_service.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../empty_view.dart';
import '../../controller/rsk_asmt_pwrt_ovhd_srvy_controller.dart';

class RskAsmtPwrtOvhdSrvyTable03ViewWidget extends GetView<RskAsmtPwrtOvhdSrvyController> {
  final global = Get.find<GlobalService>();

  RskAsmtPwrtOvhdSrvyTable03ViewWidget({Key? key}) : super(key: key);

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
                      Text(controller.tab3Title.value),
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
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('개선대상', style: TextStyle(fontWeight: FontWeight.bold)),
                                  Text('작업(공정)명', style: TextStyle(fontWeight: FontWeight.bold))
                                ],
                              ),
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
                              child: const Text('작성일시', style: TextStyle(fontWeight: FontWeight.bold)),
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
                              width: 150,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('가공송전선로 건설'),                                  
                                  Text('- 측량시행'),                                  
                                ],
                              ),
                              // const Text('가공송전선로 건설\n- 측량시행'),
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
                              width: 150,
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
                          width: 800,
                          child: const Text('③ 위험성 감소대책 수립 및 개선활동', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 30),),
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
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('실행', style: TextStyle(fontWeight: FontWeight.bold),),                                  
                                  Text('부서', style: TextStyle(fontWeight: FontWeight.bold),),                                  
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
                              height: 60,
                              width: 50,
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Text('확인', style: TextStyle(fontWeight: FontWeight.bold),),                                  
                                  Text('부서', style: TextStyle(fontWeight: FontWeight.bold),),                                  
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
                                top: BorderSide(color: Colors.black, width: 1.0),
                                right: BorderSide(color: Colors.black, width: 1.0),
                                bottom: BorderSide(color: Colors.black, width: 1.0),
                              ),
                            ),
                            alignment: Alignment.center,
                            height: 20,
                            width: 150,
                            child: const Text('담당', style: TextStyle(fontWeight: FontWeight.bold),),
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
                            width: 150,
                            child: const Text('', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black, width: 1.0),
                                bottom: BorderSide(color: Colors.black, width: 1.0),
                              ),
                            ),
                            alignment: Alignment.center,
                            height: 20,
                            width: 150,
                            child: const Text('담당', style: TextStyle(fontWeight: FontWeight.bold),),
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
                            width: 150,
                            child: const Text('', style: TextStyle(fontWeight: FontWeight.bold),),
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
                            height: 20,
                            width: 150,
                            child: const Text('차장', style: TextStyle(fontWeight: FontWeight.bold),),
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
                            width: 150,
                            child: const Text('', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black, width: 1.0),
                                bottom: BorderSide(color: Colors.black, width: 1.0),
                              ),
                            ),
                            alignment: Alignment.center,
                            height: 20,
                            width: 150,
                            child: const Text('차장', style: TextStyle(fontWeight: FontWeight.bold),),
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
                            width: 150,
                            child: const Text('', style: TextStyle(fontWeight: FontWeight.bold),),
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
                            height: 20,
                            width: 150,
                            child: const Text('부장', style: TextStyle(fontWeight: FontWeight.bold),),
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
                            width: 150,
                            child: const Text('', style: TextStyle(fontWeight: FontWeight.bold),),
                          ),
                          Container(
                            decoration: const BoxDecoration(
                              border: Border(
                                right: BorderSide(color: Colors.black, width: 1.0),
                                bottom: BorderSide(color: Colors.black, width: 1.0),
                              ),
                            ),
                            alignment: Alignment.center,
                            height: 20,
                            width: 150,
                            child: const Text('부장', style: TextStyle(fontWeight: FontWeight.bold),),
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
                            width: 150,
                            child: const Text('', style: TextStyle(fontWeight: FontWeight.bold),),
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
                        height: 120,
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('감소대책 수립', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('단위작업', style: TextStyle(fontWeight: FontWeight.bold)),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Container(
                            decoration: const BoxDecoration(
                              color: Colors.grey,
                              border: Border(
                                bottom: BorderSide(color: Colors.black, width: 1.0),
                              ),
                            ),
                            alignment: Alignment.center,
                            height: 60,
                            width: 60,
                            child: const Text(''),
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
                            width: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('RISK', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('코드', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
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
                            width: 60,
                            child: const Text(''),
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
                            width: 60,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('사고', style: TextStyle(fontWeight: FontWeight.bold)),
                                Text('유형', style: TextStyle(fontWeight: FontWeight.bold)),
                              ],
                            ),
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
                        width: 480,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('위험성 감소대책 상세내용', style: TextStyle(fontWeight: FontWeight.bold)),
                            Text('(위험성 평가 기록용(서식) 감소대책보다 구체적 지시)', style: TextStyle(fontSize: 12)),
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
                            width: 320,
                            child: const Text('감소대책 실행결과', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                width: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('조치', style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('결과', style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
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
                                height: 60,
                                width: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('조치', style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('기한', style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
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
                                height: 60,
                                width: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('조치', style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('담당', style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
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
                                height: 60,
                                width: 80,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: const [
                                    Text('조치', style: TextStyle(fontWeight: FontWeight.bold),),
                                    Text('완료일', style: TextStyle(fontWeight: FontWeight.bold),),
                                  ]
                                ),
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
                            width: 500,
                            child: const Text('개선활동사진', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                width: 250,
                                child: const Text('조치 전', style: TextStyle(fontWeight: FontWeight.bold),),
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
                                width: 250,
                                child: const Text('조치 후', style: TextStyle(fontWeight: FontWeight.bold),),
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
                            right: BorderSide(color: Colors.black, width: 1.0),
                            left: BorderSide(color: Colors.black, width: 1.0),
                            bottom: BorderSide(color: Colors.black, width: 1.0),
                          ),
                        ),
                        alignment: Alignment.center,
                        height: 240,
                        width: 130,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: const [
                            Text('철탑부지 측량'),
                            Text('중심종단 측량'),
                            Text('평면 측량'),
                          ],
                        ),
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
                            width: 60,
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
                            width: 60,
                            child: const Text('A-2'),
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
                            width: 60,
                            child: const Text('충돌'),
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
                            width: 60,
                            child: const Text('넘어짐'),
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
                            width: 480,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text('· 상시 작업조를 2인 1조로 편성하여 교통감시 및 통제자 배치'),                                
                                Text('· 측량작업자 형광조끼 착용으로 원거리 식별확보'),                                
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
                            width: 480,
                            child: const Text('· 산악지를 고려해 개인 휴대폰 이외에 무전기를 별도로 지급'),
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
                            width: 80,
                            child: const Text('완료'),
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
                            width: 80,
                            child: const Text('완료'),
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
                            width: 80,
                            child: const Text('즉시'),
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
                            width: 80,
                            child: const Text('즉시'),
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
                            width: 80,
                            child: const Text('작업반장'),
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
                            width: 80,
                            child: const Text('작업반장'),
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
                            width: 80,
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
                            width: 80,
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
                            width: 250,
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
                            height: 120,
                            width: 250,
                            child: const Text(''),
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
                            width: 250,
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
                            height: 120,
                            width: 250,
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
                          border: Border(
                            right: BorderSide(color: Colors.black, width: 1.0),
                            left: BorderSide(color: Colors.black, width: 1.0),
                            bottom: BorderSide(color: Colors.black, width: 1.0),
                          ),
                        ),
                        alignment: Alignment.center,
                        height: 120,
                        width: 130,
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
                        width: 60,
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
                        width: 60,
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
                        width: 480,
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
                        width: 80,
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
                        width: 80,
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
                        width: 80,
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
                        width: 80,
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
                        width: 250,
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
                        width: 250,
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
                        height: 120,
                        width: 130,
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
                        width: 60,
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
                        width: 60,
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
                        width: 480,
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
                        width: 80,
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
                        width: 80,
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
                        width: 80,
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
                        width: 80,
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
                        width: 250,
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
                        width: 250,
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