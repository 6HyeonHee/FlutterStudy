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
      body: Center(
        child: Container(
          margin: EdgeInsets.all(2.0),
          padding: EdgeInsets.all(10.0),
          /* 화면 크기보다 자식이 크면 화면의 크기로 맞춰진다. 아래
          2개의 속성을 주석처리하면 가로 화면이 꽉 채워진다.  */
          // width: 300,
          // height: 500,

          /* padding을 지정하면 여기서 지정한 색깔이 보이게 된다.
          즉 스크롤뷰의 배경색을 지정. */
          color: Colors.cyan,
          alignment: Alignment.topLeft,

          child: SingleChildScrollView(
            // 스크롤 방향 설정(수직)
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // 세로 화면을 벗어날 정도의 컨테이너를 추가한 후 테스트
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[700],
                  child: Text('Entry A', style: TextStyle(fontSize: 30)),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[500],
                  child: Text('Entry b', style: TextStyle(fontSize: 30)),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[300],
                  child: Text('Entry c', style: TextStyle(fontSize: 30)),
                ),
                Container(
                  width: double.infinity,
                  height: 200,
                  alignment: Alignment.center,
                  color: Colors.amber[100],
                  child: Text('Entry d', style: TextStyle(fontSize: 30)),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
