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
  var isSelected1 = [false, false, true];
  var isSelected2 = [false, false, true];
  var isSelected3 = [false, false, true];

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
            ToggleButtons(
              children: const [
                Icon(Icons.account_circle),
                Icon(Icons.home),
                Icon(Icons.call),
              ],
              onPressed: (int index) {
                setState(() {
                  isSelected1[index] = !isSelected1[index];
                  print('isSelected1: $isSelected1');
                  print('index: $index');
                });
              },
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
                  for (var i=0; i<isSelected2.length; i++) {
                    if (i == index) {
                      isSelected2[i] = true;
                    }
                    else {
                      isSelected2[i] = false;
                    }
                  }
                  print('isSelected2: $isSelected2');
                });
              },
              isSelected: isSelected2
            ),
            const SizedBox(
              height: 20,
            ),
            const Text(
              'fancy',
              textScaleFactor: 2,
            ),
            ToggleButtons(
              borderColor: Colors.blueGrey,
              borderWidth: 10,
              // 선택된 버튼의 테두리
              selectedBorderColor: Colors.blue,
              // 버튼을 누를 때 잠깐 보이는 애니메이션 효과의 색
              splashColor: Colors.yellow,
              // 선택되지 않은 버튼의 아이콘 색
              color: Colors.red,
              // 선택된 버튼의 아이콘 색
              selectedColor: Colors.green,
              // 선택된 버튼의 배경 색
              fillColor: Colors.purple,
            // disabledColor: Colors.black,
              // 모서리 부분을 둥글게 처리
              borderRadius: BorderRadius.circular(10),
              children: const [
                Icon(Icons.account_circle),
                Icon(Icons.home),
                // 아이콘 대신 텍스트를 사용할 수 있다.
                Text('call'),
              ],
              onPressed: (int index) {
                setState(() {
                  // single-select 형태로 기능 구성
                  for (int i=0; i<isSelected3.length; i++) {
                    if (i == index) {
                      isSelected3[i] = true;
                    }
                    else {
                      isSelected3[i] = false;
                    }
                  }
                  print('isSelected3: $isSelected3');
                });
              },
              isSelected: isSelected3,
            ),
          ],
        ),
      ),
    );
  }
}
