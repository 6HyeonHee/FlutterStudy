import 'package:flutter/material.dart';
// dart 파일을 모듈화 하는 경우 경로를 통해 임포트한다.
import 'page1.dart';

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
      /* 최초앱을 실행하여 Page1 인스턴스를 생성 후 화면에 렌더링할 때
      '시작'이라는 파라미터를 전달한다. 즉 생성자를 호출하여 인스턴스를 생성하는 것이다. */
      home: Page1(data: '시작'),
    );
  }
}

/* 
### 내가 이해한대로 쓰는 동작 원리 ### 
Stack에 Page1 생성 => 2페이지 추가버튼 클릭 (파라미터 전달 page1 -> page2로) 
=> Stack에 Page2 생성 => 3페이지로 변경 클릭 (파라미터 전달 page2 -> page3로)
=> Page3 생성과 동시에 Page2 삭제됨. => 따라서 page1->page2로 전달된 파라미터도 실종
=> 2페이지로 변경 (위와 같은 원리) => 2페이지 제거 클릭 
=> 파라미터 실종으로 Null값이라 뜸

Stack에 Page1 생성 => 2페이지 추가버튼 클릭 (파라미터 전달 page1 -> page2로) 
=> 2페이지 제거 버튼 클릭 => 전달된 파라미터가 뜸
*/