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
  // ToggleButton 선택 항목 구분용 리스트
  var isSelected1 = [false, false, true];
  var isSelected2 = [false, false, true];

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
            // multi-select
            const Text(
              'multi-select',
              textScaleFactor: 2,
            ),
            // ToggleButton 위젯
            ToggleButtons(
              // ToggleButton은 주로 아이콘으로 표현한다.
              children: const [
                Icon(Icons.account_circle),
                Icon(Icons.home),
                Icon(Icons.call),
              ],
              // 이벤트 리스너: 누른 버튼의 인덱스가 전달된다.
              onPressed: (int index) {
                setState(() {
                  /* !가 변수 앞에 있으므로 not(부정) 연산자로 사용된다.
                  !에 의해 선택한 항목이 토글된다. */
                  isSelected1[index] = !isSelected1[index];
                  // select된 항목 전체를 리스트로 출력
                  print('isSelected1: $isSelected1');
                  print('index: $index');
                });
              },
              // 각 버튼의 값으로 사용할 List를 설정
              isSelected: isSelected1,
            ),
            const SizedBox(
              height: 20,
            ),
            // single-select
            const Text(
              'single-select',
              textScaleFactor: 2,
            ),
            ToggleButtons(
              children: const [
                Icon(Icons.account_circle),
                Icon(Icons.home),
                Icon(Icons.call),
              ],
              onPressed: (int index) {
                setState(() {
                  // 전체 항목 중 선택한 하나만 토글한다.
                  for (var i=0; i<isSelected2.length; i++) {
                    // 사용자가 선택한 항목만 활성화
                    if (i == index) {
                      isSelected2[i] = true;
                    }
                    // 나머지는 모두 비활성화 처리
                    else {
                      isSelected2[i] = false;
                    }
                  }
                  print('isSelected2: $isSelected2');
                });
              },
              isSelected: isSelected2
            ),
          ],
        ),
      ),
    );
  }
}
