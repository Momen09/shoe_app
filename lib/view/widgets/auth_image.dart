import 'package:flutter/material.dart';

import '../../consts/kNetwork.dart';

class AuthImage extends StatelessWidget {
  const AuthImage({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        KNetwork.AuthImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
