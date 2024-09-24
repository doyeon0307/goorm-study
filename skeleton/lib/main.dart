import 'package:flutter/material.dart';
import 'package:skeleton/component.dart';
import 'package:skeletonizer/skeletonizer.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        extensions: const [
          SkeletonizerConfigData(),
        ],
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
        extensions: const [
          SkeletonizerConfigData.dark(),
        ],
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  bool loading = true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text("Skeletonizer"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: ListView(
          children: [
            const CustomText(label: "기본"),
            Skeletonizer(
              enabled: loading,
              child: const CustomListView(),
            ),
            const SizedBox(height: 16.0),
            const CustomText(label: "ignore container 옵션"),
            Skeletonizer(
              ignoreContainers: true,
              enabled: loading,
              child: const CustomListView(),
            ),
          ],
        ),
      ),
      floatingActionButton: CustomElevatedButton(
        onPressed: () => setState(() => loading = !loading),
      ),
    );
  }
}
