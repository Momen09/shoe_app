import 'package:flutter/material.dart';
import 'package:shoe_app/view/widgets/auth_image.dart';

import '../home_screen.dart';
import '../widgets/auth_textField_widget.dart';
import '../widgets/auth_widget.dart';
import '../widgets/logo_widget.dart';

class RegisterScreen extends StatelessWidget {
  const RegisterScreen({super.key});

  static const routeName = 'RegisterScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          AuthImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.13,
                ),
                const LogoWidget(),
                Padding(
                  padding: const EdgeInsets.fromLTRB(40, 5, 40, 20),
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12.0),
                      color: Colors.white,
                    ),
                    width: MediaQuery.of(context).size.width * 0.9,
                    height: MediaQuery.of(context).size.height * 0.7,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Sign Up!',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const Text('Create an new account'),
                          const SizedBox(
                            height: 30,
                          ),
                          const TextFieldWidget(
                            textField: 'Enter your user name',
                            jj: false,
                            labelText: 'User Name',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const TextFieldWidget(
                            textField: 'Enter your Email',
                            jj: false,
                            labelText: 'Email',
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          const TextFieldWidget(
                            textField: 'Enter your password',
                            jj: true,
                            labelText: 'Password',
                          ),
                          const SizedBox(
                            height: 25,
                          ),
                          AuthWidget(
                            context: context,
                            backColor: Colors.black,
                            text: 'Register',
                            textColor: Colors.white,
                            borderSideColor: Colors.black,
                            onPressed: () {
                              Navigator.pushNamed(context, HomeScreen.routeName);
                            },
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Divider(
                            thickness: 0,
                            color: Colors.black,
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AuthWidget(
                            context: context,
                            backColor: Color(0xff3B5999),
                            text: 'Continue with facebook',
                            textColor: Colors.white,
                            borderSideColor:
                                Theme.of(context).scaffoldBackgroundColor,
                            onPressed: () {},
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          AuthWidget(
                            context: context,
                            backColor: Colors.white,
                            text: 'Continue with Google',
                            textColor: Colors.black,
                            borderSideColor: Colors.black,
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
