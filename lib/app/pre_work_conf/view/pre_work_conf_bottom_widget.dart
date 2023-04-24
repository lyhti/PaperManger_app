import '../../../common/ui.dart';

import 'package:flutter/material.dart';


class PreWorkConferenceBottomWidget extends StatelessWidget {

  const PreWorkConferenceBottomWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          TextButton(
              onPressed: ()  {
              },
              child: Text('저      장', style: TextStyle(color: Ui.commonColors()))
          ),
        ],
      ),
    );
  }
}
