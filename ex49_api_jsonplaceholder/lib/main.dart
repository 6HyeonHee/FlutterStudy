import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                getRequest();
              }, 
              child: const Text('jsonplaceholder 파싱1', style: TextStyle(fontSize: 24)),
            ),
            ElevatedButton(
              onPressed: () {
                getRequest2();
              }, 
              child: const Text('jsonplaceholder 파싱2', style: TextStyle(fontSize: 24)),
            ),
          ],
        ),
      ),
    );
  }

  void getRequest() async {
    // API 사이트에서 하나의 게시물을 얻어온 후 파싱
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts/1");
    /* get 방식의 요청을 통해 응답이 올 때까지 기다린 후 콜백데이터 저장 */
    http.Response response = await http.get(
      url,
      headers: {"Accept" : "application/json"}
    );

    // 응답데이터
    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);

    // 1차 파싱
    var jsonData = jsonDecode(responseBody);

    // 각 key를 이용해서 데이터 인출
    String userId = jsonData['userId'].toString();
    String id = jsonData['id'].toString();
    String title = jsonData['title'];
    String body = jsonData['body'];

    // 콘솔에 결과 출력
    print("userId : $userId");
    print("id : $id");
    print("title : $title");
    print("body : $body");
  }

void getRequest2() async {
    // API 사이트에서 하나의 게시물을 얻어온 후 파싱
    var url = Uri.parse("https://jsonplaceholder.typicode.com/posts");
    
    /* get 방식의 요청을 통해 응답이 올 때까지 기다린 후 콜백데이터 저장 */
    http.Response response = await http.get(
      url,
      headers: {"Accept": "application/json"},
    );

    // 응답 데이터
    var statusCode = response.statusCode;
    var responseBody = utf8.decode(response.bodyBytes);

    // 1차 파싱
    var jsonData = jsonDecode(responseBody);

    // 전체 게시물에 접근하여 출력
    for (var post in jsonData) {
      // 각 key를 이용해서 데이터 인출
      String userId = post['userId'].toString();
      String id = post['id'].toString();
      String title = post['title'];
      String body = post['body'];

      // 콘솔에 결과 출력
      print("userId : $userId");
      print("id : $id");
      print("title : $title");
      print("body : $body");
      print("================================");
    }
  } 
}
