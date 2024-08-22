import 'package:flutter/material.dart';
// 디펜던시 설정 후 프로바이더 사용을 위한 임포트
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    /* 기본형인 MaterialApp을 Provider로 감싸면 앱 전체에서
    사용할 수 있는 공유데이터가 된다. */
    return Provider<String>.value(
      value: '홍길동',
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        // 첫페이지 설정
        home: const Page1(),
      ),
    );
  }
}

// stful로 새로운 페이지 설정
class Page1 extends StatefulWidget {
  const Page1({super.key});

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  // 공유 데이터를 읽어 저장할 멤버변수 선언
  String data = '';

  @override
  Widget build(BuildContext context) {
    // 데이터 사용
    // listen: false - 변경에 대한 알림받지 않기
    // dat = Provider.of<String>(context, listen: false);

    // 프로바이더를 통해 공유 데이터를 얻어온다.
    data = Provider.of<String>(context);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // 버튼을 누르면 Page2를 스택에 추가한다.
            ElevatedButton(
              child: const Text('2페이지 추가', style: TextStyle(fontSize: 24)),
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const Page2()),
                );
              },
            ),
            // 공유 데이터 출력 부분
            Text('$data', style: const TextStyle(fontSize: 30)),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({super.key});

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text('2페이지 제거', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
            /* 공유 데이터 사용 : 데이터의 변경이 일어나면 builder에 지정된
            익명함수가 호출되고 지정된 위젯만 새롭게 렌더링된다. */
            Consumer<String>(
              builder: (context, value, child) {
                print("111111");
                return Text('$value', style: const TextStyle(fontSize: 30));
              }
            ),
          ],
        ),
      ),
    );
  }
}