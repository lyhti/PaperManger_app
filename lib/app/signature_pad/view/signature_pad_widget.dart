import 'dart:ui' as ui;
import 'dart:io';

import '../../../common/util.dart';

import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:uri_to_file/uri_to_file.dart';
import 'package:syncfusion_flutter_signaturepad/signaturepad.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignaturePadWidget extends StatelessWidget {
  final GlobalKey<SfSignaturePadState> _signaturePadKey = GlobalKey();
  Color? backgroundColor;

  SignaturePadWidget({Key? key, this.backgroundColor}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (Platform.isAndroid) {backgroundColor = Colors.white;}
    if (Platform.isIOS) {backgroundColor = Colors.transparent;}

    return Scaffold(
      appBar: AppBar(title: Text('${Get.arguments['title']} 사인')),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(10),
            child: Container(
              decoration: BoxDecoration(border: Border.all()),
              child: SfSignaturePad(
                  key: _signaturePadKey,
                  backgroundColor: backgroundColor,
                  minimumStrokeWidth: 10.0,
                  maximumStrokeWidth: 15.0
              ),
            ),
          ),
          // Container(
          //   decoration: BoxDecoration(border: Border.all()),
          //   child: Signature(
          //     // width: 300,
          //     height: 230,
          //     controller: controller,
          //     backgroundColor: Colors.white.withOpacity(0)
          //   )
          // ),

          const SizedBox(height: 10),

          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              TextButton(
                onPressed: () async {
                  ui.Image data = await _signaturePadKey.currentState!.toImage(pixelRatio: 3.0);
                  final bytes = await data.toByteData(format: ui.ImageByteFormat.png);
                  var uriToFile;

                  Util.print(data);

                  // 아무 작업 없이 사인 저장 시,
                  if (bytes!.buffer.lengthInBytes != 4896) {
                    // 이미지 갤러리 저장
                    var result = await ImageGallerySaver.saveImage(bytes.buffer.asUint8List(), isReturnImagePathOfIOS: true);

                    // uri to files
                    uriToFile = await toFile(result['filePath']);

                    Util.print(result.toString());
                  }

                  Util.print(uriToFile.runtimeType);

                  Get.back(result: uriToFile);

                  // signature = await controller.toPngBytes();
                  // Util.print(signature);
                  //
                  // // requesting for permission
                  // final status = await Permission.storage.status;
                  // if (!status.isGranted) {
                  //   await Permission.storage.request();
                  // }
                  //
                  // // saving signature to gallery
                  // final result = await ImageGallerySaver.saveImage(signature, isReturnImagePathOfIOS: true);
                  // Util.print(result['filePath'].runtimeType);
                  //
                  // var uriToFile = await toFile(result['filePath']);
                  //
                  // Get.back(result: uriToFile);
                },
                child: const Text('저장')
              ),
              TextButton(
                onPressed: () {
                  _signaturePadKey.currentState!.clear();
                },
                child: const Text('초기화')
              ),
            ],
          ),
        ],
      ),
    );
  }
}