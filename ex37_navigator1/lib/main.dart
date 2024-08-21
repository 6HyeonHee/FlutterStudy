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
      // 개발자가 직접 정의한 Page1 클래스를 이요해서 첫화면 구성
      home: const Page1(),
    );
  }
}

/* stful 단축키를 통해 자동생성 (Page1 과 Page1State 클래스가 동시에 생성) */
class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  State<Page1> createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    print('Page1');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* 1페이지에서는 아무것도 없는 상태이므로 2페이지를
            Stack에 추가하는 기능만 있다. */
            ElevatedButton(
              onPressed: () {
                // 버튼을 누르면 두번째 페이지를 팝업처럼 추가한다.
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const Page2()),
                );
              }, 
              child: const Text('2페이지 추가', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }
}

class Page2 extends StatefulWidget {
  const Page2({Key? key}) : super(key: key);

  @override
  State<Page2> createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    print('Page1');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* 새로운 페이지를 Stack에 추가한다. push()를 통해 추가된
            페이지에는 최상단에 Back(제거) 버튼이 자동으로 생성된다. */
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context, 
                  MaterialPageRoute(builder: (context) => const Page3()),
                );
              },
              child: const Text('3페이지 추가', style: TextStyle(fontSize: 24)),
            ),
            /* 페이지를 Stack에서 제거한다. */
            ElevatedButton( 
              child: const Text('2페이지 제거', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                print('Page2-pop');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}

class Page3 extends StatefulWidget {
  const Page3({Key? key}) : super(key: key);

  @override
  State<Page3> createState() => _Page3State();
}

class _Page3State extends State<Page3>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  Widget build(BuildContext context) {
    print('Page1');
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton( 
              child: const Text('3페이지 제거', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.orange,
              ),
              onPressed: () {
                print('Page3-pop');
                Navigator.pop(context);
              },
            ),
          ],
        ),
      ),
    );
  }
}