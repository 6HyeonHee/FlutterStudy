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

  // Checkbox와 Switch에서 체크 여부 확인을 위한 멤버변수
  bool _chk1 = false;         // Non-Nullable로 선언
  bool? _chk2 = false;        // Nullable로 선언
  bool _chk3 = false;

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
            // Checkbox1: 필수사항만 기술한 기본 상태
            Checkbox(
              // 체크박스에서 사용할 값 설정
              value: _chk1,
              // check, uncheck 시 이벤트 발생
              onChanged: (bool? value) {
                /* 매개변수를 통해 null 값이 들어올 수 있으므로 Nullable로 선언하고
                변수에 할당 시 Null Check Operator를 추가하여
                null인 경우 Runtime Error를 발생시킨다. */
                setState(() {
                  _chk1 = value!;
                });
                print('Checkbox1: $_chk1');
              }
            ),
            // Checkbox2: 컬러 지정
            Checkbox(
              value: _chk2,
              // 체크되었을 때 체크의 색
              checkColor: Colors.white,
              // 체크되었을 때 배경 색
              activeColor: Colors.pink,
              /* _chk2는 Nullable로 선언되었으므로 null 값이 들어와도 허용되므로
              Null Check Operator 같은 별도의 처리가 필요 없다. */
              onChanged: (value) {
                setState(() {
                  _chk2 = value;
                });
                print('Checkbox2: $_chk2');
              }
            ),
            // Switch 위젯
            Switch(
              value: _chk3,
              // 스위치가 켜졌을 때 색
              activeColor: Colors.red,
              activeTrackColor: Colors.blue,
              // 스위치가 꺼졌을 때 색
              inactiveThumbColor: Colors.green,
              inactiveTrackColor: Colors.yellow,
              onChanged: (value) {
                setState(() {
                  _chk3 = value;
                });
                print('Switch: $_chk3');
              }
            ),
          ],
        ),
      ),
    );
  }
}
