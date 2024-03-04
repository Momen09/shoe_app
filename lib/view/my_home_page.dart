import 'package:flutter/material.dart';
import 'package:shoe_app/view/auth_screen/login_screen.dart';
import 'package:shoe_app/view/auth_screen/register_screen.dart';
import 'package:shoe_app/view/widgets/auth_image.dart';
import 'package:shoe_app/view/widgets/button_widget.dart';
import 'package:shoe_app/view/widgets/logo_widget.dart';


class MyHomePage extends StatefulWidget {
  const MyHomePage({
    super.key,
  });

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            const AuthImage(),
            Center(
              child: Padding(
                padding: const EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(height: MediaQuery.of(context).size.height*0.07,),
                    const LogoWidget(),
                    const Spacer(),
                    ButtonWidget(
                      name: 'LOGIN',
                      backgroundColor: Theme.of(context).shadowColor,
                      onPressed: () {
                        Navigator.pushNamed(context, LoginScreen.routeName);
                      },
                      textColor: Colors.white,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    ButtonWidget(
                      name: 'REGISTER',
                      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
                      onPressed: () {
                        Navigator.pushNamed(context, RegisterScreen.routeName);
                      },
                      textColor: Colors.black,
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
