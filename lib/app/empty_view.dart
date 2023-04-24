import 'package:flutter/material.dart';

class EmptyViewWidget extends StatelessWidget {
  final String title;
  final double height;

  const EmptyViewWidget({Key? key, this.title='조회 내역 없음', this.height=200}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: height,
        child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/icon/ico_2_notice_red.png',
                height: 35,
              ),
              const SizedBox(height: 10),
              Text(title,
                style: const TextStyle(
                  color: Color(0xff9b9b9b),
                  fontSize: 16,
                  fontFamily: 'NotoSansKR',
                ),
              ),
            ]
        )
    );
  }
}
