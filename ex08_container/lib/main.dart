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
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              // 지정한 방향에만 margin을 적용
              margin: const EdgeInsets.only(left: 10, top: 10),
              // 상하좌우 모든 방향에 padding을 적용
              padding: const EdgeInsets.all(0.0),
              color: Colors.yellow,
              // 가로 크기를 지정하지 않으면 부모의 크기만큼 적용된다.
            // width: 300,
              // 세로 크기를 지정하지 않으면 자식의 크기만큼 적용된다.
              height: 100,
              // 정렬은 자식 위젯(= child)에 설정된다.
              alignment: Alignment.topLeft,
              child: const Text(
                '홍길동',
                style: TextStyle(
                  fontSize: 30, color: Colors.blue)),
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              // 자식과의 패딩으로 크기가 정해진다.
              padding: const EdgeInsets.all(80.0),
              alignment: Alignment.center,
              // 컨테이너의 모양을 결정하는 속성
              decoration: const BoxDecoration(
                // 박스 모양을 원으로 표현
                shape: BoxShape.circle,
                color: Colors.blue),
              child: const Text(
                '전우치',
                style: TextStyle(
                  fontSize: 30, color: Colors.white)),
            ),
            Container(
              margin: const EdgeInsets.all(0.0),
              padding: const EdgeInsets.all(0.0),
              width: 400,
              height: 100,
              // 자식 위쳇을 우측 하단으로 정렬
              alignment: Alignment.bottomRight,
              decoration: const BoxDecoration(
                // 박스의 모양을 사각형으로 설정
                shape: BoxShape.rectangle,
                color: Colors.brown),
              child: const Text(
                '손오공',
                style: TextStyle(
                  fontSize: 30, color: Colors.white)),
            ),
            // 컨테이너 사이에 간격을 주기 위함 
            const SizedBox(
              height: 5),
            Container(
              // 이미지 버튼의 크기 지정
              width: 100.0,
              height: 40.0,
              // decoration을 통해 컨테이너에 이미지 삽입
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/300x100.png')),
              ),
              // TextButton으로 마치 이미지 버튼과 같은 효과를 적용
              child: TextButton(
                // Text에 문자열을 넣으면 이미지 위에 나타나게 되므로 빈 문자열로 처리
                child: const Text(''),
                onPressed: () => _onClick(1),
              ),
            ),
            const SizedBox(
              height: 5),
            Ink.image(
              image: const AssetImage('assets/images/300x100.png'),
              width: 100.0,
              height: 40.0,
            // fit: BoxFit.fill,
              /* InkWell 위젯
              : Text와 같이 제스처 기능을 제공하지 않는 위젯을 래핑하여 onTap 기능을 제공한다.
              터치했을 때 물결 모양의 애니메이션 효과가 발생된다. */  
              child: InkWell(
              // child: Text(''),
                onTap: () => _onClick(2)),
            ),
          ],
        ),
      ),
    );
  }

  void _onClick(int num) {
    print('Hello $num!');
  }
}