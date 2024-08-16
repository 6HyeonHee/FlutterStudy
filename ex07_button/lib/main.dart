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
      home: const MyHomePage(title: 'Flutter 기본형'),
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
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton (
              // 버튼에 출력할 텍스트를 위젯을 통해 설정
              child: const Text('Button #1', style: TextStyle(fontSize: 24)),
              // 터치 했을 떄의 기능 구현. 익명 함수를 통해 직접 구현
              onPressed: () {
                print("첫번째 버튼이 클릭됨");
              },
            ),
            ElevatedButton(
              child: const Text('Button #2', style:  TextStyle(fontSize: 24)),
              // 익명함수내에서 별도 정의한 함수를 호출.
              onPressed: (){
                _onClick();
              }, 
            ),
            ElevatedButton(
              child: const Text('Button #3', style:  TextStyle(fontSize: 24)),
              // 람다 형태로 함수를 호출.
              onPressed: ()=>_onClick(),
            ),
            ElevatedButton(
              child: const Text('Button #4', style:  TextStyle(fontSize: 24)),
              // 함수이름을 직접 대입해서 호출.
              onPressed: _onClick,
            ),
          ],
        ),
      ),
    );
  }

  // 버튼 클릭 시 호출할 메서드 정의
  void _onClick(){
    print("버튼이 클릭됨");
  }
}
