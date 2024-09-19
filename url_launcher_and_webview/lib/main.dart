import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:url_launcher_and_webview/webview_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  String? encodeQueryParameters(Map<String, String> params) {
    return params.entries
        .map((MapEntry<String, String> e) =>
            '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
        .join('&');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Url launcher"),
        centerTitle: true,
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () async {
                  final Uri webLaunchUrl = Uri(
                    scheme: "https",
                    path: "naver.com",
                  );
                  try {
                    launchUrl(webLaunchUrl);
                  } catch (e) {
                    Exception(e);
                  }
                },
                child: const Text("웹 브라우저"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final Uri emailLaunchUri = Uri(
                    scheme: "mailto",
                    path: "dodo03@khu.ac.kr",
                    query: encodeQueryParameters(<String, String>{
                      "subject": "제목 입력",
                      "body": "본문 입력",
                    }),
                  );
                  try {
                    launchUrl(emailLaunchUri);
                  } catch (e) {
                    Exception(e);
                  }
                },
                child: const Text("메일"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final Uri smsLaunchUri = Uri(
                    scheme: "sms",
                    path: "010 1122 3344",
                    query: encodeQueryParameters(<String, String>{
                      "body": "본문 입력",
                    }),
                  );
                  try {
                    launchUrl(smsLaunchUri);
                  } catch (e) {
                    Exception(e);
                  }
                },
                child: const Text("문자"),
              ),
              ElevatedButton(
                onPressed: () async {
                  final Uri telLaunchUri = Uri(
                    scheme: "tel",
                    path: "010 1122 3344",
                  );
                  try {
                    launchUrl(telLaunchUri);
                  } catch (e) {
                    Exception(e);
                  }
                },
                child: const Text("전화"),
              ),
              ElevatedButton(
                onPressed: () => Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => WebviewScreen(),
                  ),
                ),
                child: const Text("웹뷰로 이동"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
