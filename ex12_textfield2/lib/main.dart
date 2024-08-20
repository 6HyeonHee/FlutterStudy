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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              '내용을 입력하세요.',
              style: TextStyle(
                fontSize: 30.0,
              ),
            ),
            /* TextField를 멀티 라인으로 지정하는 경우 화면 사이즈를 넘어가서
            제대로 표현되지 않는 경우가 생길 때 Expanded로 감싸준다.
            VSCode에서는 ctrl + .을 Android Studio에서는 Alt + Enter를 사용한다. */
            Expanded(
              child: TextField(
                // 입력할 문자열의 최대 길이 지정
                maxLength: 1000,
                // 입력 라인을 30줄로 지정
                maxLines: 30,
                decoration: const InputDecoration(
                  focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.greenAccent,
                      width: 1.0,
                    ),
                  ),
                  enabledBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.red,
                      width: 1.0,
                    ),
                  ),
                // labelText: '내용 입력',
                  // 주석 처리하면 입력 상자 우측 하단에 카운터가 활성화 된다.
                // counterText: '',
                  counterStyle: TextStyle(
                    fontSize: 20.0,
                    color: Colors.red,
                  ),
                ),
                onChanged: (text) {
                  print(text);
                },
                onSubmitted: (text) {
                  print('Submitted: $text');
                },
              ),
            ),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.purple[100],
              ),
              child: const Text(
                '키보드 내리기',
                style: TextStyle(
                  fontSize: 24,
                  color: Colors.white,
                ),
              ),
              onPressed: () => _onClick(),
            ),
          ],
        ),
      ),
    );
  }
  // 키보드 내리기: 키보드가 다른 위젯을 가릴 때 유용하게 사용된다.
  void _onClick() {
    FocusScope.of(context).unfocus();
  }
}