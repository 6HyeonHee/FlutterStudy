import 'dart:ui';
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

  void getWindowSize() {
    // 앱 화면 논리적 크기 -> Size(411.4, 707.4)
    print(MediaQuery.of(context).size);
    // 화면 배율 -> 2.625             
    print(MediaQuery.of(context).devicePixelRatio);
    // 상단 상태 표시줄의 높이 -> 24.0
    print(MediaQuery.of(context).padding.top);
    // 앱 화면 실제 크기 -> Size(1080.0, 1857.0)
    print(window.physicalSize);                         
  }

  @override
  Widget build(BuildContext context) {

    // 화면의 사이즈 출력을 위한 메서드 호출
    getWindowSize();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      // 수직방향정렬
      body: Column(
        // 수직 방향에서 가운데 정렬
        mainAxisAlignment: MainAxisAlignment.center,
        // 가로 방향에서 좌측 정렬
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /* 현재 배율에 맞는 이미지가 없으므로 기본이미지를 출력한다.
          즉, 녹색이미지가 출력된다. 300a는 하나밖에 없는 상태이다. */
          Image.asset(
            'assests/images/300x300a.png',
          ),
          /* 해당 배율(3.0x)에 이미지가 있으므로 분홍이미지가 출력된다.
          만약 이미지가 하나밖에 없다면 노란이미지가 출력될 것이다.
          이처럼 현재 단말기의 화면 배율에 맞는 동일한 이름의 이미지가 있다면
          자동으로 선택해서 출력하게된다.
          크기를 지정하지 않으면 배율만큼 노란색 크기로 자동으로 줄어든다. */
          Image.asset(
            'assests/images/300x300b.png',
          ),
          /*
          해당 배율의 이미지라도 크기를 지정하면 지정한 크기가 적용된다.
          width 속성으로 이미지가 표현되는 상자의 크기를 지정하고,
          fit 속성으로 가로/세로 채움 여부를 결정할 수 있다.
           */
          Image.asset(
            'assests/images/300x300b.png',
            fit: BoxFit.fill,
            width: 150,
          ),
          Image.asset(
            'assests/images/300x300a.png',
            width: 100,
          ),
        ],
      ),
    );
  }
}
