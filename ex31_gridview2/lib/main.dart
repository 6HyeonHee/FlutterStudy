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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              // 컨테이너로 감싸서 크기를 지정하면 스크롤 가능
              Container(
                height: 300,
                // 그리드뷰 위젯
                child: GridView.count(
                  // 스크롤은 세로방향이 디폴트(생략가능)
                  // scrollDirection: Axis.vertical,
                  // 한줄에 출력할 아이템 갯수(크기는 자동으로 계산됨.)
                  crossAxisCount: 3,
                  // 아이템의 가로-세로 비율 설정(1이면 정사각형)
                  childAspectRatio: 1.5,
                  // 제너레이트 메서드를 통해 여러개의 아이템을 생성
                  children: List.generate(50, (index) {
                    return Container(
                      child: Card(color: Colors.blue,
                      ),
                    );
                  }),
                ),
              ),
              Container(
                height: 200,
                child: GridView.count(
                  // 수평방향으로 스크롤 설정
                  scrollDirection: Axis.horizontal,
                  crossAxisCount: 2,
                  children: List.generate(50, (index) {
                    return Container(
                      child: Card(
                        color: Colors.amber,
                      ),
                    );
                  }),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
