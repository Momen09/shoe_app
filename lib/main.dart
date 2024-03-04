import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shoe_app/view/auth_screen/login_screen.dart';
import 'package:shoe_app/view/auth_screen/register_screen.dart';
import 'package:shoe_app/view/home_screen.dart';
import 'package:shoe_app/view/my_home_page.dart';
import 'package:shoe_app/view_model/home_view_model.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  final AdaptiveThemeMode? savedThemeMode;

  const MyApp({super.key, this.savedThemeMode});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers:  [
        ChangeNotifierProvider(create: (_) => HomeViewModel()),
      ],
      child: AdaptiveTheme(
        light: ThemeData(
          brightness: Brightness.light,
        ),
        dark: ThemeData(
          brightness: Brightness.dark,
        ),
        initial: savedThemeMode ?? AdaptiveThemeMode.light,
        builder: (theme, darkTheme) => MaterialApp(
            theme: theme,
            darkTheme: darkTheme,
            home: const MyHomePage(),
            debugShowCheckedModeBanner: false,
            routes: {
              LoginScreen.routeName: (context) => const LoginScreen(),
              RegisterScreen.routeName: (context) => const RegisterScreen(),
              HomeScreen.routeName: (context) =>  const HomeScreen(),
            }),
      ),
    );
  }
}
