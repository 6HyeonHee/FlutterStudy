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
      home: const Page1(),
    );
  }
}

class Page1 extends StatefulWidget {
  const Page1({Key? key}) : super(key: key);

  @override
  _Page1State createState() => _Page1State();
}

class _Page1State extends State<Page1> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 1'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /* 2페이지로 전환됨. 즉 Stack에 쌓이지 않고 교체된다. */
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const Page2(),
// 화면이 전환되는 시간 설정(초단위)
// transitionDuration: const Duration(seconds: 0),

// 전환 시간을 밀리세컨즈로 설정
transitionDuration: const Duration(milliseconds: 1000),
// 화면전환 애니메이션 설정
transitionsBuilder: (context, animation, secondaryAnimation, child) {
  /*
  Offset(0.0, 1.0)  : 하단에서 올라옴
  Offset(0.0, -1.0) : 상단에서 내려옴
  Offset(1.0, 0.0)  : 오른쪽에서 나옴
  Offset(-1.0, 0.0) : 왼쪽에서 나옴
  */
  var begin = Offset(1.0, 0.0);
  var end = Offset.zero; // Offset(0.0, 0.0)과 동일함.
  var curve = Curves.easeInOut;
  // 시작, 종료, 커브까지 지정하여 트윈 변수 생성
  var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
  // 화면이 전환(교체)될 때 적용
  var offsetAnimation = animation.drive(tween);
  return SlideTransition(position: offsetAnimation, child: child,);
}
                    ),
                );
              }, 
              child: const Text('2페이지로 교체', style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              child: const Text('3페이지로 교체', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, anim2) => const Page3(),
                    transitionDuration: const Duration(seconds: 0),
                  ),
                );
              }, 
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
  _Page2State createState() => _Page2State();
}

class _Page2State extends State<Page2> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 2'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, animation2) => const Page3(),
                    transitionDuration: const Duration(seconds: 0),
                    ),
                );
              }, 
              child: const Text('3페이지로 교체', style: TextStyle(fontSize: 24)),
              
            ),
            ElevatedButton(
              child: const Text('1페이지로 교체', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, animation2) => const Page1(),
                    transitionDuration: const Duration(seconds: 0),
                    ),
                );
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
  _Page3State createState() => _Page3State();
}

class _Page3State extends State<Page3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Page 3'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, animation2) => const Page1(),
                    transitionDuration: const Duration(seconds: 0),
                    ),
                );
              }, 
              child: const Text('1페이지로 교체', style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacement(
                  context, 
                  PageRouteBuilder(
                    pageBuilder: (context, anim1, animation2) => const Page2(),
                    transitionDuration: const Duration(seconds: 0),
                    ),
                );
              }, 
              child: const Text('2페이지로 교체', style: TextStyle(fontSize: 24)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
            ),
          ],
        ),
      ),
    );
  }
}