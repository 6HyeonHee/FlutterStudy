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
      body: GridView.count(
        // 전체 화면에서의 패딩
        padding: const EdgeInsets.all(10),
        // 아이템 간의 수평 간격
        crossAxisSpacing: 10,
        // 아이템 간의 수직 간격
        mainAxisSpacing: 10,
        // 한줄에 표시할 컨테이너 갯수
        crossAxisCount: 3,
        children: [
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[100],
            child: const Text("1"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[200],
            child: const Text("2"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[300],
            child: const Text("3"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[400],
            child: const Text("4"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[500],
            child: const Text("5"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[600],
            child: const Text("6"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[100],
            child: const Text("1"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[200],
            child: const Text("2"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[300],
            child: const Text("3"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[400],
            child: const Text("4"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[500],
            child: const Text("5"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[600],
            child: const Text("6"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[100],
            child: const Text("1"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[200],
            child: const Text("2"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[300],
            child: const Text("3"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[400],
            child: const Text("4"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[500],
            child: const Text("5"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[600],
            child: const Text("6"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[100],
            child: const Text("1"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[200],
            child: const Text("2"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[300],
            child: const Text("3"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[400],
            child: const Text("4"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[500],
            child: const Text("5"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[600],
            child: const Text("6"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[100],
            child: const Text("1"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[200],
            child: const Text("2"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[300],
            child: const Text("3"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[400],
            child: const Text("4"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[500],
            child: const Text("5"),
          ),
          Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.all(8),
            color: Colors.blue[600],
            child: const Text("6"),
          ),
        ],
      )
    );
  }
}
