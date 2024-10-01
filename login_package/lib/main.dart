import 'package:animated_login/animated_login.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return AnimatedLogin(
      logo: Image.asset("asset/flutter.png"),
      loginMobileTheme: LoginViewTheme(
        backgroundColor: Colors.black54,
        welcomeTitleStyle: const TextStyle(
          color: Colors.blue,
        ),
        welcomeDescriptionStyle: const TextStyle(
          color: Colors.blueGrey,
        ),
        formFieldBorderRadius: BorderRadius.circular(
          20.0,
        ),
        forgotPasswordStyle: const TextStyle(
          color: Colors.blueGrey,
        ),
        showLoadingSocialButton: true,
        enabledBorderColor: Colors.grey,
        focusedBorderColor: Colors.blue,
        errorBorderColor: Colors.red,
        textFormStyle: const TextStyle(
          color: Colors.white,
        ),
      ),
      socialLogins: [
        SocialLogin(
          iconPath: "asset/kakaotalk.png",
          callback: () => tmp(),
        ),
        SocialLogin(
          iconPath: "asset/google.png",
          callback: () => tmp(),
        ),
      ],
      onLogin: (loginData) async {
        if (loginData.email == "flutter@pub.dev" &&
            loginData.password == "Pw1234") {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text(
                "로그인 성공!",
              ),
            ),
          );
        } else {
          showDialog(
            context: context,
            builder: (context) => const AlertDialog(
              title: Text(
                "로그인 실패..",
              ),
            ),
          );
        }
      },
    );
  }
}

Future<String> tmp() async {
  return "";
}
