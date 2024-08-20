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

  // DropdownButton의 초기값을 위한 멤버변수
  String _chosenValue = 'Flutter';

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
            // html의 <select>와 유사한 형태의 위젯
            DropdownButton <String>(
              // TextStyle 지정
              style: const TextStyle(
                color: Colors.red,
              ),
              // 최초 실행 시 선택할 값 지정
              value: _chosenValue,
              // 구성 항목을 List를 통해 지정한 후 map 함수를 통해 반복
              items: [
                'Android',
                'IOS',
                'Flutter',
                'Node',
                'Java',
                'Python',
                'PHP',
              ].map((value) {
                // 콜백된 각 항목을 인스턴스로 만든 후 반환
                return DropdownMenuItem(
                  value: value,
                  child: Text(
                    value,
                  )
                );
              }).toList(),
              // DropdownButton의 가로 크기를 텍스트의 길이로 지정한다.
              hint: const Text(
                '힌트 글로 크기 조정하기',
              ),
              onChanged: (String? value) {
                /* Null-safey 체크가 반드시 필요하다.
                제거 시 에러가 발생한다.
                value로 null이 들어올 수 있음을 명시한다. */
                popupButtonSelected(value!);
                // 선택한 값으로 변경한 후 화면을 새롭게 렌더링
                setState(() {
                  _chosenValue = value;
                });
              },
            ),
            const SizedBox(
              height: 50,
            ),
            /* DropdownButton과 기능은 유사하고 UI만 조금 다른 위젯으로
            ... 메뉴로 표현된다. */
            PopupMenuButton(
              itemBuilder: (BuildContext context) =>
                <PopupMenuEntry<String>>[
                  // 각 항목의 텍스트와 값 설정
                  const PopupMenuItem(
                    child: Text('Child 0'),
                    value: 'Value 0'),
                  const PopupMenuItem(
                    child: Text('Child 1'),
                    value: 'Value 1'),
                  const PopupMenuItem(
                    child: Text('Child 2'),
                    value: 'Value 2'),
                ],
              // 항목 선택 시 이벤트 처리
              onSelected: popupMenuSelected,
            ),
          ],
        ),
      ),
    );
  }
  void popupButtonSelected(String value) {
    print(value);
  }
  void popupMenuSelected(String value) {
    print(value);
  }
}
