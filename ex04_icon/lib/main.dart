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
      // 위젯들을 수평방향으로 배치할때 사용하는 레이아웃 위젯
      body: Row(
        // <Widget>은 생략 가능함.
        children: const[
          Icon(
            Icons.camera_alt,
            color: Colors.red,
            size: 55.0,
          ),
          Icon(
            Icons.cancel,
            color: Colors.orange,
            size:55.0,
          ),
          Icon(
            Icons.ac_unit,
            color: Colors.yellow,
            size: 55.0,
          ),
          Icon(
            Icons.access_alarm,
            color: Colors.green,
            size: 55.0,
          ),
          Icon(
            Icons.account_circle,
            color: Colors.blue,
            size: 55.0,
          ),
          Icon(
            Icons.add_a_photo,
            color: Colors.purple,
            size: 55.0,
          ),Icon(
            Icons.add_call,
            color: Colors.pink,
            size: 55.0,
          ),
          Icon(
            Icons.add_location,
            color: Colors.black,
            size: 55.0,
          ),
        ],
      ),
    );
  }
}
