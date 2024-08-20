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
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
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

  // SnackBar에서 사용할 메세지
  String msg = 'Hello World!';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              // 버튼 클릭 시 실행할 함수 직접 정의
              onPressed: () {
                // ScaffoldMessenger를 통해 직접 SnackBar를 띄운다.
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(
                    // SnackBar에 표시할 메세지
                    content: Text(msg),
                    // 떠있는 시간을 1초로 설정
                    duration: const Duration(milliseconds: 1000),
                  ),
                );
              },
              child: const Text(
                'SnackBar Basic',
                style: TextStyle(fontSize: 24),
              ),
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              // 버튼 클릭 시 람다 형식으로 외부 함수 호출
              onPressed: () => callSnackBar('안녕하세요 홍길동님'),
              child: const Text(
                'SnackBar Option',
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
      ),
    );
  }
  // SnackBar의 옵션 설정
  callSnackBar(msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        // 메세지 내용, 텍스트에 스타일까지 지정
        content: Text(
          msg,
          style: const TextStyle(color: Colors.black),
        ),
        // SnackBar의 배경색
        backgroundColor: Colors.yellow[800],
        // 떠있는 시간 설정
        duration: const Duration(milliseconds: 2000),
        // SnackBar에 별도의 텍스트 버튼 추가 가능
        action: SnackBarAction(
          label: 'Close',
          textColor: Colors.black,
          onPressed: () {
            print('SnackBar Closed');
          },
        ),
        // floating 여부: 아래 부분에서 살짝 띄워준다.
      // behavior: SnackBarBehavior.floating,
        // SnackBar의 모서리 부분을 둥글게 커스텀 한다.
      // shape: RoundedRectangleBorder(
      //   borderRadius: BorderRadius.circular(20),
      //   side: BorderSide(
      //     color: Colors.red,
      //     width: 2,
      //   ),
      // ),
      ),
    );
  }
}
