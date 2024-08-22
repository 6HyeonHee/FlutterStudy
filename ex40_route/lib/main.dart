import 'package:flutter/material.dart';
import 'page1.dart';
import 'page2.dart';
import 'page3.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      /* home과 initialRoute를 통시에 사용하는 home은 무시된다.
      즉 우선순위가 낮으므로 사용할 수 없다. 단, 에러가 발생하진 않는다. */
      // 일반적인 앱에서 시작 페이지를 지정하는 프로퍼티
      // home: Page2(data: '시작2'),

      // Route 사용 시 시작 페이지를 지정하는 프로퍼티
      initialRoute: '/page1',

      /* 각 페이지에 대한 Route처리는 Map을 사용한다.
      각 페이지에 대한 인스턴스 생성시 data를 통해 파라미터를 전달하고 있다. */
      routes: {
        '/page1' : (context) => Page1(data: '시작'),
        '/page2' : (context) => Page2(data: '1페이지에서 보냄 (1->2)'),
        '/page3' : (context) => Page3(data: '1페이지에서 보냄 (1->3)'),
      },
    );
  }
}

