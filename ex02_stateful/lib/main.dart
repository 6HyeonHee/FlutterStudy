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
  // 멤버변수
  int _counter = 0;
  String name = "홍길동";

  // 멤버메서드
  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }


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
          children: <Widget>[

            // 전체가 상수
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              // 변수는 문자열 내부에 입력시 $를 사용한다.
              '$name 클릭한 수 : $_counter',
              // '이름 : $name',
              style:  Theme.of(context).textTheme.headlineMedium,
            ),
            // 스타일이 동적으로 변한다.
            Text(
              '홍길동',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton (
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

// class MyTjoeun extends StatefulWidget {
//   const MyTjoeun({super.key});

//   @override
//   State<MyTjoeun> createState() => _MyTjoeunState();
// }

// class _MyTjoeunState extends State<MyTjoeun> {
//   @override
//   Widget build(BuildContext context) {
//     return const Placeholder();
//   }
// }