import 'package:flutter/material.dart';

class CustomText extends StatelessWidget {
  final String label;

  const CustomText({super.key, required this.label});

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 16.0,
      ),
    );
  }
}

class CustomElevatedButton extends StatelessWidget {
  final VoidCallback onPressed;

  const CustomElevatedButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onPressed,
      style: ElevatedButton.styleFrom(
        overlayColor: Colors.black,
        backgroundColor: Colors.white,
      ),
      child: const Icon(
        Icons.autorenew_rounded,
        color: Colors.black,
        size: 28.0,
      ),
    );
  }
}

class CustomListView extends StatelessWidget {
  const CustomListView({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400.0,
      child: ListView.builder(
        itemCount: 5,
        itemBuilder: (context, index) {
          return Card(
            child: ListTile(
              title: Text('${index + 1}번 항목의 제목'),
              subtitle: const Text('기타 설명'),
              trailing: const Icon(Icons.call),
            ),
          );
        },
      ),
    );
  }
}
