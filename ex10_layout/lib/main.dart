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
      body: Column(
        children: [
          Expanded(
            flex: 1,
            child: Container(
              // Row에 배경색을 주고싶다면 Container로 감싼 후 지정
              color: Colors.yellow,
              // Row의 크기는 Container를 통해 지정
              width: 350,         // 크기를 지정하지 않으면 부모의 크기로 지정
              height: 100,        // 크기를 지정하지 않으면 자식의 크기로 지정
              // 가로형 배치 위젯 
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('Button 1')),
                  // 지정된 크기만큼 간격을 줌
                // SizedBox(width: 10),
                  // 가중치를 이용해서 간격을 조정
                // Spacer(flex: 1),
                  ElevatedButton(onPressed: () {}, child: const Text('Button 2')),
                // SizedBox(width: 10),
                // Spacer(flex: 2),
                  ElevatedButton(onPressed: () {}, child: const Text('Button 3')),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 2,
            // 컨테이너를 복제할 때는 children으로 감싼 후 복제해야 한다.
            child: Container(
              color: Colors.cyan,
              width: 350,
              height: 100,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                // 수직 방향에서 아래쪽으로 정렬
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  ElevatedButton(onPressed: () {}, child: const Text('Button 1')),
                  ElevatedButton(onPressed: () {}, child: const Text('Button 2')),
                  ElevatedButton(onPressed: () {}, child: const Text('Button 3')),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
