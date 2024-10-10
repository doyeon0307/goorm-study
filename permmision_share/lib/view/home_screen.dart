import 'package:flutter/material.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:permmision_share/component/custom_text_button.dart';
import 'package:share_plus/share_plus.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
      ),
      backgroundColor: Colors.white,
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CustomTextButton(
              label: "Permission",
              onPressed: getPermission,
            ),
            SizedBox(
              height: 16.0,
            ),
            CustomTextButton(
              label: "Share",
              onPressed: share,
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> getPermission() async {
  var status = await Permission.notification.status;
  print(status);
  if (status.isDenied) {
    var result = await Permission.notification.request();
    print(result);
  }
}

Future<void> share() async {
  var share = await Share.share('welcome to my github! "https://github.com/doyeon0307"');
  print("status: ${share.status}\nraw: ${share.raw}");
}