import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.blue),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: '### Flutter Basic ###'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        foregroundColor: Colors.white,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
                shadowColor: Colors.black,
                elevation: 5,
              ),
              /* MaterialBanner와 SnackBar의 차이점
              - MaterialBanner에는 duration이 없다. 따라서 수동으로 닫아야 한다.
              - SnackBar는 화면 위에 floating 되지만 MaterialBanner는 위젯을 밀어낸다. */
              onPressed: () {
                ScaffoldMessenger.of(context).showMaterialBanner(
                  MaterialBanner(
                    // 배너에 출력할 메세지
                    content: const Text('This is Material Banner'),
                    // 배너 좌측의 아이콘
                    leading: const Icon(Icons.info),
                    // 배경색
                    backgroundColor: Colors.yellow,
                    actions: [
                      TextButton(
                        // MaterialBanner를 숨김 처리 한다. 즉, 배너를 닫는다.
                        onPressed: () => ScaffoldMessenger.of(context).hideCurrentMaterialBanner(),
                        style: TextButton.styleFrom(
                          foregroundColor: Colors.blue,
                        ),
                        child: const Text('Close'),
                      ),
                    ],
                  ),
                );
              },
              child: const Text(
                'Banner',
                style: TextStyle(fontSize: 30),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
