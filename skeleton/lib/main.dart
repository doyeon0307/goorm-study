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
    return const MaterialApp(
      title: 'Flutter Demo',
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
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
            const CustomText(label: "기본 + radius, color 조절"),
            Skeletonizer(
              enabled: loading,
              textBoneBorderRadius: TextBoneBorderRadius(
                BorderRadius.circular(0.0),
              ),
              effect: const ShimmerEffect(
                baseColor: Colors.yellow,
                highlightColor: Colors.red,
              ),
              child: const CustomListView(),
            ),
            const SizedBox(height: 16.0),
            const CustomText(
                label: "ignore container 옵션: 배경 무시  + PulseEffect"),
            Skeletonizer(
              effect: const PulseEffect(
                from: Colors.yellowAccent,
                to: Colors.orangeAccent,
                duration: Duration(
                  milliseconds: 500,
                ),
              ),
              ignoreContainers: true, // 배경 무시
              enabled: loading,
              child: const CustomListView(),
            ),
            const SizedBox(height: 16.0),
            const CustomText(label: "leaf: 하위 위젯을 하나로 뭉갬"),
            Skeletonizer(
              ignoreContainers: true, // 배경 무시
              enabled: loading,
              child: SizedBox(
                height: 250.0,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Skeleton.leaf(
                      child: Card(
                        child: ListTile(
                          title: Text('${index + 1}번 항목의 제목'),
                          subtitle: const Text('기타 설명'),
                          trailing: const Skeleton.keep(
                            // 특정 위젯은 그대로 보여줌
                            child: Icon(Icons.call),
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const CustomText(label: "ignore: 특정 위젯을 로딩 중 보이지 않게 함 + SoldColorEffect"),
            Skeletonizer(
              effect: const SoldColorEffect(
                color: Colors.blueGrey,
              ),
              enabled: loading,
              child: SizedBox(
                height: 250.0,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('${index + 1}번 항목의 제목'),
                        subtitle: const Text('기타 설명'),
                        trailing: const Skeleton.ignore(
                          // 특정 위젯은 로딩에서 숨김
                          child: Icon(Icons.call),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const CustomText(label: "keep: 특정 위젯은 로딩 중에도 그대로 보여줌"),
            Skeletonizer(
              enabled: loading,
              child: SizedBox(
                height: 250.0,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('${index + 1}번 항목의 제목'),
                        subtitle: const Text('기타 설명'),
                        trailing: const Skeleton.keep(
                          // 특정 위젯은 그대로 보여줌
                          child: Icon(Icons.call),
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
            const SizedBox(height: 16.0),
            const CustomText(label: "shade: keep에 투명도 처리"),
            Skeletonizer(
              enabled: loading,
              child: SizedBox(
                height: 250.0,
                child: ListView.builder(
                  itemCount: 3,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        title: Text('${index + 1}번 항목의 제목'),
                        subtitle: const Text('기타 설명'),
                        trailing: const Skeleton.shade(
                          // 특정 위젯은 그대로 보여줌
                          child: Icon(Icons.call),
                        ),
                      ),
                    );
                  },
                ),
              ),
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
