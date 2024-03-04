import 'package:flutter/material.dart';

import '../../consts/kNetwork.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return       Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
            height: 75, child: Image.asset(KNetwork.LogoImage)),
        const Text(
          'S',
          style: TextStyle(color: Colors.white, fontSize: 75),
        ),
        const Column(
          children: [
            Text('hoes',
                style:
                TextStyle(color: Colors.white, fontSize: 20)),
            Text('hope',
                style:
                TextStyle(color: Colors.white, fontSize: 20)),
          ],
        )
      ],
    );
  }
}
